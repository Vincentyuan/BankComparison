app.factory('commandsFac', ['$http', function($http) {
    return $http.get('json/command.json')
        .success(function(comDate) {
            return comDate;
        })
        .error(function(err) {
            alert("fal");
            return err;
        });
}]);