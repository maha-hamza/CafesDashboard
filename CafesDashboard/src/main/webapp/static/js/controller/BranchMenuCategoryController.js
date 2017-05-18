'use strict';

App
        .controller(
                'BranchMenuCategoryController',
                [
                        '$scope',
                        'BranchMenuCategoryService',
                        function ($scope, BranchMenuCategoryService) {
                            var self = this;
                            $scope.showCategory = false;
                            $scope.restoreCategory = false;
                            self.category = {
                                id : null,
                                uuid : '',
                                updatedAt : null,
                                createdAt : null,
                                categoryName : '',
                                branchId : null,
                                operation : ''

                            };
                            $scope.categories = [];
                            $scope.currentActiveOperation = 'add'
                            $scope.title = 'Branch Menu Category';
                            $scope.clicked = false;
                            $scope.reverse = function () {

                                $scope.clicked = !$scope.clicked;

                            }

                            fetchAllBranchMenuCategory();
                            loadMenus();
                            function fetchAllBranchMenuCategory() {
                                BranchMenuCategoryService
                                        .fetchAllBranchMenuCategory()
                                        .then(
                                                function (d) {
                                                    $scope.showCategory = false;
                                                    $scope.showDeletion = false;
                                                    $('#DeleteCategory').modal(
                                                            'hide');
                                                    $scope.categories = d;
                                                },
                                                function (errResponse) {
                                                    console
                                                            .error('Error while fetching BranchMenuCategory');
                                                });
                            }

                            function loadMenus() {
                                BranchMenuCategoryService
                                        .loadMenus()
                                        .then(
                                                function (d) {
                                                    $scope.branches = d;
                                                    console
                                                            .log($scope.branches)
                                                },
                                                function (errResponse) {
                                                    console
                                                            .error('Error while fetching BranchMenuCategory');
                                                });

                            }

                            $scope.sort = function (keyname) {
                                $scope.sortKey = keyname;
                                $scope.reverse = !$scope.reverse;
                            }

                            $scope.cancel = function () {
                                $scope.showCategory = false;
                                fetchAllBranchMenuCategory();
                            }
                            $scope.addOrEdit = function (operationName, role) {
                                $scope.currentActiveOperation = operationName;
                                if (operationName == 'add') {
                                    $scope.showCategory = true;
                                    $scope.buttonOperation = "Create";
                                    $scope.subtitle = "Create New Category";
                                    $scope.activeCategory = role;
                                    $scope.activeCategory["branchId"] = role.id;
                                } else {
                                    console.log(role);
                                    $scope.showCategory = true;
                                    $scope.buttonOperation = "Update ";
                                    $scope.subtitle = "Update Category "
                                            + role.categoryName;
                                    $scope.activeCategory = role;
                                }
                            }

                            $scope.submitCreateUpdate = function (status) {
                                status['operation'] = $scope.currentActiveOperation;
                                BranchMenuCategoryService
                                        .submitCreateUpdate(status)
                                        .then(
                                                fetchAllBranchMenuCategory,
                                                function (errResponse) {
                                                    console
                                                            .error('Error while creating');
                                                });
                            }

                            $scope.showDelete = function (role) {
                                $scope.activeCategory = role;
                                $scope.showDeletion = true;
                            }

                            $scope.deleteCategory = function (id) {
                                BranchMenuCategoryService
                                        .deleteCategory(id)
                                        .then(
                                                fetchAllBranchMenuCategory,
                                                function (errResponse) {
                                                    console
                                                            .error('Error while deleting Status');
                                                });

                            }
                            // ===================================================
                            $scope.showCCPU = function (country) {
                                $scope.restoreCat = country;
                                $scope.restoreCategory = true;
                            }
                            $scope.showUnCatDelete = function (city) {

                                $scope.deleteCategory(city.id)
                                $('#categoryModal').modal('hide');
                                $scope.restoreCategory = false;
                            }
                            // =====================================
                        } ]);
