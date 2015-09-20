window.app.controller('RouletteCtrl', ['$scope', '$timeout', function($scope, $timeout){
  $scope.stop_roulette = true;
  $scope.resultArray = [];
  $scope.count = 0;
  $scope.isResult = function(){
    return $scope.resultArray.length != 0;
  };
    var walking;

  $scope.click_roulette = function(){
    $scope.stop_roulette = false;
    catwalk();
    $scope.stopColor = "";
    $scope.isWhite = false;
    var timeout = 5800;
    var random = Math.round(Math.random() * 360 +0.5);
    var animate;
    var img,
        classList = [
                      "",
                      "open"
                    ],
        length = classList.length,
        index = 0;

    function catwalk() {
      walking = setTimeout(function walk() {
        img = document.getElementById("img");
        img.className = classList[index];
        index = ++index % length;
        catwalk();
      }, 500);
    };
       

    if(random % 2 == 1){
      animate = 3780;
    }else{
      animate = 3600;
    }

    $("#moto").rotate({
      angle: 0,
      animateTo:animate,
      duration:timeout
    });

    $timeout(
      function(){
        $scope.count = $scope.count + 1;
        $scope.stop_roulette = true;
        clearTimeout(walking);
        if(animate == 3780){
          $scope.stopColor = "白";
          $scope.isWhite = true;
        }else if(animate == 3600){
          $scope.stopColor = "赤";
          $scope.isWhite = false;
        }
        $scope.resultArray.push([$scope.count, $scope.stopColor]);
      }, timeout);
   }
  
  }]);
