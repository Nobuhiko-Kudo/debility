window.app.controller('headerCtrl', ['$scope','$http','$cookieStore', function($scope, $http, $cookieStore ) {

    $scope.init = function(){
      var user_token = $cookieStore.get('user_token');

      if(user_token){
        $scope.getUserName(user_token);
      }else{
        $scope.showUserName = false;
        $scope.showRegigstForm = true;
      }
    }
    $scope.registerUserName = function(){

      $http({
      	method : 'POST',
      	url : '/users',
      	data: {'user_name':$scope.user_name}
      }).success(function(data, status) {
      	//成功
        $scope.showUserName = true;
        $scope.showRegigstForm = false;

        $scope.registed_user_name = data.user_name;
      }).error(function(data, status) {
      	//失敗
      });
    }
    $scope.getUserName = function(user_token){
      $http({
        method : 'GET',
        url : '/users/'+user_token
      }).success(function(data, status) {
        //成功
        $scope.showUserName = true;
        $scope.showRegigstForm = false;

        $scope.registed_user_name = data.user_name;
      }).error(function(data, status) {
        //失敗
      });
    }
}]);
