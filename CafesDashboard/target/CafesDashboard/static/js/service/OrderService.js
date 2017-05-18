'use strict';

angular.module('App').factory('OrderService',
		[ '$http', '$q', function($http, $q) {

			var Order_URL = CONTEXT + '/get-orders';
			var ORDER_DELETE = CONTEXT + '/order-delete/';
			var ORDER_DETAILS = CONTEXT + '/get-order_details/';
			var factory = {
				fetchAllOrders : fetchAllOrders,
				deleteOrder : deleteOrder,
				 fetchOrderDetails:fetchOrderDetails,
			};
			return factory;

			function fetchAllOrders() {
				var deferred = $q.defer();
				$http.get(Order_URL).then(function(response) {
					deferred.resolve(response.data);
				}, function(errResponse) {
					console.error('Error while fetching Order');
					deferred.reject(errResponse);
				});
				return deferred.promise;
			}
			 function deleteOrder(id) {
				 var deferred = $q.defer();
				 $http.delete(ORDER_DELETE+id)
				 .then(
				 function (response) {
				 deferred.resolve(response.data);
				 
				 },
				 function(errResponse){
				 console.error('Error while deleting role');
				 deferred.reject(errResponse);
				 }
				 );
				 return deferred.promise;
				 }
			 
			 function fetchOrderDetails(uuid) {
                 var deferred = $q.defer();
                 $http.post(ORDER_DETAILS, uuid).then(function(response) {
                     deferred.resolve(response.data);
                 }, function(errResponse) {
                     console.error('Error while creating reservation');
                     deferred.reject(errResponse);
                 });
                 return deferred.promise;
                }
			 
		} ]);
