//= require_self
//= require_tree ./controllers/.

var Drinkster = angular.module('Drinkster', [
  // module dependencies
  'ngRoute',
  'ngResource'
]);

Drinkster.config(['$routeProvider', '$locationProvider', '$httpProvider',
  function($routeProvider, $locationProvider, $httpProvider) {
    // use HTML5 pushstate to similuate real-looking URL
    $locationProvider.html5Mode(true);

    // permissions / request headers
    $httpProvider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');

    $routeProvider.
      when('/user/new', {
        templateUrl: '../assets/user/new.html',
        controller: 'UserCtrl',
        controllerAs: 'user'
      }).
      when('/session/new', {
        templateUrl: '../assets/session/new.html',
        controller: 'SessionCtrl',
        controllerAs: 'session'
      }).
      otherwise({
        templateUrl: '../assets/new.html',
        controller: 'UserCtrl'
      });
  }]);