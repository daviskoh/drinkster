Drinkster.controller('UserCtrl', ['$scope', '$http', '$location', '$routeParams',
  function($scope, $http, $location, $routeParams) {
    $scope.getUserData = function() {
      return {
        'user': {
          'email': $scope.email,
          'password': $scope.password,
          'password_confirmation': $scope.passwordConfirmation
        }
      };
    };

    $scope.getUserInfo = function() {
      // note, have access to user id in URL

      $http.get('/api/users/' + $routeParams.id + '.json').success(function(resp) {
        console.log('retrieved user info');
        console.log(arguments);

        $scope.thisUsersEmail = resp.email;
      });
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

    $scope.addIngredient = function() {
      $http.post('/api/users/' + window.currentUser.id + '/ingredients.json', $scope.getIngredientData()).success(function() {
        console.log('created Ingredient');
        console.log(arguments);

        $scope.ingredientName = '';

        $scope.getAllIngredients();
      });
    };

    $scope.getAllIngredients = function() {
      $http.get('/api/users/' + $routeParams.id + '/ingredients.json', {}).success(function(resp) {
        console.log('retrieved all Ingredients');
        console.log(arguments);

        $scope.ingredients = resp;
      });
    };

    $scope.getUserInfo();
    $scope.getAllIngredients();
  }]);