'use strict';

App
        .controller(
                'MenusController',
                [
                        '$scope',
                        'MenusService',
                        'BranchMenuCategoryService',
                        '$http',
                        function ($scope, MenusService,
                                BranchMenuCategoryService, $http) {
                            var self = this;
                            $scope.showItem = false;
                            $scope.showImg=false;
                            self.menu = {
                                id : null,
                                uuid : '',
                                updatedAt : null,
                                createdAt : null,
                                itemName : '',
                                itemDescription : '',
                                itemPrice : '',
                                category : '',
                                operation : ''

                            };
                            $scope.menues = [];
                            $scope.currentActiveOperation = 'add'
                            $scope.title = 'Branch Menu Items';
                            $scope.clicked = false;
                            $scope.reverse = function () {

                                $scope.clicked = !$scope.clicked;

                            }

                            fetchAllMenus();
                            fetchAllBranchMenuCategory();

                            function fetchAllBranchMenuCategory() {
                                BranchMenuCategoryService
                                        .fetchAllBranchMenuCategory()
                                        .then(
                                                function (d) {

                                                    $scope.categories = d;
                                                },
                                                function (errResponse) {
                                                    console
                                                            .error('Error while fetching BranchMenuCategory');
                                                });
                            }

                            function fetchAllMenus() {
                                MenusService
                                        .fetchAllMenus()
                                        .then(
                                                function (d) {
                                                    $scope.showItem = false;
                                                    $scope.showDeletion = false;
                                                    $('#DeleteItem').modal(
                                                            'hide');
                                                    $scope.menues = d;
                                                },
                                                function (errResponse) {
                                                    console
                                                            .error('Error while fetching Menus');
                                                });
                            }

                            $scope.sort = function (keyname) {
                                $scope.sortKey = keyname;
                                $scope.reverse = !$scope.reverse;
                            }

                            $scope.addOrEdit = function (operationName, role) {
                                $scope.currentActiveOperation = operationName;
                                if (operationName == 'add') {
                                    $scope.showItem = true;
                                    $scope.buttonOperation = "Create";
                                    $scope.subtitle = "Create New Item";
                                    $scope.activeItem = role;
                                } else {
                                    console.log(role);
                                    $scope.showItem = true;
                                    $scope.buttonOperation = "Update ";
                                    $scope.subtitle = "Update Item  "
                                            + role.itemName;

                                    $scope.activeItem = role;
                                }
                            }
                            $scope.cancel = function () {
                                $scope.showItem = false;
                                $scope.showImg = false;
                            }

                            function objToString(obj) {
                                var str = '{';
                                for ( var p in obj) {
                                    if (obj.hasOwnProperty(p)) {
                                        str += '"' + p + '":"' + obj[p]
                                                + '",\n';
                                    }
                                }
                                var n = str.lastIndexOf(",");
                                str = str.slice(0, n);
                                str += "}";
                                return str;
                            }

                            $scope.submitCreateUpdate = function (status) {
                                status['operation'] = $scope.currentActiveOperation;
                                var f = document.getElementById('myDESFile').files[0];

                                var fd = new FormData();
                                console.log('---------------');
                                console.log(status)
                                fd.append('file', f);
                                fd.append("menu", objToString(status));

                                console.log(fd.get('menu'))
                                $http.post(CONTEXT + '/menu-functions', fd, {
                                    transformRequest : angular.identity,
                                    headers : {
                                        'Content-Type' : undefined
                                    }
                                }).success(function () {

                                    fetchAllMenus();
                                    $scope.showItem = false;
                                }).error(function () {
                                });

                            }

                            $scope.changeimgconv = function (role) {
                                $scope.showImg = true;
                                $scope.activeItem = role;

                            }

                            $scope.changeImg = function (id) {
                                var f = document.getElementById('myDESFile2').files[0];

                                var fd = new FormData();
                                fd.append('file', f);
                                fd.append('id', id);

                                $http.post(CONTEXT + '/change-img', fd, {
                                    transformRequest : angular.identity,
                                    headers : {
                                        'Accept' : 'application/json',                                  
                                        'Content-Type' : undefined
                                    }
                                }).success(function () {
                                    fetchAllMenus();
                                    $scope.showImg = false;
                                }).error(function () {
                                });

                            }

                       

                            $scope.showDelete = function (role) {
                                $scope.activeItem = role;
                                $scope.showDeletion = true;
                            }

                            $scope.deleteItem = function (id) {
                                MenusService
                                        .deleteItem(id)
                                        .then(
                                                fetchAllMenus,
                                                function (errResponse) {
                                                    console
                                                            .error('Error while deleting Status');
                                                });

                            }

                            $scope.fetchMenuByStore = function (uuid) {

                                MenusService
                                        .fetchMenuByStore(uuid)
                                        .then(
                                                function (menues) {
                                                    console.log(menues);
                                                    $scope.menues = menues;
                                                },
                                                function (errResponse) {
                                                    console
                                                            .error('Error while creating');
                                                });
                            };
                        } ]);
