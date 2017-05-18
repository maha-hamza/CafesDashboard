'use strict';

var App = angular.module('App', [ 'ngRoute', 'ng', 'ui.gravatar',
        'angularUtils.directives.dirPagination' ]);

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
                            "/branch-guests",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/usermanagement/users/userstore.jsp",
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
                                title : 'Users',
                                controller : "LocationController",
                                access : false
                            })
                    .when(
                            "/cities",
                            {
                                templateUrl : CONTEXT
                                        + "/static/views/usermanagement/location/cities.jsp",
                                title : 'Users',
                                controller : "LocationController",
                                access : false
                            })
                    .when("/login", {
                        templateUrl : CONTEXT + "/static/views/login.jsp",
                        title : 'Login',
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
App.run([ '$rootScope', '$route', '$location', '$http',

function ($rootScope, $route, $location, $http) {
    $rootScope.$on('$routeChangeSuccess', function (event, current, previous) {

        // $rootScope.title = $route.current.title;
        // $rootScope.EnitiyNotFound = false;
        // $rootScope.islogged = false;
    });
    $rootScope.$on("$routeChangeStart", function (ev, next, current) {
        // for (var route in $route.routes) {
        // console.log(route)
        // console.log(next.originalPath)
        //              
        //                
        // }
        // $http.get(CONTEXT + "/check-logged-user").then(
        // function (response) {
        // $rootScope.islogged = response.data;
        // }, function (errResponse) {
        // console.error('Error while checking');
        // deferred.reject(errResponse);
        // });
        //
        // if ((next.title != 'Login') && !$rootScope.islogged) {
        // $location.path('/login').replace();
        // } else if ((next.title == 'Login') && ($rootScope.islogged)) {
        // $location.path('/dashboard').replace();
        // } else if ((next.title != 'Login')
        // && $rootScope.islogged == undefined) {
        //
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