'use strict';
var app = angular.module('mainApp', ['ngRoute']);

app.config(function ($routeProvider){
	$routeProvider
	.when('/',{
		templateUrl:'loginForm.html'
	})
	.when('/login',{
		templateUrl:"list.html"
	})
	.when('/details',{
		templateUrl:"details.html"
	})
	.otherwise({
		redirectTo:'/'
	})
});


app.controller('loginCtrl',function($scope,$location,$http){
	$scope.submit=function(){
		var uname=$scope.username;
		var passwd=$scope.password;
		

		
		if($scope.username=="admin"&& $scope.password=="admin")
		{	
			$location.path('/login');
			alert("success");
			// get data list from the server 
		}else{
			alert("faild");
		}
	};
});

app.controller('listController',function($scope,$location,$http){
	//read data from server

	//$http.get("url").success(function (response) {$scope.requestList = response.requestList;});
	$scope.requestList=[{userName:'requestList',requestId:'0001'}];
	//binding to the scope


	$scope.details=function(obj){
		//alert(this.getData());
	//	alert(obj.target.getAttribute("userId"));
		$location.path("details");
		//get the user id 
	};
	//test code
	 $scope.clickEvent = function(obj) {
        console.log(obj);
     //   alert(obj.target.getAttribute("data"));
     //   alert(obj.target.attributes.data.value);
     //   alert(obj.target.getAttribute("id"));
     //   alert(obj.target.attributes.id.value);
    };



});