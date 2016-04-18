app.factory('bankListFac', ['$http', function($http) {
    return $http.get('json/bank.json')
        .success(function(bankData) {

            return bankData;
        })
        .error(function(err) {
            alert("fal");
            return err;
        });
}]);