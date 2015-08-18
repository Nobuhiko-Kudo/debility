window.app.controller('GameLogCtrl', ['$scope', 'GameLog', function($scope, GameLog){

    $scope.init = function(){ 
      $scope.is_active = 'list-group-item-info';
      this.gameLog = new GameLog(serverErrorHandler);
      $scope.all_games = this.gameLog.service.query()
      $scope.boolean_active = 'all';
    }

    $scope.click_active = function(click_index){
      $scope.boolean_active = click_index;
      game_id = click_index + 1;
      $scope.game_ranking = this.gameLog.find(game_id);
    }

    $scope.click_active_all = function(){
      $scope.boolean_active = 'all';
    } 
    
    serverErrorHandler = function() {
      return alert("サーバーでエラーが発生しました。画面を更新し、もう一度試してください。");
    };

}]);
