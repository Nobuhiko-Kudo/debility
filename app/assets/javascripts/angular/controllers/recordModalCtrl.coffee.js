window.app.controller('recordModalCtrl', ['$scope','$http', function($scope, $http) {

    $scope.getGameRecord = function(game_id){
      $http({
        method : 'GET',
        url : '/game_logs/getGameRecord/'+game_id
      }).success(function(data, status) {
        //成功
      }).error(function(data, status) {
        //失敗
      });
    }
}]);
