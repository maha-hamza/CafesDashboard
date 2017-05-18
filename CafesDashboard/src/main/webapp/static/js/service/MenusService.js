'use strict';

angular.module('App').factory('MenusService',
		[ '$http', '$q', function($http, $q) {

			var Menus_URL = CONTEXT + '/get-menus';
			var ITEM_FUNCTION = CONTEXT + '/menu-functions';
			var ITEM_DELETE = CONTEXT + '/menu-delete/';
			var MENU_STORE=CONTEXT + '/get-items_by_store';
			var MENU_EDIT=CONTEXT + '/edit-menu';
			var factory = {
				fetchAllMenus : fetchAllMenus,
				submitCreateUpdate : submitCreateUpdate,
				deleteItem : deleteItem,
				fetchMenuByStore:fetchMenuByStore,
				submitUpdate:submitUpdate,
				deleteItm:deleteItemz
			};
			return factory;

			function fetchAllMenus() {
				var deferred = $q.defer();
				$http.get(Menus_URL).then(function(response) {
					console.log(response.data);
					deferred.resolve(response.data);
				}, function(errResponse) {
					console.error('Error while fetching Menus');
					deferred.reject(errResponse);
				});
				return deferred.promise;
			}
			
			   function submitCreateUpdate(status) {
                   console.log(status);
                   var deferred = $q.defer();
                   $http.post(ITEM_FUNCTION, status).then(function(response) {
                       deferred.resolve(response.data);
                   }, function(errResponse) {
                       console.error('Error while creating reservation');
                       deferred.reject(errResponse);
                   });
                   return deferred.promise;
               }
			   
			   function submitUpdate(status) {
                   console.log(status);
                   var deferred = $q.defer();
                   $http.post(MENU_EDIT, status).then(function(response) {
                       deferred.resolve(response.data);
                   }, function(errResponse) {
                       console.error('Error while creating reservation');
                       deferred.reject(errResponse);
                   });
                   return deferred.promise;
               }
			
			   function deleteItemz(status) {
                   var deferred = $q.defer();
                   $http.post(CONTEXT + '/menu-del', status).then(function(response) {
                       deferred.resolve(response.data);
                   }, function(errResponse) {
                       deferred.reject(errResponse);
                   });
                   return deferred.promise;
               }
			   
			 function deleteItem(id) {
				 var deferred = $q.defer();
				 $http.delete(ITEM_DELETE+id)
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

			 function fetchMenuByStore(uuid) {
                 var deferred = $q.defer();
                 $http.post(MENU_STORE, uuid).then(function(response) {
                     deferred.resolve(response.data);
                 }, function(errResponse) {
                     console.error('Error while creating reservation');
                     deferred.reject(errResponse);
                 });
                 return deferred.promise;
                }
			 
		} ]);
