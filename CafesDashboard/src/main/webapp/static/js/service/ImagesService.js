'use strict';

angular.module('App').factory('ImagesService',
        [ '$http', '$q', function ($http, $q) {

            var IMG_URL = CONTEXT + '/load-images';
            var IMG_RMV = CONTEXT + '/delete_img';
            var factory = {
                loadImages : loadImages,
                remove : remove
            };
            return factory;

            function loadImages() {
                var deferred = $q.defer();
                $http.get(IMG_URL).then(function (response) {
                    deferred.resolve(response.data);
                    console.log('what')
                }, function (errResponse) {
                    console.error('Error while fetching Branches');
                    deferred.reject(errResponse);
                });
                return deferred.promise;
            }

            function remove(im) {
                var deferred = $q.defer();
                $http.post(IMG_RMV, im).then(function (response) {
                    deferred.resolve(response.data);
                    console.log('what2')
                }, function (errResponse) {
                    console.error('Error while fetching Branches');
                    deferred.reject(errResponse);
                });
                return deferred.promise;
            }

        } ]);
