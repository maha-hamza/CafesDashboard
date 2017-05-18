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
            $scope.restoreBranch = false;
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

            $scope.showLoader = false;

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

            $scope.getDeletedBranches = function () {
                BranchesService.getDeletedBranches().then(function (d) {
                    $scope.showRole = false;
                    $scope.showDeletion = false;
                    $('#DeleteBranch').modal('hide');
                    $scope.delBranches = d;
                }, function (errResponse) {
                    console.error('Error while fetching delBranches');
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

                    $scope.formData.phones = [ {
                        id : 0,
                        number : "",
                        type : ""
                    } ];

                    $scope.showBranch = true;
                    $scope.buttonOperation = "Create";
                    $scope.subtitle = "Create New Branch";
                    $scope.activeBranch = role;

                } else {
                    fetchAllBranches();
                    fetchAllCountriesWithStatus();
                    $scope.showBranch = true;
                    $scope.buttonOperation = "Update ";
                    $scope.subtitle = "Update Branch  " + role.branchCode;

                    if (role['telephone'].length == 0) {
                        $scope.formData.phones = [ {
                            id : 0,
                            number : "",
                            type : ""
                        } ];
                    } else {
                        $scope.formData.phones = role['telephone'];
                    }

                    $scope.activeBranch = role;
                    $scope.loadStatesByCID($scope.activeBranch.country.id);
                }
            }
            $scope.cancel = function () {
                $scope.showBranch = false;
                $scope.uploadStarted = false;
            }

            $scope.submitCreateUpdate = function (status) {
                status['telephone'] = $scope.formData.phones;

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
                console.log(index1 + '   ' + index)
                if (index == 0 || index1 == 0) {
                    $scope.cantdelete = true;
                } else
                    $scope.formData.phones.splice(index, 1);

            };
            // ====================================
            $scope.getBranchDetails = function () {
                var uuid = $route.current.params.id;
                BranchesService.getBranchDetails(uuid).then(function (status) {
                    $scope.branchDetails = status;
                }, function (errResponse) {
                    console.error('Error while creating');
                    $scope.mymsg = status["operation"] + "of store Failed";
                });
            };
            // =======================================
            $scope.showBRPU = function (country) {
                $scope.restoreBR = country;
                $scope.restoreBranch = true;
            }
            $scope.showUnBRNCHDelete = function (city) {

                $scope.deleteBranch(city.id)
                $('#BranchModal').modal('hide');
                $scope.restoreBranch = false;
            }
            // =======================================
            $scope.showTelTick = false;
            $scope.showBTick = false;
            $scope.ind = 0;

            $scope.telChecker = function (tel, index) {
                $http.post(CONTEXT + '/check-telephone-exists', tel).success(
                        function (data, status, headers, config) {
                            if (data == true) {
                                $scope.showTelTick = true;
                                $scope.ind = index
                            } else {
                                $scope.showTelTick = false;
                            }
                        }).error(function (data, status, header, config) {
                    $scope.showTelTick = false;
                });

            }

            $scope.branchChecker = function (b) {
                $http.post(CONTEXT + '/check-branch', b).success(
                        function (data, status, headers, config) {
                            $scope.showBTick = data;

                        }).error(function (data, status, header, config) {
                    console.log('error')
                    $scope.showBTick = false;
                });

            }

            // =========================
            $scope.initimg = function (img) {

                $scope.iimg = img;
            }

            $scope.uploadStarted = false;
            $scope.showBranchUpload = function (d) {
                $scope.activeBranch = d;
                $scope.uploadStarted = true;
            }
            $scope.BranchImgUpload = function (br) {
                console.log("Uploading image to s3 from branch details page");
                $scope.showLoader = true;
                var f = document.getElementById('BRANCHDESFile').files[0];

                var fd = new FormData();
                fd.append('file', f);
                fd.append('description', br.description);
                fd.append('id', $scope.activeBranch.id);

                $http.post(CONTEXT + '/upload-branch-img', fd, {
                    transformRequest : angular.identity,
                    headers : {

                        'Accept' : 'application/json',
                        'Content-Type' : undefined

                    }
                }).success(function () {

                    $scope.getBranchDetails();
                    $scope.uploadStarted = false;
                    $scope.showLoader = false;
                    console.log("Uploading image to s3 from branch details page finished");
                }).error(function () {
                    $scope.showLoader = false;
                    console.log("Uploading image to s3 from branch details page failed");
                });
            }

            // ==========================
        } ]);
