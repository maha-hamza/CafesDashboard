'use strict';

App.controller('UsersController', [
        '$scope',
        'UsersService',
        'RolesService',
        'StatusService',
        'BranchesService',
        '$timeout',
        '$http',
        '$route',

        function ($scope, UsersService, RolesService, StatusService,
                BranchesService, $timeout, $http, $route, $routeParams) {
            var self = this;
            $scope.showUser = false;
            $scope.showpw = false;
            $scope.mymsg = '';
            $scope.loginmsg = '';
            $scope.clicked = false;
            self.user = {
                id : null,
                fName : '',
                lName : '',
                uuid : '',
                role : null,
                status : null,
                updatedAt : null,
                createdAt : null,
                isDeleted : 0,
                email : '',
                gender : '',
                birthDate : null,
                country : '',
                city : '',
                telephone : null,
                address : '',
                operation : '',
                password : '',
                store : ''
            };
            $scope.users = [];
            $scope.currentActiveOperation = 'add'
            $scope.title = 'Users';

            fetchAllUsers();
            fetchAllRoles();
            fetchAllStatuses();
            fetchAllCountriesWithStatus();
            fetchAllBranches();

            function fetchAllBranches() {
                BranchesService.fetchAllBranches().then(function (d) {
                    $scope.branches = d;
                }, function (errResponse) {
                    console.error('Error while fetching Roles');
                });
            }

            function fetchAllRoles() {
                RolesService.fetchAllRoles().then(function (d) {
                    $scope.roles = d;
                }, function (errResponse) {
                    console.error('Error while fetching Roles');
                });
            }
            function fetchAllStatuses() {
                StatusService.fetchAllStatuses().then(function (d) {
                    $scope.statuses = d;
                }, function (errResponse) {
                    console.error('Error while fetching Statuses');
                });
            }

            function fetchAllCountriesWithStatus() {
                $http.get(CONTEXT + "/get-countries").then(function (response) {
                    $scope.allCountries = response.data;
                }, function (errResponse) {
                    console.error('Error while fetching Users');
                    deferred.reject(errResponse);
                });

            }

            $scope.reverse = function () {

                $scope.clicked = !$scope.clicked;

            }

            $scope.loadStatesByCID = function (id) {
                $http.get(CONTEXT + "/get-cities/" + id).then(
                        function (response) {
                            $scope.statez = response.data;
                        }, function (errResponse) {
                            console.error('Error while fetching Users');
                            deferred.reject(errResponse);
                        });

            }

            function fetchAllUsers() {
                UsersService.fetchAllUsers().then(function (d) {
                    $scope.showUser = false;
                    $scope.showDeletion = false;
                    $('#DeleteUser').modal('hide');
                    $scope.users = d;
                    console.log("users---");
                    console.log($scope.users);
                }, function (errResponse) {
                    console.error('Error while fetching Users');
                });
            }

            $scope.sort = function (keyname) {
                $scope.sortKey = keyname;
                $scope.reverse = !$scope.reverse;
            }

            $scope.login = function (status) {

                $http.post(CONTEXT + '/login/', status, null).success(
                        function (data, status, headers, config) {
                            $route.reload();
                            window.location.reload();
                        }).error(function (data, status, header, config) {
                    if (status == '409')
                        $scope.loginmsg = "Invalid Credintials";
                    $timeout(function () {
                        $scope.loginmsg = '';
                    }, 3000);
                });

            }

            $scope.logout = function ($location) {
                $http.post(CONTEXT + '/logout/', null, null).success(
                        function (data, status, headers, config) {
                            $route.reload();
                            window.location.reload();
                        }).error(function (data, status, header, config) {
                    alert('fail')
                });

            }

            $scope.showChangePassword = function (user) {
                $scope.showpw = !$scope.showpw;
                $scope.activeUser = user;
            }

            $scope.changepw = function (us) {
                UsersService.changepw(us).then($scope.fetchUserDetails,
                        function (errResponse) {
                            $scope.mymsg = "changing password failed";
                            $timeout(function () {
                                $scope.mymsg = '';
                                $scope.showpw = false;
                            }, 3000);
                        });
                if (status != null) {
                    $scope.mymsg = "Operation Done Successfully";
                    $timeout(function () {
                        $scope.mymsg = '';
                        $scope.showpw = false;
                    }, 3000);
                } else {
                    $scope.mymsg = "changing password failed";
                    $timeout(function () {
                        $scope.mymsg = '';
                        $scope.showpw = false;
                    }, 3000);

                }
            }

            $scope.addOrEdit = function (operationName, role) {
                $scope.currentActiveOperation = operationName;
                if (operationName == 'add') {
                    $scope.showUser = true;
                    $scope.buttonOperation = "Create";
                    $scope.subtitle = "Create New User";
                    $scope.activeUser = role;
                } else {
                    console.log(role);
                    $scope.showUser = true;
                    $scope.buttonOperation = "Update ";
                    $scope.subtitle = "Update User  " + role.fName + " "
                            + role.lName;
                    role['birthDate'] = new Date(role.birthDate);

                    if (role['telephone'].length == 0) {
                        $scope.formData.phones = [ {
                            id : 0,
                            number : "",
                            type : ""
                        } ];
                    } else {
                        $scope.formData.phones = role['telephone'];
                    }
                    $scope.activeUser = role;
                    $scope.loadStatesByCID($scope.activeUser.country.id);
                }
            }
            $scope.cancel = function () {
                $scope.showpw = false;
                $scope.showUser = false;

            }

            $scope.submitCreateUpdateUSERORGUEST = function (status) {
                status['telephone'] = $scope.formData.phones;
                console.log(status);
                status['operation'] = $scope.currentActiveOperation;
                UsersService.submitCreateUpdate(status).then(
                        fetchAllUsers,
                        function (errResponse) {
                            console.error('Error while creating');
                            $scope.mymsg = status["operation"]
                                    + "of User Failed";
                            $timeout(function () {
                                $scope.mymsg = '';
                                $scope.showUser = false;
                            }, 3000);
                        });
                if (status != null) {
                    $scope.mymsg = "Operation Done Successfully";
                    $timeout(function () {
                        $scope.mymsg = '';
                        $scope.showUser = false;
                    }, 3000);
                } else {
                    $scope.mymsg = status["operation"] + " of User Failed";
                    $timeout(function () {
                        $scope.mymsg = '';
                        $scope.showUser = false;
                    }, 3000);

                }
            }

            $scope.submitCreateUpdate = function (status, branch, uuid) {
                status['telephone'] = $scope.formData.phones;
                status['branch'] = branch;
                console.log(status);
                status['operation'] = 'add';
                UsersService.submitCreateUpdate(status).then(
                        $route.reload(),
                        function (errResponse) {
                            console.error('Error while creating');
                            $scope.mymsg = status["operation"]
                                    + "of Guest Failed";
                            $timeout(function () {
                                $scope.mymsg = '';
                                $scope.showUser = false;
                            }, 3000);
                        });
                if (status != null) {
                    $scope.mymsg = "Operation Done Successfully";
                    $timeout(function () {
                        $scope.mymsg = '';
                        $scope.showUser = false;
                    }, 3000);
                } else {
                    $scope.mymsg = status["operation"] + " of Guest Failed";
                    $timeout(function () {
                        $scope.mymsg = '';
                        $scope.showUser = false;
                    }, 3000);

                }
            }

            $scope.showDelete = function (user) {
                $scope.activeUser = user;
                $scope.showDeletion = true;
            }

            $scope.deleteUser = function (id) {
                UsersService.deleteUser(id).then(fetchAllUsers,
                        function (errResponse) {
                            console.error('Error while deleting user');
                        });

            }

            // ====================================
            $scope.formData = {
                phones : [ {
                    id : 0,
                    number : "",
                    type : ""
                } ]

            };

            $scope.addPhone = function (index, index2) {
                var newphone = {
                    id : 0,
                    number : "",
                    type : ""
                };
                if ($scope.formData.phones[index2 + 1] == null)
                    $scope.formData.phones.push(newphone);

            };
            $scope.removePhone = function (index1, index) {
                $scope.formData.phones.splice(index, 1);
            };
            // ====================================
            $scope.fetchUserDetails = function () {
                // var uuid=$routeParams.id;
                var uuid = $route.current.params.id;
                UsersService.fetchUserDetails(uuid).then(function (status) {
                    console.log(status);
                    $scope.userDetails = status;
                }, function (errResponse) {
                    console.error('Error while creating');
                    $scope.mymsg = status["operation"] + "of User Failed";
                });
            };

            $scope.fetchUsersByStore = function (uuid) {
                // var uuid=$routeParams.id;
                // var uuid = $route.current.params.id;

                UsersService.fetchUsersByStore(uuid).then(function (status) {
                    console.log(status);
                    $scope.usersStore = status;
                    $scope.showUser = false;
                }, function (errResponse) {
                    console.error('Error while creating');
                    $scope.mymsg = status["operation"] + "of User Failed";
                });
            };

        } ]);
