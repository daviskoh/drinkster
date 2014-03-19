//= require_self
//= require_tree ./controllers/.

var Drinkster = angular.module('Drinkster', [
  // module dependencies
  'ngRoute',
  'ngResource'//,
  // 'drinksterControllers'
]);

Drinkster.config(['$routeProvider', '$locationProvider', '$httpProvider',
  function($routeProvider, $locationProvider, $httpProvider) {
    // use HTML5 pushstate to similuate real-looking URL
    $locationProvider.html5Mode(true);

    $httpProvider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

    $routeProvider.
      when('/user/new', {
        templateUrl: '../assets/new.html',
        controller: 'UserCtrl'//,
        // controllerAs: 'user'
      }).
      otherwise({
        templateUrl: '../assets/new.html',
        controller: 'UserCtrl'
      });
  }]);