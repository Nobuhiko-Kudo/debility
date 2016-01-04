window.app.controller('recordCtrl', ['$scope','$http','$modal','$log', function($scope, $http, $modal, $log) {

  $scope.getGameRecord = (function(game_id){
      $http({
        method : 'GET',
        url : '/game_logs/'.concat(game_id).concat('/record.json')
      }).success(function(data, status) {
        //成功
        var modalInstance = $modal.open({
          templateUrl: "recordModal.html",
          controller: "recordModalCtrl",
          resolve: {
            items: function(){
              return data;
            }
          }
        });
        modalInstance.result.then(
          function(){
            $log.debug("クローズ");
          }, function(){
            $log.debug("dismissed");
          });
      }).error(function(data, status) {
        //失敗
        console.log("失敗");
      });
  });

  $scope.selectLevel = (function(game_id){
    var modalInstance = $modal.open({
      templateUrl: "levelModal.html",
      controller: "levelModalCtrl",
      resolve: {
        game_id: function(){
          return game_id;
        }
      }
    });
    modalInstance.result.then();
  });
}]);
