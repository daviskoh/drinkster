Drinkster.controller('NavigationCtrl', ['$scope', 'SessionCtrl',
  function($scope, SessionCtrl) {
    $scope.$watch( function () { return SessionCtrl.isLoggedIn(); }, function ( isLoggedIn ) {
      $scope.isLoggedIn = isLoggedIn;
    });
  }]);