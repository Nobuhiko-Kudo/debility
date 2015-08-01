window.app.controller('headerCtrl', ['$scope','$http', function($scope,$http) {
    $scope.init = function(){
      $scope.showUserName = false;
      $scope.showRegigstForm = true;
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
}]);
