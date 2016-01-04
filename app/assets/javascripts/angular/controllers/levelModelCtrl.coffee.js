
window.app.controller('levelModalCtrl', ['$scope','$modalInstance', 'game_id', function($scope, $modalInstance, game_id) {

    $scope.game_url = "games/"+game_id;

    $scope.ok = function(){
      $modalInstance.close();
    }
    $scope.cancel = function(){
      $modalInstance.dismiss();
    }
}]);
