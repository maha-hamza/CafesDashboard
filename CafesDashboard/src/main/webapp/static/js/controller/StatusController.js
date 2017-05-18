'use strict';

App.controller('StatusController', [
        '$scope',
        'StatusService',
        function ($scope, StatusService) {
            var self = this;
            $scope.showStatus = false;
            self.status = {
                id : null,
                uuid : '',
                status : '',
                updatedAt : null,
                createdAt : null,
                isDeleted : 0,
                operation : ''
            };
            $scope.statuses = [];
            $scope.currentActiveOperation = 'add'
            $scope.title = 'Statuses';
            $scope.clicked = false;
            $scope.reverse = function () {
                $scope.clicked = !$scope.clicked;
            }

            fetchAllStatuses();

            function fetchAllStatuses() {
                StatusService.fetchAllStatuses().then(function (d) {
                    $scope.showStatus = false;
                    $scope.showDeletion = false;
                    $('#DeleteStatus').modal('hide');
                    $scope.statuses = d;
                }, function (errResponse) {
                    console.error('Error while fetching Statuses');
                });
            }

            $scope.sort = function (keyname) {
                $scope.sortKey = keyname;
                $scope.reverse = !$scope.reverse;
            }
            // ==========================functional====================
            $scope.addOrEdit = function (operationName, status) {
                $scope.currentActiveOperation = operationName;
                if (operationName == 'add') {
                    $scope.showStatus = true;
                    $scope.buttonOperation = "Create";
                    $scope.subtitle = "Create New Status";
                    $scope.activeStatus = status;
                } else {
                    console.log(status);
                    $scope.showStatus = true;
                    $scope.buttonOperation = "Update ";
                    $scope.subtitle = "Update Status " + status.status;
                    $scope.activeStatus = status;
                }
            }
            $scope.cancel = function () {
                $scope.showStatus = false;
            }

            $scope.submitCreateUpdate = function (status) {
                status['operation'] = $scope.currentActiveOperation;
                StatusService.submitCreateUpdate(status).then(fetchAllStatuses,
                        function (errResponse) {
                            console.error('Error while creating');
                        });
            }

            $scope.showDelete = function (status) {
                $scope.activeStatus = status;
                $scope.showDeletion = true;
            }

            $scope.deleteStatus = function (id) {
                StatusService.deleteStatus(id).then(fetchAllStatuses,
                        function (errResponse) {
                            console.error('Error while deleting Status');
                        });

            }

        } ]);
