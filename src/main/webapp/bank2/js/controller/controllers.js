'use strict';
app.controller('studentCtrl', function($scope, $http) {
  $http.get("http://localhost:8080/bilibili/city")
  .success(function (response) {$scope.cities = response;});
});

app.controller('loginCtrl',function(userListFac,$scope,$location,$http,$rootScope){
  //alert("start");
  userListFac.success(function(userData){$scope.users=userData.userList;});
  $rootScope.loginUser;
  $rootScope.login="false";
  $scope.mail="admin";
  $scope.password="admin";
  //$rootScope.mail='';
  //alert($scope.users[0].e_mail);
  $scope.submit=function(){
    var mail=$scope.mail;
    var passwd=$scope.password;
    var i=0;
    for(;i<$scope.users.length;i++){
      if($scope.users[i].e_mail===mail&&$scope.users[i].pass===passwd)
      {
        $rootScope.loginUser=$scope.users[i];
        $rootScope.login="true";
        $location.path('/login');
        break;
      }

      }
    if(i===$scope.users.length)
      alert("faild");
    };


});

app.controller('spaceCtrl',function($scope,$location,$http,$rootScope,commandsFac){
  commandsFac.success(function(comDate){$scope.myCommands=comDate.commandList;
    $scope.latestCommand=$scope.myCommands[0];});
 /* $scope.commandN='2012';
  $scope.bank='BNP';$scope.myCommands
  $scope.holderName="Xinyu";
  $scope.progress="manager checking the documents...";
  $scope.manager="Adela";
  $scope.time="2015/09/02";*/

  $scope.goToApply=function(){
   $location.path('/apply');
  };
  $scope.seeMyCommands=function(){
    $location.path('/myCommands');
  };
});

