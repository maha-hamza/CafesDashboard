'use strict';

var App = angular.module('App', [ 'ngRoute', 'ng', 'ui.gravatar',
        'angularUtils.directives.dirPagination', 'ngMaterial',
        'emd.ng-redirect-to', 'ngSanitize' ]);

App
        .config(function ($routeProvider, $locationProvider, $httpProvider) {
            $routeProvider
                    .when("/", {
                        redirectTo : '/dashboard',
                        access : false
                    })
                    .when(
                            "/dashboard",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/dashboard/index.jsp",
                                title : 'Dashboard',
                                controller : "UsersController",
                                access : false
                            })
                    .when(
                            "/redirect",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/dashboard/homen.jsp",
                                title : 'Redirect',
                                access : false
                            })
                    .when(
                            "/users",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/usermanagement/users/users.jsp",
                                title : 'Users',
                                controller : "UsersController",
                                access : false
                            })
                    .when(
                            "/guests",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/usermanagement/users/guests.jsp",
                                title : 'Guests',
                                controller : "UsersController",
                                access : false
                            })
                    .when(
                            "/userDetails/:id",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/usermanagement/users/userdetails.jsp",
                                title : 'Users',
                                controller : "UsersController",
                                access : false
                            })
                    .when(
                            "/guestDetails/:id",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/usermanagement/users/guestdetails.jsp",
                                title : 'Guest Details',
                                controller : "UsersController",
                                access : false
                            })
                    .when(
                            "/storeGuestDetails/:id",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/usermanagement/users/storeguestdetails.jsp",
                                title : 'Guest Details',
                                controller : "UsersController",
                                access : false
                            })
                    .when(
                            "/settings",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/usermanagement/settings.jsp",
                                title : 'Settings',
                                controller : "UsersController",
                                access : false
                            })
                    .when(
                            "/images",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/usermanagement/images.jsp",
                                title : 'Images',
                                controller : "ImageController",
                                access : false
                            })
                    .when(
                            "/branch-guests",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/usermanagement/users/branchguests.jsp",
                                title : 'Users',
                                controller : "UsersController",
                                access : false
                            })
                    .when(
                            "/adminstoreview",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/storesmanagement/stores/adminstoreview.jsp",
                                title : 'Store Details',
                                controller : "StoresController",
                                access : false
                            })

                    .when(
                            "/statuses",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/usermanagement/statuses/statuses.jsp",
                                title : 'Statuses',
                                controller : "StatusController",
                                access : false
                            })
                    .when(
                            "/roles",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/usermanagement/roles/roles.jsp",
                                title : 'Roles',
                                controller : "RolesController",
                                access : false
                            })
                    // .when(
                    // "/stores",
                    // {
                    // templateUrl : CONTEXT
                    // + "/static/views/storesmanagement/stores/stores.jsp",
                    // title : 'Stores',
                    // controller : "StoresController",
                    // access : false
                    // })
                    .when(
                            "/store",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/storesmanagement/stores/storedetails.jsp",
                                title : 'Stores',
                                controller : "StoresController",
                                access : false
                            })
                    .when(
                            "/offers",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/storesmanagement/offers/offers.jsp",
                                title : 'Offers',
                                controller : "OffersController",
                                access : false
                            })
                    .when(
                            "/branches",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/storesmanagement/branches/branches.jsp",
                                title : 'Branches',
                                controller : "BranchesController",
                                access : false
                            })
                    .when(
                            "/branchdetails/:id",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/storesmanagement/branches/branchdetails.jsp",
                                title : 'Branches',
                                controller : "BranchesController",
                                access : false
                            })
                    .when(
                            "/reservation",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/guestsmanagement/guestreservations/reservation.jsp",
                                title : 'Guests Reservations',
                                controller : "ReservationController",
                                access : false
                            })
                    .when(
                            "/orders",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/guestsmanagement/orders/order.jsp",
                                title : 'Orders',
                                controller : "OrderController",
                                access : false
                            })
                    .when(
                            "/orderDetails/:id",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/guestsmanagement/orders/orderdetails.jsp",
                                title : 'Order Details',
                                controller : "OrderController",
                                access : false
                            })
                    .when(
                            "/categories",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/storesmanagement/menu/category.jsp",
                                title : 'Categories',
                                controller : "BranchMenuCategoryController",
                                access : false
                            })
                    .when(
                            "/offertype",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/storesmanagement/offertype/offertype.jsp",
                                title : 'Offers Type',
                                controller : "OfferTypeController",
                                access : false
                            })
                    .when(
                            "/countries",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/usermanagement/location/countries.jsp",
                                title : 'Countries',
                                controller : "LocationController",
                                access : false
                            })
                    .when(
                            "/cities",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/usermanagement/location/cities.jsp",
                                title : 'Cities',
                                controller : "LocationController",
                                access : false
                            })
                    .when("/login", {
                        templateUrl : CONTEXT + "/static/views/login.jsp",
                        title : 'Login',
                        access : true
                    })
                    .when(
                            "/logout",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/dashboard/logout.jsp",
                                controller : "UsersController",
                                title : 'Logout',
                                access : true
                            })
                    .when(
                            "/storeAdminMenus/:id",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/storesmanagement/menu/storeAdminMenus.jsp",
                                title : 'Menus',
                                controller : "MenusController",
                                access : false
                            })
                    .when(
                            "/storeAdminOffers/:id",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/storesmanagement/offers/storeAdminOffers.jsp",
                                title : 'Offers',
                                controller : "OffersController",
                                access : false
                            })
                    .when(
                            "/menus",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/storesmanagement/menu/menus.jsp",
                                title : 'Menus',
                                controller : "MenusController",
                                access : false
                            })
                    // =======================================
                    .when(
                            "/deletion",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/deletion/deletion.jsp",
                                title : 'Categories',
                                controller : "BranchMenuCategoryController",
                                access : false
                            })
                    .when(
                            "/users-deletion",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/deletion/users.jsp",
                                title : 'Users',
                                controller : "UsersController",
                                access : false
                            })
                    .when(
                            "/users-store-deletion/:id",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/deletion/userstore.jsp",
                                title : 'Users',
                                controller : "UsersController",
                                access : false
                            })
                    .when(
                            "/guests-deletion",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/deletion/guests.jsp",
                                title : 'Giests',
                                controller : "UsersController",
                                access : false
                            })
                    .when(
                            "/status-deletion",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/deletion/statuses.jsp",
                                title : 'Statuses',
                                controller : "StatusController",
                                access : false
                            })
                    .when(
                            "/roles-deletion",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/deletion/roles.jsp",
                                title : 'Roles',
                                controller : "RolesController",
                                access : false
                            })
                    .when(
                            "/countries-deletion",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/deletion/countries.jsp",
                                title : 'Countries',
                                controller : "LocationController",
                                access : false
                            })
                    .when(
                            "/cities-deletion",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/deletion/cities.jsp",
                                title : 'Cities',
                                controller : "LocationController",
                                access : false
                            })
                    .when(
                            "/stores-deletion",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/deletion/stores.jsp",
                                title : 'Stores',
                                controller : "StoresController",
                                access : false
                            })

                    .when(
                            "/branches-deletion",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/deletion/branches.jsp",
                                title : 'Branches',
                                controller : "BranchesController",
                                access : false
                            })
                    .when(
                            "/items-deletion",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/deletion/menus.jsp",
                                title : 'Items',
                                controller : "MenusController",
                                access : false
                            })
                    .when(
                            "/store-items-deletion",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/deletion/storeAdminMenus.jsp",
                                title : 'Items',
                                controller : "MenusController",
                                access : false
                            })
                    .when(
                            "/categories-deletion",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/deletion/category.jsp",
                                title : 'Categories',
                                controller : "BranchMenuCategoryController",
                                access : false
                            })
                    .when(
                            "/offers-deletion",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/deletion/offers.jsp",
                                title : 'Offers',
                                controller : "OffersController",
                                access : false
                            })

                    .when(
                            "/store-offers-deletion",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/deletion/storeAdminOffers.jsp",
                                title : 'Offers',
                                controller : "OffersController",
                                access : false
                            })
                    .when(
                            "/offertypes-deletion",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/deletion/offertype.jsp",
                                title : 'Offer Types',
                                controller : "OfferTypeController",
                                access : false
                            })
                    .when(
                            "/reservations-deletion",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/deletion/reservation.jsp",
                                title : 'Guests Reservations',
                                controller : "ReservationController",
                                access : false
                            }).when(
                            "/orders-deletion",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/deletion/orders.jsp",
                                title : 'Orders',
                                controller : "OrderController",
                                access : false
                            })
                    // =========================================
                    .when("/error", {
                        templateUrl : CONTEXT + "/static/views/errors-404.jsp",
                        access : false
                    }).otherwise({
                        redirectTo : '/error',
                        access : true
                    });

        });

