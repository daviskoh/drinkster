Drinkster.controller('NavigationCtrl', ['$scope', 'Auth',
  function($scope, Auth) {
    $scope.$watch( function() { return Auth.isLoggedIn(); }, function( isLoggedIn ) {
      $scope.isLoggedIn = isLoggedIn;
    });

    $scope.logOut = function() {
      console.log('logging Out');
      Auth.logOut();
    };
  }]);