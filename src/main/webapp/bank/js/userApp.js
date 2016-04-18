
var app = angular.module('mainUserApp', ['ngRoute']);

app.config(function ($routeProvider){
	$routeProvider
		.when('/',{
		templateUrl:'loginForm.html'
		})
		.when('/login',{
		templateUrl:'studentSpace.html'
		})
		.when('/apply',{
			templateUrl:'applyAccount.html'
		})
		.when('/myCommands',{
			templateUrl:'myCommand.html'
		})
		.when('/applied',{
			templateUrl:'submitApply.html'
		})
		.otherwise({
		redirectTo:'/'
		});
	/*$locationProvider.html5Mode(true);*/
});




