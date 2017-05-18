'use strict';

angular.module('App').factory('RolesService',
		[ '$http', '$q', function($http, $q) {

			var ROLES_URL = CONTEXT + '/get-roles';
			var ROLES_FUNCTION = CONTEXT + '/role-functions';
			var ROLE_DELETE = CONTEXT + '/role-delete/';
			var factory = {
				fetchAllRoles : fetchAllRoles,
				submitCreateUpdate : submitCreateUpdate,
				deleteRole : deleteRole,
			};
			return factory;

			function fetchAllRoles() {
				var deferred = $q.defer();
				$http.get(ROLES_URL).then(function(response) {
					deferred.resolve(response.data);
				}, function(errResponse) {
					console.error('Error while fetching ROLES');
					deferred.reject(errResponse);
				});
				return deferred.promise;
			}

			

			
			function submitCreateUpdate(status) {
				console.log(status);
				var deferred = $q.defer();
				$http.post(ROLES_FUNCTION, status).then(function(response) {
					deferred.resolve(response.data);
				}, function(errResponse) {
					console.error('Error while creating Status');
					deferred.reject(errResponse);
				});
				return deferred.promise;
			}
			
			 function deleteRole(id) {
				 var deferred = $q.defer();
				 $http.delete(ROLE_DELETE+id)
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
