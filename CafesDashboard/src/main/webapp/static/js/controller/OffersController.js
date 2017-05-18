'use strict';

App
        .controller(
                'OffersController',
                [
                        '$scope',
                        'OffersService',
                        'OfferTypeService',
                        'BranchesService',
                        '$timeout',
                        '$http',
                        'StoresService',
                        '$route',

                        function ($scope, OffersService, OfferTypeService,
                                BranchesService,$timeout, $http, StoresService, $route,
                                $routeParams) {
                            var self = this;
                            $scope.showOffer = false;
                            $scope.showImg = false;
                            $scope.showOf = false;
                            $scope.showLoader = false;
                            $scope.errorMessage = '';
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
                            $scope.title = 'Offers and Events';
                            $scope.clicked = false;
                            $scope.value = 'offer';
                            $scope.reverse = function () {

                                $scope.clicked = !$scope.clicked;

                            }
                            fetchAllOffers();
                            fetchAllOfferTypes();
                            fetchAllBranches();

                            function fetchAllBranches() {

                                BranchesService
                                        .fetchAllBranches()
                                        .then(
                                                function (d) {
                                                    $scope.branches = d;
                                                    console.log('---');
                                                    console
                                                            .log($scope.branches)
                                                },
                                                function (errResponse) {
                                                    console
                                                            .error('Error while fetching Offers');
                                                });
                            }

                            function fetchAllOfferTypes() {
                                console.log("fetching all offers");
                                OfferTypeService
                                        .fetchAllOfferTypes()
                                        .then(
                                                function (d) {
                                                    $scope.types = d;
                                                },
                                                function (errResponse) {
                                                    console
                                                            .error('Error while fetching OfferType');
                                                });
                            }

                            $scope.fetchAllOfferType = function () {
                                console.log("fetching all offers");
                                OfferTypeService
                                        .fetchAllOfferTypes()
                                        .then(
                                                function (d) {
                                                    $scope.otypes = d;
                                                },
                                                function (errResponse) {
                                                    console
                                                            .error('Error while fetching OfferType');
                                                });
                            }

                            function fetchAllOffers() {
                                OffersService
                                        .fetchAllOffers()
                                        .then(
                                                function (d) {
                                                    $scope.showOffer = false;
                                                    $scope.showDeletion = false;
                                                    $('#DeleteOffer').modal(
                                                            'hide');
                                                    $scope.offers = d;
                                                },
                                                function (errResponse) {
                                                    console
                                                            .error('Error while fetching Offers');
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
                                    $scope.subtitle = "Create New Offer/Event";
                                    $scope.activeOffer = role;
                                } else {

                                    fetchAllOfferTypes();
                                    $scope.showOffer = true;
                                    $scope.buttonOperation = "Update ";
                                    $scope.subtitle = "Update Offer/Event  "
                                            + role.offerType.type;
                                    role['from'] = new Date(role.from);
                                    role['to'] = new Date(role.to);
                                    $scope.activeOffer = role;

                                }
                            }
                            $scope.cancel = function () {
                                $scope.showOffer = false;
                                $scope.showImg = false;
                                fetchAllOffers();
                                $scope.fetchOffersByBranch();
                            }
                            // ==================================
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

                            $scope.changeimgoffer = function (role) {
                                document.getElementById('myDESFile4').value='';
                                $scope.showImg = true;
                                $scope.activeOffer = role;
                            }

                            $scope.changeImg = function (id) {
                                $scope.showLoader = true;
                                var f = document.getElementById('myDESFile4').files[0];

                                var fd = new FormData();
                                fd.append('file', f);
                                fd.append('id', id);

                                $http
                                        .post(
                                                CONTEXT
                                                        + '/change-offer-or-event-img',
                                                fd,
                                                {
                                                    transformRequest : angular.identity,
                                                    headers : {
                                                        'Accept' : 'application/json',
                                                        'Content-Type' : undefined
                                                    }
                                                }).success(function () {
                                            fetchAllOffers();
                                            $scope.showImg = false;
                                            $scope.showLoader = false;
                                        }).error(function () {
                                            $scope.showLoader = false;
                                        });

                            }
                            // ==================================

                            $scope.submitCreateUpdate = function (status) {
                                $scope.showLoader = true;
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
                                    $scope.showLoader = false;
                                    
                                 
                               
                                    
                                    
                                }).error(function () {
                                    
                                    $scope.showOffer = false;
                                    $scope.showLoader = false;
                                    
                                    $scope.errorMessage = 'Something went wrong with adding the offer/event, offer/event not added';
                                    $timeout(
                                            function () {
                                                $scope.errorMessage = '';

                                            }, 5000);
                                    
                                    
                                });

                            }

                            $scope.submitUpdate = function (status) {
                                $scope.showLoader = true;
                                console.log(status)

                                $http.post(CONTEXT + '/edit-offer-functions',
                                        status).success(function () {

                                    fetchAllOffers();
                                    $scope.showOffer = false;
                                    $scope.showLoader = false;
                                }).error(function () {
                                });

                            }

                            $scope.showDelete = function (role) {
                                $scope.activeOffer = role;
                                $scope.showDeletion = true;
                            }

                            $scope.deleteOffer = function (id) {
                                OffersService
                                        .deleteOffer(id)
                                        .then(
                                                fetchAllOffers,
                                                function (errResponse) {
                                                    console
                                                            .error('Error while deleting Status');
                                                });

                            }

                            // ====================================
                            $scope.formData = {
                                branchez : [ {
                                    store : null,
                                    branch : null
                                } ]

                            };

                            // $scope.addBranch = function (index, index2) {
                            // var newBranch = {
                            //
                            // store : null,
                            // branch : null
                            // };
                            // if ($scope.formData.branchez[index2 + 1] == null)
                            // $scope.formData.branchez.push(newBranch);
                            //
                            // };
                            // $scope.removeBranch = function (index1, index) {
                            // $scope.formData.branchez.splice(index, 1);
                            // };
                            // ====================================
                            $scope.fetchOffersByBranch = function () {
                                var uuid = $route.current.params.id;
                                OffersService
                                        .fetchOffersByBranch(uuid)
                                        .then(
                                                function (status) {
                                                    $scope.offerz = status;
                                                    console.log($scope.offerz)
                                                },
                                                function (errResponse) {
                                                    console
                                                            .error('Error while creating');

                                                });
                            };

                            $scope.submitCreate = function (status, branchId) {
                                $scope.showLoader = true;
                                status['operation'] = $scope.currentActiveOperation;
                                status['branches'] = branchId;
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

                                    $scope.fetchOffersByBranch();
                                    $scope.showOffer = false;
                                    $scope.showLoader = false;
                                                                                                          
                                }).error(function () {
                                    
                                    $scope.showOffer = false;
                                    $scope.showLoader = false;
                                    
                                    $scope.errorMessage = 'Something went wrong with adding the offer/event, offer/event not added';
                                    $timeout(
                                            function () {
                                                $scope.errorMessage = '';

                                            }, 5000);
                                    
                                });

                            }
                            // =======================================
                            $scope.showCOff = function (country) {
                                $scope.restoreOff = country;
                                $scope.showOf = true;
                            }
                            $scope.showUnOffDelete = function (city) {

                                $http.delete(CONTEXT + '/offer-delete/'+city.id)
                                .then(
                                function (response) {
                                    fetchAllOffers();
                                    $('#offerM').modal('hide');
                                    $scope.showOf = false;
                                },
                                function(errResponse){
                                console.error('Error while deleting role');
                                
                                }
                                );
                                
                                
// $scope.deleteOffer(city.id)
// $('#offerM').modal('hide');
// $scope.showOf = false;
                            }
                            // =======================================
                            $scope.initBranchAdder = function (u) {
                                $scope.offerData = u;

                            }
                            $scope.disa = false;
                            $scope.assignBranch = function (offerId, branchId) {

                                var fd = new FormData();

                                console.log(objToString(status))
                                fd.append('offerId', offerId);
                                fd.append("branchId", branchId);

                                $http
                                        .post(
                                                CONTEXT
                                                        + '/assign-branch-to-offer',
                                                fd,
                                                {
                                                    transformRequest : angular.identity,
                                                    headers : {
                                                        'Content-Type' : undefined
                                                    }
                                                })
                                        .success(
                                                function () {

                                                    fetchAllOffers();
                                                    $('#addBranchToOffer')
                                                            .modal('hide');
                                                })
                                        .error(
                                                function () {
                                                    $scope.msg = "You can't select pre-assigned branch";
                                                    $scope.disa = true;
                                                });

                            }

                            $scope.chan = function () {
                                $scope.disa = false;
                                $scope.msg = "";
                            }
                            // =========================
                            $scope.submitCreateFORADMIN = function (status,
                                    branchId) {
                                $scope.showLoader = true;
                                status['branch'] = branchId;
                                var f = document
                                        .getElementById('branchAdminOfferImgFile').files[0];

                                var fd = new FormData();

                                console.log(objToString(status))
                                fd.append('file', f);
                                fd.append("offer", objToString(status));

                                $http
                                        .post(
                                                CONTEXT
                                                        + '/add-offer-functions',
                                                fd,
                                                {
                                                    transformRequest : angular.identity,
                                                    headers : {
                                                        'Content-Type' : undefined
                                                    }
                                                }).success(function () {

                                            $scope.fetchOffersByBranch();
                                            $scope.showOffer = false;
                                            $scope.showLoader = false;
                                        }).error(function () {
                                            
                                            $scope.showOffer = false;
                                            $scope.showLoader = false;
                                            
                                            $scope.errorMessage = 'Something went wrong with adding the offer/event, offer/event not added';
                                            $timeout(
                                                    function () {
                                                        $scope.errorMessage = '';

                                                    }, 5000);
                                            
                                        });

                            }
                            // ==============================================

                            $scope.showRemovalWarning = function (branchId,
                                    offerId) {
                                $scope.branch = branchId;
                                $scope.offer = offerId;
                            }

                            $scope.offerRemoval = function (branchId, offerId) {

                                var fd = new FormData();

                                console.log(objToString(status))
                                fd.append('branch', branchId);
                                fd.append("offer", offerId);

                                $http
                                        .post(
                                                CONTEXT
                                                        + '/remove-branch-from-offer',
                                                fd,
                                                {
                                                    transformRequest : angular.identity,
                                                    headers : {
                                                        'Content-Type' : undefined
                                                    }
                                                }).success(
                                                function () {

                                                    fetchAllOffers();
                                                    $('#confirmBORemoval')
                                                            .modal('hide');
                                                }).error(function () {
                                        });
                            }

                        } ]);
// =================================

