'use strict';

angular.module('App').factory('UsersService',
		[ '$http', '$q', function($http, $q) {

			var USERS_URL = CONTEXT + '/get-users';
			var USER_FUNCTION = CONTEXT + '/user-functions';
			var USER_DELETE = CONTEXT + '/user-delete/';
			var LOGIN = CONTEXT + '/login/';
			var LOAD_USER_DETAILS = CONTEXT + '/user-details/';
			var USER_STORE = CONTEXT + '/get-users_by_branch/';
			var CHANGE_PW = CONTEXT + '/change-password/';
			var GET_BY_ID = CONTEXT + '/get-users_by_branchId/';
			var factory = {
				fetchAllUsers : fetchAllUsers,
				 submitCreateUpdate : submitCreateUpdate,
			    deleteUser:deleteUser,
			    login:login,
			    fetchUserDetails:fetchUserDetails,
			    fetchUsersByStore:fetchUsersByStore,
			    changepw:changepw,
			    fetchUsersByID:fetchUsersByID
			};
			return factory;

			function fetchAllUsers() {
				var deferred = $q.defer();
				$http.get(USERS_URL).then(function(response) {
					deferred.resolve(response.data);
				}, function(errResponse) {
					console.error('Error while fetching Users');
					deferred.reject(errResponse);
				});
				return deferred.promise;
			}
			
			 function login(status) {
                 var deferred = $q.defer();
                 $http.post(LOGIN, status).then(function(response) {
                     deferred.resolve(response.data);
                 }, function(errResponse) {
                     console.error('Error while Login');
                     deferred.reject(errResponse);
                 });
                 return deferred.promise;
             }
			
			 function submitCreateUpdate(status) {
                 var deferred = $q.defer();
                 $http.post(USER_FUNCTION, status).then(function(response) {
                     deferred.resolve(response.data);
                 }, function(errResponse) {
                     console.error('Error while creating reservation');
                     deferred.reject(errResponse);
                 });
                 return deferred.promise;
             }
			
			 
			 function changepw(status) {
                 var deferred = $q.defer();
                 $http.post(CHANGE_PW, status).then(function(response) {
                     deferred.resolve(response.data);
                 }, function(errResponse) {
                     console.error('Error while creating reservation');
                     deferred.reject(errResponse);
                 });
                 return deferred.promise;
             }
			 function deleteUser(id) {
				 var deferred = $q.defer();
				 $http.delete(USER_DELETE+id)
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
// =======================
			 
			 function fetchUserDetails(uuid) {
			     var deferred = $q.defer();
                 $http.post(LOAD_USER_DETAILS, uuid).then(function(response) {
                     deferred.resolve(response.data);
                 }, function(errResponse) {
                     console.error('Error while creating reservation');
                     deferred.reject(errResponse);
                 });
                 return deferred.promise;
	            }
			 
			 function fetchUsersByStore(uuid) {
                 var deferred = $q.defer();
                 $http.post(USER_STORE, uuid).then(function(response) {
                     deferred.resolve(response.data);
                 }, function(errResponse) {
                     console.error('Error while creating reservation');
                     deferred.reject(errResponse);
                 });
                 return deferred.promise;
                }
			 
			 function fetchUsersByID(uuid) {
                 var deferred = $q.defer();
                 $http.post(GET_BY_ID, uuid).then(function(response) {
                     deferred.resolve(response.data);
                 }, function(errResponse) {
                     console.error('Error while creating reservation');
                     deferred.reject(errResponse);
                 });
                 return deferred.promise;
                }
		} ]);
