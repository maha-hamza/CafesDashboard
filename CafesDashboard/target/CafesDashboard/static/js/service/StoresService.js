'use strict';

angular.module('App').factory('StoresService',
		[ '$http', '$q', function($http, $q) {

			var STORES_URL = CONTEXT + '/get-stores';
			var STORE_FUNCTION = CONTEXT + '/store-functions';
			var STORE_DELETE = CONTEXT + '/store-delete/';
			var LOAD_STORE_DETAILS= CONTEXT+'/store-details/';
			var factory = {
				fetchAllStores : fetchAllStores,
				submitCreateUpdate : submitCreateUpdate,
				deleteStore : deleteStore,
				fetchStoreDetails:fetchStoreDetails
			};
			return factory;

			function fetchAllStores() {
				var deferred = $q.defer();
				$http.get(STORES_URL).then(function(response) {
					deferred.resolve(response.data);
				}, function(errResponse) {
					console.error('Error while fetching Stores');
					deferred.reject(errResponse);
				});
				return deferred.promise;
			}
	
			function submitCreateUpdate(status) {
				console.log(status);
				var deferred = $q.defer();
				$http.post(STORE_FUNCTION, status).then(function(response) {
					deferred.resolve(response.data);
				}, function(errResponse) {
					console.error('Error while creating Status');
					deferred.reject(errResponse);
				});
				return deferred.promise;
			}
			
			 function deleteStore(id) {
				 var deferred = $q.defer();
				 $http.delete(STORE_DELETE+id)
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

			 function fetchStoreDetails(uuid) {
                 var deferred = $q.defer();
                 $http.post(LOAD_STORE_DETAILS, uuid).then(function(response) {
                     deferred.resolve(response.data);
                 }, function(errResponse) {
                     console.error('Error while creating reservation');
                     deferred.reject(errResponse);
                 });
                 return deferred.promise;
                }
			 
		} ]);
