'use strict';

App.controller('StoresController', [ '$scope', 'StoresService', '$route',
        '$http', function ($scope, StoresService, $route, $http) {
            var self = this;
            $scope.showStore = false;
            self.role = {
                id : null,
                storeName : '',
                description : '',
                uuid : '',
                updatedAt : null,
                createdAt : null,
                isDeleted : 0,
                operation : ''
            };
            $scope.title = 'Store';
            $scope.clicked = false;
            $scope.showLoader = false;

            $scope.reverse = function () {

                $scope.clicked = !$scope.clicked;

            }

            $scope.fetchAllStores = function () {
                StoresService.fetchAllStores().then(function (d) {
                    $scope.showStore = false;
                    $scope.storeDetails = d;
                    console.log(d)
                }, function (errResponse) {
                    console.error('Error while fetching Roles');
                });
            }

            $scope.sort = function (keyname) {
                $scope.sortKey = keyname;
                $scope.reverse = !$scope.reverse;
            }

            $scope.addOrEdit = function (operationName, role) {
                $scope.currentActiveOperation = operationName;
                if (operationName == 'add') {
                    $scope.showStore = true;
                    $scope.buttonOperation = "Create";
                    $scope.subtitle = "Create New Store";
                    $scope.activeStore = role;
                } else {
                    console.log(role);
                    $scope.showStore = true;
                    $scope.buttonOperation = "Update ";
                    $scope.subtitle = "Update Store " + role.storeName;
                    $scope.activeStore = role;
                }
            }
            $scope.cancel = function () {
                $scope.showStore = false;
                $scope.fetchAllStores();
            }

            $scope.submitCreateUpdate = function (status) {
                console.log("uploading image to store");
                $scope.showLoader = true;
                status['operation'] = $scope.currentActiveOperation;
                var f = document.getElementById('myDESFile').files[0];

                var fd = new FormData();
                console.log(status)
                fd.append('file', f);
                fd.append('description', status.description);
                fd.append('id', status.id);
                fd.append('name', status.storeName);
                $http.post(CONTEXT + '/store-functions', fd, {
                    transformRequest : angular.identity,
                    headers : {

                        'Accept' : 'application/json',
                        'Content-Type' : undefined

                    }
                }).success(function () {

                    $scope.fetchAllStores();
                    $scope.showLoader = false;
                    $scope.showStore = false;
                }).error(function () {
                    $scope.showLoader = false;
                });

            }

            // ==============================
            $scope.fetchStoreDetails = function () {

                // var uuid=$routeParams.id;
                var uuid = $route.current.params.id;
                StoresService.fetchStoreDetails(uuid).then(function (status) {
                    console.log(status);
                    $scope.storeDetails = status;
                }, function (errResponse) {
                    console.error('Error while creating');
                    $scope.mymsg = status["operation"] + "of store Failed";
                });
            };

            $scope.fetchAdminStoreView = function (uuid) {
                StoresService.fetchStoreDetails(uuid).then(function (status) {
                    console.log(status);
                    $scope.storeDetails = status;
                }, function (errResponse) {
                    console.error('Error while creating');
                    $scope.mymsg = status["operation"] + "of store Failed";
                });
            };
            // ==============================

            $scope.showdesc = function (de) {
                console.log(de)
                $scope.de = de;
                $scope.dee = true;
            }
        } ]);
