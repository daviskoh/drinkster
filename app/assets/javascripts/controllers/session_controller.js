Drinkster.controller('SessionCtrl', ['$scope', '$http', '$location', function($scope, $http, $location) {
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

      // create show page / profile
      // acquire user params
      // redirect to /users/user.id / show page
        // render data
    });
  };

  $scope.loggedIn = false;

  $scope.isLoggedIn = function() {
    return $scope.loggedIn;
  };
}]);