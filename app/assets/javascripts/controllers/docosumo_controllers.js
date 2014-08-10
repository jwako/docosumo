var docosumoControllers = angular.module('docosumoControllers', ['ui.bootstrap', 'ui.bootstrap-slider']);

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
    $scope.loading = false;

    $http.get('/top/categories.json', {}).success(function(data, status, headers, config) {
      $scope.categories = data;
      for (var i = 0; i < data.length; i++) {
        $scope.categories[i].sliderValue = 0;
      }
    }).error(function(data, status) {
      $scope.errors = data;
    });

    $scope.Create = function() {
      $scope.loading = true;
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
        $scope.loading = false;
      }).error(function(data, status) {
        $scope.errors = data;
        $scope.loading = false;
      });
    }
  }
]);

docosumoControllers.controller('ModalDemoCtrl', ['$scope', '$modal', '$http', function ($scope, $modal, $http) {
  $scope.items = [];
  $scope.errors = [];

  $scope.open = function (id) {
    $http.get('/cities/' + id + '.json', {}).success(function(data, status, headers, config) {
      $scope.items = data;
      var modalInstance = $modal.open({
        templateUrl: 'myModalContent.html',
        controller: ModalInstanceCtrl,
        size: 'lg',
        resolve: {
          items: function () {
            return $scope.items;
          }
        }
      });
    }).error(function(data, status) {
      $scope.errors = data;
    });
    // modalInstance.result.then(function (selectedItem) {
    //   $scope.selected = selectedItem;
    // }, function () {
    //   // $log.info('Modal dismissed at: ' + new Date());
    // });
  };
}
]);

var ModalInstanceCtrl = function ($scope, $modalInstance, items) {
  $scope.items = items;
  $scope.selected = {
    item: $scope.items[0]
  };

  $scope.ok = function () {
    $modalInstance.close($scope.selected.item);
  };

  $scope.cancel = function () {
    $modalInstance.dismiss('cancel');
  };
};
