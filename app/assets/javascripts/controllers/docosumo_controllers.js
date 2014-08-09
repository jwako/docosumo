var docosumoControllers = angular.module('docosumoControllers', ['ui.bootstrap-slider']);

docosumoControllers.controller('DocosumoCtrl', ['$scope', '$http', '$window', function($scope, $http, $window) {
    $scope.errors = [];
    $scope.categories = [];
    $scope.options = {
      min: 0,
      max: 5,
      step: 1,
      value: 0
    };
    $scope.cities = [];

    $http.get('/top/categories.json', {}).success(function(data, status, headers, config) {
      $scope.categories = data;
      for (var i = 0; i < data.length; i++) {
        $scope.categories[i].sliderValue = 0;
      }
    }).error(function(data, status) {
      $scope.errors = data;
    });

    $scope.Create = function() {
      $http.post('/top.json', {
        "weights": [
          {"id": $scope.categories[0].id, "weight": $scope.categories[0].sliderValue},
          {"id": $scope.categories[1].id, "weight": $scope.categories[1].sliderValue},
          {"id": $scope.categories[2].id, "weight": $scope.categories[2].sliderValue},
          {"id": $scope.categories[3].id, "weight": $scope.categories[3].sliderValue},
          {"id": $scope.categories[4].id, "weight": $scope.categories[4].sliderValue},
          {"id": $scope.categories[5].id, "weight": $scope.categories[5].sliderValue}
        ]
      }).success(function(data, status, headers, config) {
        $scope.cities = data;
      }).error(function(data, status) {
        $scope.errors = data;
      });
    }
  }
]);
