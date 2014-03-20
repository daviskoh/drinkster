Drinkster.factory('Auth', ['$http', '$location',
  function($http, $location) {
    return {
      // setUserID: function(userID) {
      //   currentUser = +userID;
      // },
      isLoggedIn: function() {
        return window.currentUser ? true : false;
      },
      logIn: function(userData) {
        $http.post('/api/session.json', userData).success(function(resp) {
          console.log('log in SUCCESS');
          console.log(arguments);

          window.currentUser = +resp;

          // redirect to current user's page
          $location.path('/users/' + resp);
        });
      },
      logOut: function() {
        $http.delete('/api/session').success(function() {
          window.currentUser = null;

          $location.path('/session/new');
        });
      }
    }
  }]);