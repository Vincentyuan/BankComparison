app.factory('userListFac', ['$http', function($http) {
    return $http.get('json/user.json')
        .success(function(userData) {
            return userData;
        })
        .error(function(err) {
            alert("fal");
            return err;
        });
}]);