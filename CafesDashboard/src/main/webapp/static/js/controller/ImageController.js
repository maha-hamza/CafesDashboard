'use strict';

App.controller('ImageController', [
        '$scope',
        '$http',
        'ImagesService',
        function ($scope, $http, ImagesService) {

            $scope.showLoader = true;

            $scope.loadImages = function () {
                console.log($scope.showLoader);
                ImagesService.loadImages().then(function (d) {
                    console.log($scope.images);
                    $scope.showLoader = false;
                    $scope.images = d;
                    console.log($scope.showLoader);
                    $('#deleteimgmodal').modal('hide');
                }, function (errResponse) {
                    console.error('Error while fetching Offers');
                });
            }

            $scope.remove = function (imgName) {

                $scope.showLoader = true;
                ImagesService.remove(imgName).then(
                        $scope.loadImages,
                        function (errResponse) {
                            console.error('Error while creating');
                            $scope.mymsg = status["operation"]
                                    + "of Branch Failed";
                        });

            }

            $scope.deleteimg = false;

            $scope.warnDeletion = function (imgName) {
                $scope.deleteimg = true;
                $scope.imgName = imgName;
            }

        } ]);