// TODO fix this to adjust pathes
App.run([
        '$rootScope',
        '$route',
        '$location',
        '$http',

        function ($rootScope, $route, $location, $http) {
            $rootScope.$on('$routeChangeSuccess', function (event, current,
                    previous) {

                // $rootScope.title = $route.current.title;
                // $rootScope.EnitiyNotFound = false;

                if (current.title == 'Logout') {
                    $location.path('/logout').replace();
                } else if (current.title == 'Redirect') {
                    $location.path('/dashboard').replace();
                }

            });
            $rootScope.$on("$routeChangeStart", function (ev, next, current) {
                // use ti for anvigation it;s good
                // $rootScope.previousTitle = current.title;
                // $rootScope.previousPath = current.originalPath;

                if ($rootScope.previousTitle == undefined) {
                    $rootScope.previousTitle = 'Dashboard';
                    $rootScope.previousPath = '/';
                    $route.reload();
                    // $location.path('/dashboard').replace();
                }
                // else if(next.originalPath =='/logout'){
                // $location.path('/dashboard').replace();
                // }

            });

        } ]);

var TEMPLATE_PATH = {

    STATUS : CONTEXT + "/static/views/usermanagement/statuses/addStatus.jsp"
};

App.filter('capitalize', function () {
    return function (input) {
        return (!!input) ? input.charAt(0).toUpperCase()
                + input.substr(1).toLowerCase() : '';
    }
});

