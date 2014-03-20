Drinkster.controller('UserCtrl', ['$scope', '$http', '$location', '$rootScope',
  function($scope, $http, $location, $rootScope) {
    $scope.getUserData = function() {
      return {
        'user': {
          'email': $scope.email,
          'password': $scope.password,
          'password_confirmation': $scope.passwordConfirmation
        }
      };
    };

    $scope.createUser = function() {
      $http.post('/api/users.json', $scope.getUserData()).success(function() {
        console.log('post SUCCESS');
        console.log(arguments);

        $location.path('/session/new');
      });
    };

    $scope.email = $rootScope.user;

    $scope.addIngredient = function() {

    };
  }]);