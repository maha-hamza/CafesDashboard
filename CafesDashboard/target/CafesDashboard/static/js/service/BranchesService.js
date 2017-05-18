'use strict';

angular.module('App').factory('BranchesService',
		[ '$http', '$q', function($http, $q) {

			var Branches_URL = CONTEXT + '/get-branches';
	         var BRANCH_FUNCTION = CONTEXT + '/branch-functions';
			var BRANCH_DELETE = CONTEXT + '/branch-delete/';
			var BRANCH_DETAILS = CONTEXT + '/get-branch-by-uuid/';
			var factory = {
				fetchAllBranches : fetchAllBranches,
				submitCreateUpdate : submitCreateUpdate,
			    deleteBranch:deleteBranch,
			    getBranchDetails:getBranchDetails
			};
			return factory;

			function fetchAllBranches() {
				var deferred = $q.defer();
				$http.get(Branches_URL).then(function(response) {
					console.log(response.data);
					deferred.resolve(response.data);
				}, function(errResponse) {
					console.error('Error while fetching Branches');
					deferred.reject(errResponse);
				});
				return deferred.promise;
			}
			
			 function submitCreateUpdate(status) {
                 var deferred = $q.defer();
                 $http.post(BRANCH_FUNCTION, status).then(function(response) {
                     deferred.resolve(response.data);
                 }, function(errResponse) {
                     console.error('Error while creating reservation');
                     deferred.reject(errResponse);
                 });
                 return deferred.promise;
             }
			 function deleteBranch(id) {
				 var deferred = $q.defer();
				 $http.delete(BRANCH_DELETE+id)
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

			 function getBranchDetails(uuid) {
                 var deferred = $q.defer();
                 $http.post(BRANCH_DETAILS, uuid).then(function(response) {
                     deferred.resolve(response.data);
                 }, function(errResponse) {
                     console.error('Error while creating reservation');
                     deferred.reject(errResponse);
                 });
                 return deferred.promise;
                }
		} ]);
