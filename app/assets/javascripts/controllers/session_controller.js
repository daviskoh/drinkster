Drinkster.controller('UserCtrl', ['$scope', '$http', function($scope, $http) {
  $scope.getData = function() {
    return {
      'user': {
        'email': $scope.email,
        'password': $scope.password,
      }
    };
  };

  $scope.logIn = function() {
    $http.post('/api/session.json', $scope.getData()).success(function() {
      
    });
  };
}]);