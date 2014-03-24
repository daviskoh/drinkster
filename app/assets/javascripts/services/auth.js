angular.module('Drinkster').factory('Auth', ['$http', '$location', '$rootScope',
  function($http, $location, $rootScope) {
    return {
      isLoggedIn: function() {
        return window.currentUser.id ? true : false;
      },
      logIn: function(userData) {
        $http.post('/api/session.json', userData).success(function(resp, status, func, obj) {
          console.log('log in SUCCESS');
          console.log(arguments);

          window.currentUser.id = +resp;

          // $rootScope.user = obj.data.email;
          window.currentUser.email = obj.data.email;

          // redirect to current user's page
          $location.path('/users/' + resp);
        });
      },
      logOut: function() {
        $http.delete('/api/session').success(function() {
          window.currentUser.id = null;

          $location.path('/session/new');
        });
      }
    }
  }]);