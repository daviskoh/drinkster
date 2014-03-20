//= require_self
//= require_tree ./controllers/.
//= require_tree ./services/.

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
      when('/session/new', {
        templateUrl: '../assets/session/new.html',
        controller: 'SessionCtrl',
        controllerAs: 'session'
      }).
      when('/users/new', {
        templateUrl: '../assets/user/new.html',
        controller: 'UserCtrl',
        controllerAs: 'user'
      }).
      when('/users/:id', {
        templateUrl: '../assets/user/show.html',
        controller: 'UserCtrl',
        controllerAs: 'user'
      }).
      otherwise({
        redirectTo: '/session/new'
      });
  }]);

Drinkster.run(['$rootScope', '$location', 'Auth', function ($rootScope, $location, Auth) {
  $rootScope.$on('$routeChangeStart', function () {
    if (!Auth.isLoggedIn()) {
      console.log('DENY');

      event.preventDefault();
      
      $location.path('/session/new');
    }
  });
}]);