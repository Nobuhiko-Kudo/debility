window.app.controller('GameLogCtrl', ['$scope', 'GameLog', function($scope, GameLog){

    $scope.init = function(){ 
      $scope.level = 1;
      $scope.is_active = 'list-group-item-info';
      this.gameLog = new GameLog(serverErrorHandler);
      $scope.all_games = this.gameLog.service.query({},
        function(value, responseHeader){ 
          $scope.game_result = {}
          //game_list(game一覧をまわす)　{game_id: ?,game_name: ?}
          for(var i = 0;i < value.game_list.length; i++){
            var game_name = value.game_list[i].game_name;
            $scope.game_result[game_name] = {1: {}, 2: {}, 3: {}};
            //key(cpuのレベル)をまわす) [1,2,3]
            for(key in $scope.game_result[game_name]){
              result_game = value.games[game_name].filter(cpuLevel, key);
              //cpuのレベルでフィルターした結果をまわす {game_name: ?,user_name: ?,cpu_level: ?}
              for(var j = 0;j < result_game.length; j++){
                var user = result_game[j].user_name;
                if($scope.game_result[game_name][key][user] == undefined){
                  $scope.game_result[game_name][key][user] = 1;
                }else{
                  $scope.game_result[game_name][key][user] += 1;
                }
              }
            }
          }
        }, function(){console.log('Not Found')});
      $scope.boolean_active = 'all';
    }

    $scope.click_active = function(click_index){
      $scope.boolean_active = click_index;
      $scope.game_name = $scope.all_games.game_list[click_index].game_name
    }

    $scope.click_active_all = function(){
      $scope.boolean_active = 'all';
    } 
    
    serverErrorHandler = function() {
      return alert("サーバーでエラーが発生しました。画面を更新し、もう一度試してください。");
    };

    function cpuLevel(all_game){
      //呼び出し元の第二引数で指定した値がthisに入る
      return all_game.cpu_level == this;
    }

    function count(result){
      return this.user == result.user_name;
    }

    $scope.cpu_level = function(level){
      $scope.level = level;
    }
}]);
