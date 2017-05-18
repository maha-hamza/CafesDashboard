'use strict';

angular.module('App').factory('OffersService',
		[ '$http', '$q', function($http, $q) {

			var OFFERS_URL = CONTEXT + '/get-offers';
		    var OFFER_FUNCTION = CONTEXT + '/offer-functions';
			var OFFER_DELETE = CONTEXT + '/offer-delete/';
			var OFFER_STORE = CONTEXT + '/get-offers_by_branch/';
			var factory = {
				fetchAllOffers : fetchAllOffers,
				 submitCreateUpdate : submitCreateUpdate,
			     deleteOffer:deleteOffer,
			     fetchOffersByBranch:fetchOffersByBranch
			};
			return factory;

			function fetchAllOffers() {
				var deferred = $q.defer();
				$http.get(OFFERS_URL).then(function(response) {
					deferred.resolve(response.data);
				}, function(errResponse) {
					console.error('Error while fetching Offers');
					deferred.reject(errResponse);
				});
				return deferred.promise;
			}
			
			  function submitCreateUpdate(status) {
	                 console.log(status);
	                 var deferred = $q.defer();
	                 $http.post(OFFER_FUNCTION, status).then(function(response) {
	                     deferred.resolve(response.data);
	                 }, function(errResponse) {
	                     console.error('Error while creating reservation');
	                     deferred.reject(errResponse);
	                 });
	                 return deferred.promise;
	             }
			
			 function deleteOffer(id) {
				 var deferred = $q.defer();
				 $http.delete(OFFER_DELETE+id)
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
			 
		     function fetchOffersByBranch(uuid) {
                 var deferred = $q.defer();
                 $http.post(OFFER_STORE, uuid).then(function(response) {
                     deferred.resolve(response.data);
                 }, function(errResponse) {
                     console.error('Error while creating reservation');
                     deferred.reject(errResponse);
                 });
                 return deferred.promise;
                }
		} ]);
