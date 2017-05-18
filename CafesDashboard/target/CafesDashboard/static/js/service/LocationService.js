'use strict';

angular.module('App').factory('LocationService',
		[ '$http', '$q', function($http, $q) {

			var COUNTRIES_URL = CONTEXT + '/get-countries';
			var CITIES_URL = CONTEXT + '/get-cities';
			var COUNTRIES_FUNCTION = CONTEXT + '/country-functions';
			var CITIES_FUNCTION = CONTEXT + '/city-functions';
			var COUNTRY_DELETE = CONTEXT + '/country-delete/';
			var CITY_DELETE = CONTEXT + '/city-delete/';
			
			var factory = {
			        fetchAllCountries : fetchAllCountries,
			        fetchAllCities : fetchAllCities,
			        submitCountryCreateUpdate:submitCountryCreateUpdate,
			        submitCityCreateUpdate:submitCityCreateUpdate,
			        deleteCountry:deleteCountry,
			        deleteCity:deleteCity
			};
			return factory;

			function fetchAllCountries() {
				var deferred = $q.defer();
				$http.get(COUNTRIES_URL).then(function(response) {
					deferred.resolve(response.data);
				}, function(errResponse) {
					console.error('Error while fetching Users');
					deferred.reject(errResponse);
				});
				return deferred.promise;
			}
			
			function fetchAllCities() {
                var deferred = $q.defer();
                $http.get(CITIES_URL).then(function(response) {
                    deferred.resolve(response.data);
                }, function(errResponse) {
                    console.error('Error while fetching Users');
                    deferred.reject(errResponse);
                });
                return deferred.promise;
            }
			
			
			 function submitCountryCreateUpdate(status) {
                 var deferred = $q.defer();
                 $http.post(COUNTRIES_FUNCTION, status).then(function(response) {
                     deferred.resolve(response.data);
                 }, function(errResponse) {
                     console.error('Error while creating reservation');
                     deferred.reject(errResponse);
                 });
                 return deferred.promise;
             }
			
             function submitCityCreateUpdate(status) {
                 var deferred = $q.defer();
                 $http.post(CITIES_FUNCTION, status).then(function(response) {
                     deferred.resolve(response.data);
                 }, function(errResponse) {
                     console.error('Error while creating reservation');
                     deferred.reject(errResponse);
                 });
                 return deferred.promise;
             }
			 
			 function deleteCountry(id) {
				 var deferred = $q.defer();
				 $http.delete(COUNTRY_DELETE+id)
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
			 
			 function deleteCity(id) {
                 var deferred = $q.defer();
                 $http.delete(CITY_DELETE+id)
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
