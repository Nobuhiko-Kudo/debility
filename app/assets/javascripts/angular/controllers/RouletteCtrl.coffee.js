window.app.controller('RouletteCtrl', ['$scope', function($scope){
  $scope.click_roulette = function(){
    //回転速度
    var speed = 3;
    //ルーレットの分割数
    var divied =6;
    //◯秒後に停止する時間
    var timeout = 8000;
      
    //停止位置の設定
    var stopAngle = Math.round(Math.random() * 360 + 0.5);

    //ルーレットの角度の変数
    var angle = stopAngle;

    //ルーレットの分割数から1エリア分の角度を求める。
    var section = 360/divied;

    //停止位置がどのエリアにあるかを調べて、該当する番号をstopNumberに格納する
    for(i=1; i<=divied; i++){
      if(section*(i-1)+1 <= stopAngle && stopAngle <= section*i){
        stopNumber = i
      }
    };

    //5mmsecでspeed分の数値分回転する
    var rotation = setInterval(function(){
      $("#moto").rotate(angle);
      angle += speed;
    },5);

    //timeout秒後に停止させる処理
    setTimeout(function(){
      //クルクル処理をしているsetIntervalをclear
      clearInterval(rotation);
      //setIntervalで増えた余分な数値を減らし、逆回転を防ぐためにマイナス値にする
      angle = angle%360-360;
      //停止位置までのアニメーション。完了するとresult()が実行される
      $("#mato").rotate({
        angle: angle, 
        animateTo: stopAngle,
        callback: result
      });
    }, timeout);
  };

  $scope.catwalk = (function(win, doc) {
    "use strict";
    var img = doc.getElementById("img"),
        classList = [
            "",
            "open"
        ],
        length = classList.length,
        index = 0;
    
    setInterval(function() {
        img.className = classList[index];
        index = ++index % length;
    }, 200);  
  })(this, document);
}]);
