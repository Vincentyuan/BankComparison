'use strict';
app.controller('customersCtrl', function($scope, $http) {
  $http.get("http://localhost:8080/bilibili/city")
  .success(function (response) {$scope.cities = response;});
});