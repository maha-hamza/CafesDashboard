'use strict';

App.controller('LocationController', [
        '$scope',
        'LocationService',
        function ($scope, LocationService) {
            var self = this;
            $scope.showCountry = false;
            $scope.showCity = false;
            self.country = {
                id : null,
                uuid : '',
                country : '',
                operation : '',
                isDeleted : 0
            };
            self.city = {
                id : null,
                uuid : '',
                city : '',
                country : null,
                operation : '',
                isDeleted : 0
            };
            $scope.countries = [];
            $scope.cities = [];
            $scope.currentActiveOperation = 'add'
            $scope.coTitle = 'Countries';
            $scope.ciTitle = 'Cities';

            $scope.clicked = false;
            $scope.reverse = function () {

                $scope.clicked = !$scope.clicked;

            }

            fetchAllCountries();
            fetchAllCities();

            function fetchAllCountries() {
                LocationService.fetchAllCountries().then(function (d) {
                    $scope.countries = d;
                    $scope.showCountry = false;
                    $scope.showDeletion = false;
                    $('#DeleteCountry').modal('hide');
                }, function (errResponse) {
                    console.error('Error while fetching Roles');
                });
            }
            function fetchAllCities() {
                LocationService.fetchAllCities().then(function (d) {
                    $scope.cities = d;
                    $scope.showCity = false;
                    $scope.showDeletion = false;
                    $('#DeleteCity').modal('hide');
                }, function (errResponse) {
                    console.error('Error while fetching Statuses');
                });
            }

            $scope.sort = function (keyname) {
                $scope.sortKey = keyname;
                $scope.reverse = !$scope.reverse;
            }

            $scope.addOrEditCountry = function (operationName, role) {
                $scope.currentActiveOperation = operationName;
                if (operationName == 'add') {
                    $scope.showCountry = true;
                    $scope.buttonOperation = "Create";
                    $scope.subtitle = "Create New Country";
                    $scope.activeCountry = role;
                } else {
                    console.log(role);
                    $scope.showCountry = true;
                    $scope.buttonOperation = "Update ";
                    $scope.subtitle = "Update Country  " + role.country;
                    $scope.activeCountry = role;

                }
            }

            $scope.addOrEditCity = function (operationName, role) {
                $scope.currentActiveOperation = operationName;
                if (operationName == 'add') {
                    $scope.showCity = true;
                    $scope.buttonOperation = "Create";
                    $scope.subtitle = "Create New City";
                    $scope.activeCity = role;
                } else {
                    console.log(role);
                    $scope.showCity = true;
                    $scope.buttonOperation = "Update ";
                    $scope.subtitle = "Update City  " + role.city;
                    $scope.activeCity = role;

                }
            }

            $scope.cancel = function () {
                $scope.showCountry = false;
                $scope.showCity = false;
            }

            $scope.submitCountryCreateUpdate = function (status) {

                status['operation'] = $scope.currentActiveOperation;
                LocationService.submitCountryCreateUpdate(status).then(
                        fetchAllCountries, function (errResponse) {
                            console.error('Error while creating');
                        });

            }

            $scope.submitCityCreateUpdate = function (status) {

                status['operation'] = $scope.currentActiveOperation;
                LocationService.submitCityCreateUpdate(status).then(
                        fetchAllCities, function (errResponse) {
                            console.error('Error while creating');
                        });

            }

            $scope.showDeleteCountry = function (user) {
                $scope.activeCountry = user;
                $scope.showDeletion = true;
            }
            $scope.showDeleteCity = function (user) {
                $scope.activeCity = user;
                $scope.showDeletion = true;
            }

            $scope.deleteCountry = function (id) {
                LocationService.deleteCountry(id).then(fetchAllCountries,
                        function (errResponse) {
                            console.error('Error while deleting user');
                        });

            }
            $scope.deleteCity = function (id) {
                LocationService.deleteCity(id).then(fetchAllCities,
                        function (errResponse) {
                            console.error('Error while deleting user');
                        });

            }

        } ]);
