'use strict';

angular.module('App').factory('StatusService',
		[ '$http', '$q', function($http, $q) {

			var STATUSES_URL = CONTEXT + '/get-status';
			var STATUSES_FUNCTION = CONTEXT + '/status-functions';
			var STATUSES_DELETE = CONTEXT + '/status-delete/';
			var factory = {
				fetchAllStatuses : fetchAllStatuses,
				submitCreateUpdate : submitCreateUpdate,
				deleteStatus : deleteStatus
			};
			return factory;

			function fetchAllStatuses() {
				var deferred = $q.defer();
				$http.get(STATUSES_URL).then(function(response) {
					deferred.resolve(response.data);
				}, function(errResponse) {
					console.error('Error while fetching Users');
					deferred.reject(errResponse);
				});
				return deferred.promise;
			}

			function submitCreateUpdate(status) {
				console.log(status);
				var deferred = $q.defer();
				$http.post(STATUSES_FUNCTION, status).then(function(response) {
					deferred.resolve(response.data);
				}, function(errResponse) {
					console.error('Error while creating Status');
					deferred.reject(errResponse);
				});
				return deferred.promise;
			}
			 function deleteStatus(id) {
			 var deferred = $q.defer();
			 $http.delete(STATUSES_DELETE+id)
			 .then(
			 function (response) {
			 deferred.resolve(response.data);
			 
			 },
			 function(errResponse){
			 console.error('Error while deleting status');
			 deferred.reject(errResponse);
			 }
			 );
			 return deferred.promise;
			 }

		} ]);
