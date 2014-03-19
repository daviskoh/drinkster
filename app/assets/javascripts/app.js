var drinkster = angular.module('drinkster', [
  // module dependencies
  'ngRoute',
  'ngResource',
  'drinksterControllers'
]);

drinkster.config(['$routeProvider', '$locationProvider',
  function($routeProvider, $locationProvider) {
    // use HTML5 pushstate to similuate real-looking URL
    $locationProvider.html5Mode(true);

    $routeProvider.
      when('/user/new', {
        templateUrl: './partials/user/new.html',
        controller: 'UserCtrl'
      }).
      otherwise({
        redirectTo: '/user/new'
      });
  }]);