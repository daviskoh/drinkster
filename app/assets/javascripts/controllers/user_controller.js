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

    $scope.getIngredientData = function() {
      return {
        'ingredient': {
          'name': $scope.ingredientName
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

    $scope.currentUserEmail = $rootScope.user;

    $scope.addIngredient = function() {
      $http.post('/api/users/' + window.currentUser + '/ingredients.json', $scope.getIngredientData()).success(function() {
        console.log('created Ingredient');
        console.log(arguments);
      });
    };

    $scope.getAllIngredients = function() {
      $http.get('/api/users/' + window.currentUser + '/ingredients.json', {}).success(function(resp) {
        console.log('retrieved all Ingredients');
        console.log(arguments);

        $scope.ingredients = resp;
      });
    };

    $scope.getAllIngredients();
  }]);