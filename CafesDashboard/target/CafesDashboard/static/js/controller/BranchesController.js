'use strict';

App.controller('BranchesController', [
        '$scope',
        'BranchesService',
        '$timeout',
        'StoresService',
        '$http',
        '$route',
        function ($scope, BranchesService, $timeout, StoresService, $http,
                $route) {
            var self = this;
            $scope.showBranch = false;
            $scope.mymsg = '';
            self.branch = {
                id : null,
                uuid : '',
                updatedAt : null,
                createdAt : null,
                open : null,
                close : null,
                isDeleted : 0,
                description : '',
                branchCode : '',
                store : null,
                city : '',
                country : '',
                address : '',
                telephone : null,
                operation : '',
                logo : '',
                latitude : '',
                langitude : ''

            };
            $scope.branches = [];
            $scope.currentActiveOperation = 'add'
            $scope.title = 'Branches';

            fetchAllBranches();
            fetchAllStores();
            fetchAllCountriesWithStatus();
            $scope.reverse = function () {

                $scope.clicked = !$scope.clicked;

            }
            function fetchAllCountriesWithStatus() {
                $http.get(CONTEXT + "/get-countries").then(function (response) {
                    $scope.allCountries = response.data;
                }, function (errResponse) {
                    console.error('Error while fetching Users');
                    deferred.reject(errResponse);
                });

            }

            $scope.loadStatesByCID = function (id) {
                $http.get(CONTEXT + "/get-cities/" + id).then(
                        function (response) {
                            $scope.statez = response.data;
                        }, function (errResponse) {
                            console.error('Error while fetching Users');
                            deferred.reject(errResponse);
                        });

            }

            function fetchAllStores() {
                StoresService.fetchAllStores().then(function (d) {
                    $scope.stores = d;
                }, function (errResponse) {
                    console.error('Error while fetching Roles');
                });
            }

            function fetchAllBranches() {
                BranchesService.fetchAllBranches().then(function (d) {
                    $scope.showRole = false;
                    $scope.showDeletion = false;
                    $('#DeleteBranch').modal('hide');
                    $scope.branches = d;
                }, function (errResponse) {
                    console.error('Error while fetching Offers');
                });
            }

            $scope.sort = function (keyname) {
                $scope.sortKey = keyname;
                $scope.reverse = !$scope.reverse;
            }
            $scope.showDelete = function (role) {
                $scope.activeBranch = role;
                $scope.showDeletion = true;
            }

            $scope.addOrEdit = function (operationName, role) {
                $scope.currentActiveOperation = operationName;
                if (operationName == 'add') {
                    $scope.showBranch = true;
                    $scope.buttonOperation = "Create";
                    $scope.subtitle = "Create New Branch";
                    $scope.activeBranch = role;
                } else {
                    console.log(role);
                    $scope.showBranch = true;
                    $scope.buttonOperation = "Update ";
                    $scope.subtitle = "Update Branch  " + role.branchCode;
                    $scope.formData.phones = role['telephone'];

                    $scope.activeBranch = role;
                    $scope.loadStatesByCID($scope.activeBranch.country.id);
                }
            }
            $scope.cancel = function () {
                $scope.showBranch = false;
            }

            $scope.submitCreateUpdate = function (status) {
                status['telephone'] = $scope.formData.phones;

                console.log(status);
                status['operation'] = $scope.currentActiveOperation;
                BranchesService.submitCreateUpdate(status).then(
                        fetchAllBranches,
                        function (errResponse) {
                            console.error('Error while creating');
                            $scope.mymsg = status["operation"]
                                    + "of Branch Failed";
                        });
                if (status != null) {
                    $scope.mymsg = "Operation Done Successfully";
                    $timeout(function () {
                        $scope.mymsg = '';
                        $scope.showBranch = false;
                    }, 3000);
                }
            }

            $scope.deleteBranch = function (id) {
                BranchesService.deleteBranch(id).then(fetchAllBranches,
                        function (errResponse) {
                            console.error('Error while deleting Status');
                        });

            }

            // ====================================
            $scope.formData = {
                phones : [ {
                    id : 0,
                    number : "",
                    type : ""
                } ]

            };

            $scope.addPhone = function (index, index2) {
                var newphone = {
                    id : 0,
                    number : "",
                    type : ""
                };
                if ($scope.formData.phones[index2 + 1] == null)
                    $scope.formData.phones.push(newphone);

            };
            $scope.removePhone = function (index1, index) {
                $scope.formData.phones.splice(index, 1);
            };
            // ====================================
            $scope.getBranchDetails = function () {
                var uuid = $route.current.params.id;
                BranchesService.getBranchDetails(uuid).then(function (status) {
                    console.log(status);
                    $scope.branchDetails = status;
                }, function (errResponse) {
                    console.error('Error while creating');
                    $scope.mymsg = status["operation"] + "of store Failed";
                });
            };
        } ]);
