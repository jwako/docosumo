var docosumoControllers = angular.module('docosumoControllers', ['ui.bootstrap-slider']);

docosumoControllers.controller('DocosumoCtrl', ['$scope', '$http', '$window', function($scope, $http, $window) {
    $scope.errors = [];
    $scope.categories = [{"title": "hoge"}, {"title": "fuga"}];
    $scope.sliders = {};
    $scope.sliders.sliderValue = 0;
    $scope.options = {
      min: 0,
      max: 5,
      step: 1,
      value: 0
    };

    $http.get('/top/categories.json', {}).success(function(data, status, headers, config) {
      $scope.categories = [{"title": "hoge"}, {"title": "fuga"}];
    }).error(function(data, status) {
      $scope.errors = data;
    });

    $scope.Create = function() {
      $http.post('/top.json', {
      }).success(function(data, status, headers, config) {
      	if (data.location) {
     			$window.location.href = data.location;
     		}
      }).error(function(data, status) {
        $scope.errors = data;
      });
    }
  }
]);
