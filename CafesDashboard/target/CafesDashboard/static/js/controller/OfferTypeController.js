'use strict';

App.controller('OfferTypeController', [
        '$scope',
        'OfferTypeService',
        function ($scope, OfferTypeService) {
            var self = this;
            $scope.showOfferType = false;
            self.type = {
                id : null,
                uuid : '',
                updatedAt : null,
                createdAt : null,
                isDeleted : 0,
                description : '',
                type : '',
                operation : '',
                store : null

            };
            $scope.types = [];
            $scope.currentActiveOperation = 'add'
            $scope.title = 'Offers Types';
            $scope.clicked = false;
            $scope.reverse = function () {

                $scope.clicked = !$scope.clicked;

            }
            fetchAllOfferTypes();

            function fetchAllOfferTypes() {
                OfferTypeService.fetchAllOfferTypes().then(function (d) {
                    $scope.showOfferType = false;
                    $scope.showDeletion = false;
                    $('#DeleteOfferType').modal('hide');
                    $scope.types = d;
                }, function (errResponse) {
                    console.error('Error while fetching OfferType');
                });
            }

            $scope.sort = function (keyname) {
                $scope.sortKey = keyname;
                $scope.reverse = !$scope.reverse;
            }

            $scope.addOrEdit = function (operationName, role) {
                $scope.currentActiveOperation = operationName;
                if (operationName == 'add') {
                    $scope.showOfferType = true;
                    $scope.buttonOperation = "Create";
                    $scope.subtitle = "Create New Offertype";
                    $scope.activeOfferType = role;
                } else {
                    console.log(role);
                    $scope.showOfferType = true;
                    $scope.buttonOperation = "Update ";
                    $scope.subtitle = "Update Offer Type  " + role.type;
                    $scope.activeOfferType = role;
                }
            }
            $scope.cancel = function () {
                $scope.showOfferType = false;
            }

            $scope.submitCreateUpdate = function (status) {
                status['operation'] = $scope.currentActiveOperation;
                console.log(status)
                OfferTypeService.submitCreateUpdate(status).then(
                        fetchAllOfferTypes, function (errResponse) {
                            console.error('Error while creating');
                        });
            }

            $scope.showDelete = function (role) {
                $scope.activeOfferType = role;
                $scope.showDeletion = true;
            }

            $scope.deleteOfferType = function (id) {
                OfferTypeService.deleteOfferType(id).then(fetchAllOfferTypes,
                        function (errResponse) {
                            console.error('Error while deleting OfferTypes');
                        });

            }

        } ]);
