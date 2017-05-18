'use strict';

angular.module('App').factory('ReservationService',
		[ '$http', '$q', function($http, $q) {

			var Reservations_URL = CONTEXT + '/get-reservations';
			var RESERVATION_FUNCTION = CONTEXT + '/reservation-functions';
			var RESERVATION_DELETE = CONTEXT + '/reservation-delete/';

			var factory = {
				fetchAllReservations : fetchAllReservations,
                submitCreateUpdate : submitCreateUpdate,
			    deleteReservation:deleteReservation
			};
			return factory;

			function fetchAllReservations() {
				var deferred = $q.defer();
				$http.get(Reservations_URL).then(function(response) {
					deferred.resolve(response.data);
				}, function(errResponse) {
					console.error('Error while fetching Reservations');
					deferred.reject(errResponse);
				});
				return deferred.promise;
			}
			
			 function submitCreateUpdate(status) {
	                console.log(status);
	                var deferred = $q.defer();
	                $http.post(RESERVATION_FUNCTION, status).then(function(response) {
	                    deferred.resolve(response.data);
	                }, function(errResponse) {
	                    console.error('Error while creating reservation');
	                    deferred.reject(errResponse);
	                });
	                return deferred.promise;
	            }
			
			 function deleteReservation(id) {
				 var deferred = $q.defer();
				 $http.delete(RESERVATION_DELETE+id)
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
