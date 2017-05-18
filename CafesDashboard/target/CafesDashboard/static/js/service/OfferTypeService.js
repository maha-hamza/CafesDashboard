'use strict';

angular.module('App').factory('OfferTypeService',
		[ '$http', '$q', function($http, $q) {

			var TYPE_URL = CONTEXT + '/get-types';
	         var TYPE_FUNCTION = CONTEXT + '/type-functions';
			var TYPE_DELETE = CONTEXT + '/type-delete/';
			var factory = {
			    fetchAllOfferTypes : fetchAllOfferTypes,
                submitCreateUpdate : submitCreateUpdate,
				deleteOfferType:deleteOfferType
			};
			return factory;

			function fetchAllOfferTypes() {
				var deferred = $q.defer();
				$http.get(TYPE_URL).then(function(response) {
					console.log(response.data);
					deferred.resolve(response.data);
				}, function(errResponse) {
					console.error('Error while fetching Branches');
					deferred.reject(errResponse);
				});
				return deferred.promise;
			}
			
			 function submitCreateUpdate(status) {
                 console.log(status);
                 var deferred = $q.defer();
                 $http.post(TYPE_FUNCTION, status).then(function(response) {
                     deferred.resolve(response.data);
                 }, function(errResponse) {
                     console.error('Error while creating reservation');
                     deferred.reject(errResponse);
                 });
                 return deferred.promise;
             }
			
			 function deleteOfferType(id) {
				 var deferred = $q.defer();
				 $http.delete(TYPE_DELETE+id)
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
