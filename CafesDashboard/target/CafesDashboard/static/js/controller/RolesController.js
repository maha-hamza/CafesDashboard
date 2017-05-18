'use strict';

App.controller('RolesController', [
        '$scope',
        'RolesService',
        function ($scope, RolesService) {
            var self = this;
            $scope.showRole = false;
            self.role = {
                id : null,
                roleName : '',
                uuid : '',
                updatedAt : null,
                createdAt : null,
                isDeleted : 0,
                operation : ''
            };
            $scope.roles = [];
            $scope.currentActiveOperation = 'add'
            $scope.title = 'Roles';
            $scope.clicked = false;
            $scope.reverse = function () {

                $scope.clicked = !$scope.clicked;

            }

            fetchAllRoles();

            function fetchAllRoles() {
                RolesService.fetchAllRoles().then(function (d) {
                    $scope.showRole = false;
                    $scope.showDeletion = false;
                    $('#DeleteRole').modal('hide');
                    $scope.roles = d;
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
                    $scope.showRole = true;
                    $scope.buttonOperation = "Create";
                    $scope.subtitle = "Create New Role";
                    $scope.activeRole = role;
                } else {
                    console.log(role);
                    $scope.showRole = true;
                    $scope.buttonOperation = "Update ";
                    $scope.subtitle = "Update Role " + role.roleName;
                    $scope.activeRole = role;
                }
            }
            $scope.cancel = function () {
                $scope.showRole = false;
            }

            $scope.submitCreateUpdate = function (status) {
                status['operation'] = $scope.currentActiveOperation;
                RolesService.submitCreateUpdate(status).then(fetchAllRoles,
                        function (errResponse) {
                            console.error('Error while creating');
                        });
            }

            $scope.showDelete = function (role) {
                $scope.activeRole = role;
                $scope.showDeletion = true;
            }

            $scope.deleteRole = function (id) {
                RolesService.deleteRole(id).then(fetchAllRoles,
                        function (errResponse) {
                            console.error('Error while deleting Status');
                        });

            }

        } ]);
