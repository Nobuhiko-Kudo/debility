window.app.controller('RouletteCtrl', ['$scope', '$timeout', function($scope, $timeout){
  //ルーレットが止まっているか
  $scope.stop_roulette = true;
  //猫がスタンバイ状態か
  $scope.cat_stanby = true;
  //ルーレットの結果を詰める
  $scope.resultArray = [];
  //ルーレットの回数
  $scope.count = 0;
  //履歴を表示するかの判定
  $scope.isResult = function(){
    return $scope.resultArray.length != 0;
  };
  var walking;

  //ルーレットをクリックしたら呼ばれる
  $scope.click_roulette = function(){
  var timeout = 5800,
      random = Math.round(Math.random() * 6 +0.5),
      animate,
      img,
      classList = [
                    "",
                    "open"
                  ],
      length = classList.length,
      index = 0;

    $scope.stop_roulette = false;
    catwalk();
    $scope.stopColor = "";
    $scope.isWhite = false;

    //猫が歩き出す処理
    function catwalk() {
      walking = setTimeout(function walk() {
        img = document.getElementById("img");
        img.className = classList[index];
        index = ++index % length;
        catwalk();
      }, 500);
    };
       

    //ルーレットの回転数
    if(random % 2 == 1){
      animate = 3780;
    }else{
      animate = 3600;
    }

    //ルーレットを回す処理
    $("#moto").rotate({
      angle: 0,
      animateTo:animate,
      duration:timeout
    });

    //ルーレットが止まったときと同時に処理が走る
    $timeout(
      //結果を表示して猫をストップさせる処理と履歴にプッシュする
      function(){
        $scope.count = $scope.count + 1;
        $scope.stop_roulette = true;
        $scope.cat_stanby = false;
        clearTimeout(walking);
        if(animate == 3780){
          $scope.stopColor = "白";
          $scope.isWhite = true;
        }else if(animate == 3600){
          $scope.stopColor = "紅";
          $scope.isWhite = false;
        }
        console.log(random);
        $scope.resultArray.push([$scope.count, $scope.stopColor]);
        $timeout(
            function(){
              //猫をスタンバイ状態にする。
              if($scope.stop_roulette){
                $scope.cat_stanby = true;
              }
            }, 3000); 
      }, timeout);
   }
  
  }]);
