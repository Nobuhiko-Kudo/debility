window.app.controller('GameLogCtrl', ['$scope', 'GameLog', function($scope, GameLog){

    $scope.init = function(){ 
      $scope.is_active = 'list-group-item-info';
      //@game_log = GameLog.new(serverErrorHandler)
      this.gameLog = new GameLog(serverErrorHandler);

      $scope.game_list = this.gameLog.service.query()

      $scope.boolean_active = 'all';
    }

    $scope.click_active = function(click_index){
      $scope.boolean_active = click_index;
    }
    
    serverErrorHandler = function() {
      return alert("サーバーでエラーが発生しました。画面を更新し、もう一度試してください。");
    };

}]);
