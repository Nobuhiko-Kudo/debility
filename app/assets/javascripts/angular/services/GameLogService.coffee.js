angular.module('gameFactory').factory('GameLog', function($resource, $http){
  
  var GameLog = {};

  GameLog = function(){
    function GameLog(errorHandler){
      this.service =  $resource('/game_logs.json/:id',
        { id: this.id },
        { update: { method: 'PUT' },
          query: { method: 'GET', isArray: false }
        });
      this.errorHandler = errorHandler;
    };

    GameLog.prototype.find = function(id, successHandler) {
      return this.service.get( {
        id: id
        }, (function(list) {
            if (typeof successHandler === "function") {
              successHandler(list);
            }
          return list;
        } ), this.errorHandler);
    };

    return GameLog;

  }();
  return GameLog;

});
