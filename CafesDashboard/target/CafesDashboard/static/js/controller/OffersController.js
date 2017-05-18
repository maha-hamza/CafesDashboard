'use strict';

App.controller('OffersController', [
        '$scope',
        'OffersService',
        'OfferTypeService',
        'BranchesService',
        '$http',
        'StoresService',
        '$route',

        function ($scope, OffersService, OfferTypeService, BranchesService,
                $http, StoresService, $route, $routeParams) {
            var self = this;
            $scope.showOffer = false;
            self.offer = {
                id : null,
                uuid : '',
                updatedAt : null,
                createdAt : null,
                from : null,
                to : null,
                isDeleted : 0,
                offerType : null,
                description : '',
                branches : null,
                operation : ''
            };
            $scope.offers = [];
            $scope.currentActiveOperation = 'add'
            $scope.title = 'Offers';
            $scope.clicked = false;
            $scope.reverse = function () {

                $scope.clicked = !$scope.clicked;

            }
            fetchAllOffers();
            fetchAllOfferTypes();
            fetchAllBranches();

            function fetchAllBranches() {

                BranchesService.fetchAllBranches().then(function (d) {
                    $scope.branches = d;
                    console.log('---');
                    console.log($scope.branches)
                }, function (errResponse) {
                    console.error('Error while fetching Offers');
                });
            }

            function fetchAllOfferTypes() {
                OfferTypeService.fetchAllOfferTypes().then(function (d) {
                    $scope.types = d;
                }, function (errResponse) {
                    console.error('Error while fetching OfferType');
                });
            }

            function fetchAllOffers() {
                OffersService.fetchAllOffers().then(function (d) {
                    $scope.showOffer = false;
                    $scope.showDeletion = false;
                    $('#DeleteOffer').modal('hide');
                    $scope.offers = d;
                }, function (errResponse) {
                    console.error('Error while fetching Offers');
                });
            }

            $scope.sort = function (keyname) {
                $scope.sortKey = keyname;
                $scope.reverse = !$scope.reverse;
            }

            $scope.addOrEdit = function (operationName, role) {
                $scope.currentActiveOperation = operationName;

                if (operationName == 'add') {
                    $scope.showOffer = true;
                    $scope.buttonOperation = "Create";
                    $scope.subtitle = "Create New Offer";
                    $scope.activeOffer = role;
                } else {
                    console.log(role);
                    $scope.showOffer = true;
                    $scope.buttonOperation = "Update ";
                    $scope.subtitle = "Update Offer  " + role.offerType.type;
                    role['from'] = new Date(role.from);
                    role['to'] = new Date(role.to);
                    $scope.activeOffer = role;
                }
            }
            $scope.cancel = function () {
                $scope.showOffer = false;
            }
            // ==================================
            function objToString(obj) {
                var str = '{';
                for ( var p in obj) {
                    if (obj.hasOwnProperty(p)) {
                        str += '"' + p + '":"' + obj[p] + '",\n';
                    }
                }
                var n = str.lastIndexOf(",");
                str = str.slice(0, n);
                str += "}";
                return str;
            }
            // ==================================

            $scope.submitCreateUpdate = function (status) {

                status['operation'] = $scope.currentActiveOperation;

                var f = document.getElementById('myDESFile3').files[0];

                var fd = new FormData();

                console.log(objToString(status))
                fd.append('file', f);
                fd.append("offer", objToString(status));

                $http.post(CONTEXT + '/offer-functions', fd, {
                    transformRequest : angular.identity,
                    headers : {
                        'Content-Type' : undefined
                    }
                }).success(function () {

                    fetchAllOffers();
                    $scope.showOffer = false;
                }).error(function () {
                });

                //                
                //                
                // OffersService.submitCreateUpdate(status).then(fetchAllOffers,
                // function (errResponse) {
                // console.error('Error while creating');
                // });
            }

            $scope.showDelete = function (role) {
                $scope.activeOffer = role;
                $scope.showDeletion = true;
            }

            $scope.deleteOffer = function (id) {
                OffersService.deleteOffer(id).then(fetchAllOffers,
                        function (errResponse) {
                            console.error('Error while deleting Status');
                        });

            }

            // ====================================
            $scope.formData = {
                branchez : [ {
                    store : null,
                    branch : null
                } ]

            };

            $scope.addBranch = function (index, index2) {
                var newBranch = {

                    store : null,
                    branch : null
                };
                if ($scope.formData.branchez[index2 + 1] == null)
                    $scope.formData.branchez.push(newBranch);

            };
            $scope.removeBranch = function (index1, index) {
                $scope.formData.branchez.splice(index, 1);
            };
            // ====================================
            $scope.fetchOffersByStore = function () {
                var uuid = $route.current.params.id;
                OffersService.fetchOffersByStore(uuid).then(function (status) {
                    $scope.offerz = status;
                }, function (errResponse) {
                    console.error('Error while creating');

                });
            };
        } ]);
