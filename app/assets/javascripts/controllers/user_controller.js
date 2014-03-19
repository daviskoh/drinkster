Drinkster.controller('UserCtrl', ['$scope', '$http', function($scope, $http) {
  $scope.getData = function() {
    return {
      'user': {
        'email': $scope.email,
        'password': $scope.password,
        'password_confirmation': $scope.passwordConfirmation
      }
    };
  };

  $scope.createUser = function() {
    $http.post('/api/users.json', $scope.getData()).success(function() {
      console.log('post SUCESS');
      console.log(arguments);
    });
  };
}]);