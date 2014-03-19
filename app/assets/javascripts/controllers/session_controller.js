Drinkster.controller('SessionCtrl', ['$scope', '$http', function($scope, $http) {
  $scope.getData = function() {
    return {
      'email': $scope.email,
      'password': $scope.password
    };
  };

  $scope.logIn = function() {
    $http.post('/api/session.json', $scope.getData()).success(function() {
      console.log('log in SUCCESS');
      console.log(arguments);

      $scope.loggedIn = true;
    });
  };

  $scope.loggedIn = false;

  $scope.isLoggedIn = function() {
    return $scope.loggedIn;
  };
}]);