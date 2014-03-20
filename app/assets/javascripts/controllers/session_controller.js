Drinkster.controller('SessionCtrl', ['$scope', '$rootScope', '$http', '$location', 'Auth',
  function($scope, $rootScope, $http, $location, Auth) {
    $scope.getData = function() {
      return {
        'email': $scope.email,
        'password': $scope.password
      };
    };

    $scope.logIn = function() {
      Auth.logIn($scope.getData());
    };
  }]);