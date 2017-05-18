'use strict';

App.controller('ReservationController', [
        '$scope',
        'ReservationService',
        'BranchesService',
        'UsersService',
        '$timeout',
        function ($scope, ReservationService, BranchesService, UsersService,
                $timeout) {
            var self = this;
            $scope.showReservation = false;
            $scope.mymsg = '';
            $scope.restoreReservation = false;
            self.reservation = {
                id : null,
                uuid : '',
                updatedAt : null,
                createdAt : null,
                isDeleted : 0,
                description : '',
                store : null,
                branches : null,
                numberOfMembers : 0,
                user : null,
                userId : 0,
                branchId : 0,
                operation : '',
                reservationTime : '',
                reservationDate : null
            };
            $scope.reservations = [];
            $scope.currentActiveOperation = 'add'
            $scope.title = 'Guests Reservations ';
            $scope.clicked = false;
            $scope.reverse = function () {

                $scope.clicked = !$scope.clicked;

            }
            fetchAllReservations();
            loadMenus();

            function fetchAllReservations() {
                ReservationService.fetchAllReservations().then(function (d) {
                    $scope.showReservation = false;
                    $scope.showDeletion = false;
                    $('#DeleteReservation').modal('hide');
                    $scope.reservations = d;
                }, function (errResponse) {
                    console.error('Error while fetching Reservations');
                });
            }

            $scope.fetchUsersByID = function (uuid) {
                UsersService.fetchUsersByID(uuid).then(function (status) {

                    $scope.users = status;

                }, function (errResponse) {
                    console.error('Error while creating');

                });
            }

            $scope.sort = function (keyname) {
                $scope.sortKey = keyname;
                $scope.reverse = !$scope.reverse;
            }

            function loadMenus() {
                BranchesService.fetchAllBranches().then(function (d) {
                    $scope.branches = d;
                }, function (errResponse) {
                    console.error('Error while fetching Offers');
                });

            }

            $scope.addOrEdit = function (operationName, role) {
                $scope.currentActiveOperation = operationName;
                if (operationName == 'add') {
                    $scope.showReservation = true;
                    $scope.buttonOperation = "Create";
                    $scope.subtitle = "Create New Reservation";
                    $scope.activeReservation = role;
                } else {
                    console.log(role);
                    $scope.showReservation = true;
                    $scope.buttonOperation = "Update ";
                    $scope.subtitle = "Update Reservation for Guest "
                            + role.user.fName
                            + " "
                            + role.user.lName
                            + " at "
                            + new Date(role.reservationDate)
                                    .toLocaleDateString();
                    role['reservationDate'] = new Date(role.reservationDate);
                    $scope.activeReservation = role;
                    $scope.fetchUsersByID(role.branchId);
                }
            }
            $scope.cancel = function () {
                $scope.showReservation = false;
                fetchAllReservations();
            }

            $scope.submitCreateUpdate = function (status, id, rolename) {
                status['operation'] = $scope.currentActiveOperation;
                if (rolename == 'BRANCH_ADMIN') {
                    status['branchId'] = id;
                }
                console.log(status)
                ReservationService.submitCreateUpdate(status).then(
                        fetchAllReservations,
                        function (errResponse) {
                            console.error('Error while creating');
                            $scope.mymsg = status["operation"]
                                    + "of Reservation Failed";
                        });
                if (status != null) {
                    $scope.mymsg = "Reservation Done Successfully";
                    $timeout(function () {
                        $scope.mymsg = '';
                        $scope.showReservation = false;
                    }, 3000);
                }

            }

            $scope.showDelete = function (role) {
                $scope.activeReservation = role;
                $scope.showDeletion = true;
            }

            $scope.deleteReservation = function (id) {
                ReservationService.deleteReservation(id).then(
                        fetchAllReservations, function (errResponse) {
                            console.error('Error while deleting Status');
                        });
            }
            // =================================
            $scope.showRPU = function (country) {
                $scope.restoreRes = country;
                $scope.restoreReservation = true;
            }
            $scope.showUnResDelete = function (city) {

                $scope.deleteReservation(city.id)
                $('#reservationModal').modal('hide');
                $scope.restoreReservation = false;
            }
            // ======================================
        } ]);
