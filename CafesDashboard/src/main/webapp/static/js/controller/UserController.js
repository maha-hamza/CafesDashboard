'use strict';

App
        .controller(
                'UsersController',
                [
                        '$scope',
                        'UsersService',
                        'RolesService',
                        'StatusService',
                        'BranchesService',
                        '$timeout',
                        '$http',
                        '$route',

                        function ($scope, UsersService, RolesService,
                                StatusService, BranchesService, $timeout,
                                $http, $route, $location, $routeParams) {
                            var self = this;
                            $scope.showUser = false;
                            $scope.showUnDel = false;
                            $scope.restoreUser = false;
                            $scope.showpw = false;
                            $scope.mymsg = '';
                            $scope.loginmsg = '';
                            $scope.clicked = false;
                            $scope.role = 'user';
                            // ==========
                            $scope.userFormInvalidFormError = "Your email is invalid";
                            $scope.userFormRequiredFormError = "You email is required";
                            $scope.userFormPasswordRequiredFormError = "You password is required";
                            $scope.userEmailAreadyRegistered = "This email already registered";
                            $scope.inactiveUserError = "Inactive user can't login"
                            // ==========
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

                            $scope.showLoader=false;
                            
                            
                            fetchAllUsers();
                            fetchAllRoles();
                            fetchAllStatuses();
                            fetchAllCountriesWithStatus();
                            fetchAllBranches();

                            function fetchAllBranches() {
                                BranchesService
                                        .fetchAllBranches()
                                        .then(
                                                function (d) {
                                                    $scope.branches = d;
                                                },
                                                function (errResponse) {
                                                    console
                                                            .error('Error while fetching Roles');
                                                });
                            }

                            function fetchAllRoles() {
                                RolesService
                                        .fetchAllRoles()
                                        .then(
                                                function (d) {
                                                    $scope.roles = d;
                                                },
                                                function (errResponse) {
                                                    console
                                                            .error('Error while fetching Roles');
                                                });
                            }
                            function fetchAllStatuses() {
                                StatusService
                                        .fetchAllStatuses()
                                        .then(
                                                function (d) {
                                                    $scope.statuses = d;
                                                },
                                                function (errResponse) {
                                                    console
                                                            .error('Error while fetching Statuses');
                                                });
                            }

                            function fetchAllCountriesWithStatus() {
                                $http
                                        .get(CONTEXT + "/get-countries")
                                        .then(
                                                function (response) {
                                                    $scope.allCountries = response.data;
                                                },
                                                function (errResponse) {
                                                    console
                                                            .error('Error while fetching Users');
                                                    deferred
                                                            .reject(errResponse);
                                                });

                            }

                            $scope.reverse = function () {

                                $scope.clicked = !$scope.clicked;

                            }

                            $scope.sort = function (keyname) {
                                $scope.sortKey = keyname;
                                $scope.reverse = !$scope.reverse;
                            }

                            $scope.loadStatesByCID = function (id) {
                                $http
                                        .get(CONTEXT + "/get-cities/" + id)
                                        .then(
                                                function (response) {
                                                    $scope.statez = response.data;
                                                },
                                                function (errResponse) {
                                                    console
                                                            .error('Error while fetching Users');
                                                    deferred
                                                            .reject(errResponse);
                                                });

                            }
                            // ------------------------------------------------------------------
                            $scope.login = function (status) {
                                $scope.showLoader=true;
                                $http
                                        .post(CONTEXT + '/login/', status, null)
                                        .success(
                                                function (data, status,
                                                        headers, config) {
                                                    $route.reload();
                                                    window.location.reload();
                                                    $scope.showLoader=false;
                                                })
                                        .error(
                                                function (data, status, header,
                                                        config) {
                                                    $scope.showLoader=false;
                                                    if (status == '409') {
                                                        $scope.loginmsg = '<div class="alert alert-warning alert-dismissable" style="opacity: 0.5" ng-show="loginmsg.length !=0"  > Invalid Credintials</div>'

                                                    }
                                                    $timeout(function () {
                                                        $scope.loginmsg = '';
                                                    }, 3000);
                                                });

                            }

                            $scope.logout = function () {                                                                 
                                $http.post(CONTEXT + '/logout/', null, null)
                                        .success(
                                                function (data, status,
                                                        headers, config) {

                                                    $route.reload();
                                                    window.location.reload();

                                                }).error(
                                                function (data, status, header,
                                                        config) {
                                                    alert('fail')
                                                });

                            }

                            
                    
                            
                            // ------------------------------------------------------------------------------------------
                            function fetchAllUsers() {
                                $scope.showLoader=false;
                                UsersService
                                        .fetchAllUsers()
                                        .then(
                                                function (d) {
                                                    $scope.showUser = false;
                                                    $scope.showDeletion = false;
                                                    $('#DeleteUser').modal(
                                                            'hide');
                                                    $scope.users = d;
                                                },
                                                function (errResponse) {
                                                    console
                                                            .error('Error while fetching Users');
                                                });
                            }
                            // --------------------------------------------
                            $scope.showChangePassword = function (user) {
                                $scope.showpw = !$scope.showpw;
                                $scope.activeUser = user;
                            }

                            $scope.changepw = function (us) {
                                UsersService
                                        .changepw(us)
                                        .then(
                                                $scope.fetchUserDetails,
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
                            // ---------------------------------------------------------------
                            $scope.addOrEdit = function (operationName, role) {
                                $scope.currentActiveOperation = operationName;
                                if (operationName == 'add') {
                                    $scope.showUser = true;
                                    $scope.buttonOperation = "Create";
                                    $scope.subtitle = "Create New User";
                                    $scope.activeUser = role;
                                    $scope.formData.phones = [ {
                                        id : 0,
                                        number : "",
                                        type : ""
                                    } ];
                                } else {
                                    fetchAllStatuses();
                                    fetchAllRoles();
                                    fetchAllCountriesWithStatus();
                                    $scope.showUser = true;
                                    $scope.buttonOperation = "Update ";
                                    $scope.subtitle = "Update User  "
                                            + role.fName + " " + role.lName;
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
                                    $scope.returnedUser = role;
                                    $scope.activeUser = role;
                                    $scope
                                            .loadStatesByCID($scope.activeUser.country.id);
                                }
                            }

                            $scope.addOrEditGuest = function (operationName,
                                    role) {
                                $scope.currentActiveOperation = operationName;
                                if (operationName == 'add') {
                                    $scope.showUser = true;
                                    $scope.buttonOperation = "Create";
                                    $scope.subtitle = "Create New Guest";
                                    $scope.activeUser = role;
                                    $scope.formData.phones = [ {
                                        id : 0,
                                        number : "",
                                        type : ""
                                    } ];
                                } else {
                                    fetchAllStatuses();
                                    fetchAllRoles();
                                    fetchAllCountriesWithStatus();
                                    $scope.showUser = true;
                                    $scope.buttonOperation = "Update ";
                                    $scope.subtitle = "Update Guest  "
                                            + role.fName + " " + role.lName;
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
                                    $scope
                                            .loadStatesByCID($scope.activeUser.country.id);
                                }
                            }

                            $scope.cancel = function () {
                                $scope.showpw = false;
                                $scope.showUser = false;
                                fetchAllUsers();
                            }

                            $scope.submitCreateUpdateUSERORGUEST = function (
                                    status) {
                                $scope.showLoader=true;
                                status['telephone'] = $scope.formData.phones;
                                status['operation'] = $scope.currentActiveOperation;
                                UsersService
                                        .submitCreateUpdate(status)
                                        .then(
                                                fetchAllUsers,
                                                function (errResponse) {
                                                    $scope.showLoader=false;
                                                    console
                                                            .error('Error while creating');
                                                    $scope.mymsg = status["operation"]
                                                            + "of User Failed";
                                                    $timeout(
                                                            function () {
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
                                    $scope.mymsg = status["operation"]
                                            + " of User Failed";
                                    $timeout(function () {
                                        $scope.mymsg = '';
                                        $scope.showUser = false;
                                    }, 3000);

                                }
                            }
                            // ==========================================================================
                            $scope.submitCreateUpdate = function (status,
                                    branch, uuid) {
                                status['telephone'] = $scope.formData.phones;
                                status['branch'] = branch;
                                status['operation'] = 'add';
                                
                                $http.post(CONTEXT + '/user-functions', status).then(function(response) {
                                    $scope.fetchUsersByStore(uuid);
                                }, function(errResponse) {
                                    console
                                    .error('Error while creating');
                            $scope.mymsg = status["operation"]
                                    + "of Guest Failed";
                            $timeout(
                                    function () {
                                        $scope.mymsg = '';
                                        $scope.showUser = false;
                                    }, 3000);
                                });
                                
                                
// UsersService
// .submitCreateUpdate(status)
// .then(
//
// $scope.fetchUsersByStore(uuid),
// function (errResponse) {
// console
// .error('Error while creating');
// $scope.mymsg = status["operation"]
// + "of Guest Failed";
// $timeout(
// function () {
// $scope.mymsg = '';
// $scope.showUser = false;
// }, 3000);
// });
                                if (status != null) {
                                    $scope.mymsg = "Operation Done Successfully";
                                    $timeout(function () {
                                        $scope.mymsg = '';
                                        $scope.showUser = false;
                                    }, 3000);
                                } else {
                                    $scope.mymsg = status["operation"]
                                            + " of Guest Failed";
                                    $timeout(function () {
                                        $scope.mymsg = '';
                                        $scope.showUser = false;
                                    }, 3000);

                                }
                            }
                            // ========================================================
                            $scope.showDelete = function (user) {
                                $scope.activeUser = user;
                                $scope.showDeletion = true;
                            }

                            $scope.deleteUser = function (id) {
                                UsersService
                                        .deleteUser(id)
                                        .then(
                                                fetchAllUsers,
                                                function (errResponse) {
                                                    console
                                                            .error('Error while deleting user');
                                                });
                                $('#notificationModal2').modal('hide');
                                $scope.restoreUser = false;

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
                                console.log(index1 + '   ' + index)
                                if (index == 0 || index1 == 0) {
                                    $scope.cantdelete = true;
                                } else
                                    $scope.formData.phones.splice(index, 1);
                            };
                            // ====================================
                            $scope.fetchUserDetails = function () {
                                // var uuid=$routeParams.id;
                                var uuid = $route.current.params.id;
                                UsersService
                                        .fetchUserDetails(uuid)
                                        .then(
                                                function (status) {
                                                    $scope.userDetails = status;
                                                    console
                                                            .log($scope.userDetails);
                                                },
                                                function (errResponse) {
                                                    console
                                                            .error('Error while creating');
                                                    $scope.mymsg = status["operation"]
                                                            + "of User Failed";
                                                });
                            };

                            $scope.fetchUsersByStore = function (uuid) {
                                // var uuid=$routeParams.id;
                                // var uuid = $route.current.params.id;
                                UsersService
                                        .fetchUsersByStore(uuid)
                                        .then(
                                                function (status) {

                                                    $scope.showUser = false;
                                                    $('#DeleteGuestData')
                                                            .modal('hide');
                                                    $scope.showDeletion = false;
                                                    $scope.usersStore = status;
                                                },
                                                function (errResponse) {
                                                    console
                                                            .error('Error while creating');
                                                    $scope.mymsg = status["operation"]
                                                            + "of User Failed";
                                                });

                            };

                            $scope.deleteGuest = function (id, uuid) {
                                console.log('delete guest')
                                 $http.delete(CONTEXT+'/guest-delete/'+id).then(function (response) {
                                     $scope.fetchUsersByStore(uuid);
                 },function(errResponse){
                 console.error('Error while deleting role');
                 
                 });}


                            // ===============================================

                            $scope.fetchAllDeletedUsers = function () {
                                UsersService
                                        .fetchAllDeletedUsers()
                                        .then(
                                                function (d) {

                                                    $scope.deletedUsers = d;

                                                },
                                                function (errResponse) {
                                                    console
                                                            .error('Error while fetching Users');
                                                });
                            }
                            // =================================================================
                            $scope.showPU = function (user) {
                                $scope.use = user;
                                $scope.restoreUser = true;
                            }

                            $scope.showUnDelete = function (user) {
                                $scope.deleteAndReloadUsers(user.id)
                                $('#notificationModal2').modal('hide');
                                $scope.restoreUser = false;
                            }

                            $scope.deleteAndReloadUsers = function (id) {

                                UsersService
                                        .deleteUser(id)
                                        .then(
                                                $scope.fetchAllDeletedUsers,
                                                function (errResponse) {
                                                    console
                                                            .error('Error while deleting user');
                                                });

                            }
                            // ============checks================
                            $scope.showEmailTick = false;
                            $scope.showTelTick = false;
                            $scope.ind = 0;

                            $scope.emailchecker = function (email) {
                                $http
                                        .post(CONTEXT + '/check-email-exists',
                                                email)
                                        .success(
                                                function (data, status,
                                                        headers, config) {
                                                    if (data == true) {
                                                        $scope.showEmailTick = true;

                                                    } else {
                                                        $scope.showEmailTick = false;
                                                    }
                                                })
                                        .error(
                                                function (data, status, header,
                                                        config) {
                                                    $scope.showEmailTick = false;
                                                });

                            }
                            $scope.telChecker = function (tel, index) {
                                $http
                                        .post(
                                                CONTEXT
                                                        + '/check-telephone-exists',
                                                tel)
                                        .success(
                                                function (data, status,
                                                        headers, config) {
                                                    if (data == true) {
                                                        $scope.showTelTick = true;
                                                        $scope.ind = index

                                                    } else {
                                                        $scope.showTelTick = false;

                                                    }
                                                }).error(
                                                function (data, status, header,
                                                        config) {
                                                    $scope.showTelTick = false;
                                                });

                            }
                            // ================================
                            $scope.stat = false;
                            $scope.getUserByStatus = function (us) {
                                UsersService.getUserByStatus(us).then(
                                        function (d) {
                                            if (d == true) {
                                                $scope.stat = true;
                                            } else {
                                                $scope.stat = false;
                                            }
                                        }, function (errResponse) {

                                        });

                            }
                            // ========================================
                            
                            $scope.disabled=function(){
                                $scope.activeUser={};
                            }
                            
                        } ]);
