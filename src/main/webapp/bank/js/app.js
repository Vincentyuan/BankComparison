'use strict';
var app = angular.module('mainApp', ['ngRoute']);

app.config(function ($routeProvider){
	$routeProvider
	.when('/',{
		templateUrl:'managerloginForm.html'
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


app.controller('ManagerloginCtrl',function($scope,$location,$http){
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

app.controller('listController',function($scope,$location,$http,$rootScope){
	//read data from server

	//$http.get("url").success(function (response) {$scope.requestList = response.requestList;});
	//$scope.requestList=[{userName:'requestList',requestId:'0001'}];
	//binding to the scope

	//call web service

	$http.get("http://localhost:8080/PA8Presentation/request")
	.success(function (response) {$scope.requestList = response;});

	$scope.details=function(obj){
		//alert(this.getData());
	//	alert(obj.target.getAttribute("userId"));
		$rootScope.requestId=obj.target.getAttribute("userId");
		$location.path("details");
		//get the user id 
	};
	//test code
	 $scope.clickEvent = function(obj) {
        console.log(obj);
        alert(obj.target.getAttribute("data"));
        alert(obj.target.attributes.data.value);
        alert(obj.target.getAttribute("id"));
        alert(obj.target.attributes.id.value);
    };

});

app.controller('latestRequestCtrl',function($scope,$rootScope,$http){
	//show data

	$http.get("http://localhost:8080/PA8Presentation/request/"+$rootScope.requestId)
	.success(function (response){$scope.latestRequest = response;
	//	alert($scope.latestRequest.username);
	});
	//alert($scope.latestRequest.username);

});

app.controller('communicateCtrl',function($scope){
	$scope.sent=function(){
		alert("message has send to user");
	};
	$scope.details=function(){
		//alert(this.getData());
	//	alert(obj.target.getAttribute("userId"));
	//	$rootScope.requestId=obj.target.getAttribute("userId");
	//	$location.path("details");
	alert("message has send to user");
		//get the user id 
	};
});

app.controller('historyCtrl',function(){
	//show data

});