App.directive('validFile', function () {
    return {
        require : 'ngModel',
        link : function (scope, el, attrs, ngModel) {
            // change event is fired when file is selected
            el.bind('change', function () {
                scope.$apply(function () {
                    ngModel.$setViewValue(el.val());
                    ngModel.$render();
                });
            });
        }
    }
});

App.directive('autoOpen', function () {

    function compile(tElement) {
        tElement.find('input').attr('ng-focus', 'ctrl.onFocus($event)');

        return function (scope, element, attrs, datePicker) {
            let
            focused = false;

            datePicker.onFocus = function (event) {
                focused = !focused;

                // The datepicker is going to return focus to the input when
                // the calendar pane is closed. We don't want to reopen the
                // the calendar pane after it is closed.
                if (focused) {
                    datePicker.openCalendarPane(event);
                }
            };
        };
    }

    return {
        compile : compile,
        priority : -1,
        require : 'mdDatepicker',
        restrict : 'A'
    };
});

App.directive("datepicker", function () {
    return {
        restrict : "A",
        require : "ngModel",
        link : function (scope, elem, attrs, ngModelCtrl) {
            var updateModel = function (dateText) {
                scope.$apply(function () {
                    ngModelCtrl.$setViewValue(dateText);
                });
            };
            var options = {
                dateFormat : "dd/mm/yy",
                onSelect : function (dateText) {
                    updateModel(dateText);
                }
            };
            elem.datepicker(options);
        }
    }
});