'use strict';

App.controller('OrderController', [
        '$scope',
        'OrderService',
        '$route',
        function ($scope, OrderService, $route, $routeParams) {
            var self = this;
            $scope.showOrder = false;
            self.order = {
                id : null,
                uuid : '',
                updatedAt : null,
                createdAt : null,
                isDeleted : 0,
                deliveryAddress : '',
                orderTotalPrice : 0,
                branch : null,
                user : null,
                operation : ''

            };
            $scope.orders = [];
            $scope.currentActiveOperation = 'add'
            $scope.title = 'Order';
            $scope.clicked = false;
            $scope.reverse = function () {

                $scope.clicked = !$scope.clicked;

            }
            fetchAllOrders();

            function fetchAllOrders() {
                OrderService.fetchAllOrders().then(function (d) {
                    $scope.showOrder = false;
                    $scope.showDeletion = false;
                    $('#DeleteOrder').modal('hide');
                    $scope.orders = d;
                }, function (errResponse) {
                    console.error('Error while fetching orders');
                });
            }

            $scope.sort = function (keyname) {
                $scope.sortKey = keyname;
                $scope.reverse = !$scope.reverse;
            }

            $scope.showDelete = function (role) {
                $scope.activeOrder = role;
                $scope.showDeletion = true;
            }

            $scope.deleteOrder = function (id) {
                OrderService.deleteOrder(id).then(fetchAllOrders,
                        function (errResponse) {
                            console.error('Error while deleting Status');
                        });

            }

            $scope.fetchOrderDetails = function () {
                var uuid = $route.current.params.id;
                OrderService.fetchOrderDetails(uuid).then(function (status) {
                    console.log(status);
                    $scope.orderDetails = status;
                }, function (errResponse) {
                    console.error('Error while creating');
                });
            };

        } ]);
