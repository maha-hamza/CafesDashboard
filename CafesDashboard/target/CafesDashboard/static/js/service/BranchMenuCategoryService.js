'use strict';

angular.module('App').factory('BranchMenuCategoryService',
		[ '$http', '$q', function($http, $q) {

			var BranchMenuCategory_URL = CONTEXT + '/get-categories';
			var CATEGORY_FUNCTION = CONTEXT + '/category-functions';
			var CATEGORY_DELETE = CONTEXT + '/category-delete/';
			var factory = {
				fetchAllBranchMenuCategory : fetchAllBranchMenuCategory,
				submitCreateUpdate : submitCreateUpdate,
			    deleteCategory:deleteCategory,
			    loadMenus:loadMenus
			};
			return factory;

			function fetchAllBranchMenuCategory() {
				var deferred = $q.defer();
				$http.get(BranchMenuCategory_URL).then(function(response) {
					console.log(response.data);
					deferred.resolve(response.data);
				}, function(errResponse) {
					console.error('Error while fetching BranchMenuCategory');
					deferred.reject(errResponse);
				});
				return deferred.promise;
			}
		
			function loadMenus() {
				var deferred = $q.defer();
				$http.get(CONTEXT + '/get-branches')
						.then(
								function(response) {
									deferred.resolve(response.data);
								},
								function(errResponse) {
									console
											.error('Error while fetching Branches');
									deferred
											.reject(errResponse);
								});
				return deferred.promise;
			}
			
			function submitCreateUpdate(status) {
				console.log(status);
				var deferred = $q.defer();
				$http.post(CATEGORY_FUNCTION, status).then(function(response) {
					deferred.resolve(response.data);
				}, function(errResponse) {
					console.error('Error while creating Status');
					deferred.reject(errResponse);
				});
				return deferred.promise;
			}
			
			 function deleteCategory(id) {
				 var deferred = $q.defer();
				 $http.delete(CATEGORY_DELETE+id)
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

		} ]);
