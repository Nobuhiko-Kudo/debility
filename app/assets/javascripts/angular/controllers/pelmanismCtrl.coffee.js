window.app.controller('pelmanismCtrl', ['$scope','$timeout', function($scope, $timeout ) {

    $scope.cards = [
      {name:'java1', img:'java.png', status:false, open:false},
      {name:'java2', img:'java.png', status:false, open:false},
      {name:'ruby1', img:'ruby.png', status:false, open:false},
      {name:'ruby2', img:'ruby.png', status:false, open:false},
      {name:'php1', img:'php.png', status:false, open:false},
      {name:'php2', img:'php.png', status:false, open:false},
      {name:'js1', img:'js.png', status:false, open:false},
      {name:'js2', img:'js.png', status:false, open:false},
      {name:'perl1', img:'perl.png', status:false, open:false},
      {name:'perl2', img:'perl.png', status:false, open:false},
      {name:'pyson1', img:'pyson.png', status:false, open:false},
      {name:'pyson2', img:'pyson.png', status:false, open:false},
      {name:'html1', img:'html.png', status:false, open:false},
      {name:'html2', img:'html.png', status:false, open:false},
      {name:'haskell1', img:'haskell.png', status:false, open:false},
      {name:'haskell2', img:'haskell.png', status:false, open:false},
    ];
    $scope.gottenCards = [];
    $scope.firstFlip = true;
    $scope.canFlip = true;
		$scope.openedCard;
    $scope.flipNum = 0;
		$scope.correctNum = 0;
    $scope.compFlg = false;
		$scope.score = 0;
    $scope.firstCard = 'undefined';
    $scope.cards.sort(
        function() {
            return Math.random() - 0.5;
        }
    );
    $scope.timer = 0;
    var stop;
    function runTimer() {
      stop = $timeout(function() {
          $scope.timer++;
          runTimer();
        }, 1000);
    }
    function stopTimer() {
      $timeout.cancel(stop);
    }

		$scope.judge = function(card,firstCard) {

			if (firstCard.img == card.img) {
        return true
			}else {
        return false
			}
		}
    isComp = function() {
      for(i = 0; i<$scope.cards.length; i++){
        if($scope.cards[i].status == false ){
          return false;
        }
      }
      return true;
		}
    $scope.turn = function(card) {
      if($scope.firstFlip){
        runTimer();
      }
      $scope.firstFlip = false;
      if($scope.firstCard === card || !$scope.canFlip ){
        return;
      }
      card.open = true;
			if ($scope.firstCard == 'undefined') {
				// 一枚目
				$scope.firstCard = card;
			}else {
				// 二枚目
        $scope.flipNum++;
        $scope.canFlip = false;
        var result = $scope.judge(card,$scope.firstCard);
        if(result){
          //正解
          $scope.correctNum++;
          $timeout(function (firstCard) {
            card.status = true;
            $scope.gottenCards.push({name:card.name});
            firstCard.status = true;
            if (isComp()){
              stopTimer();
              $scope.compFlg = true;
            }
            $scope.canFlip = true;
          }, 1000,true,$scope.firstCard);

        }else{
          //不正解
          $timeout(function (firstCard) {
            card.open = false;
            firstCard.open = false;
            $scope.canFlip = true;
          }, 1000,true,$scope.firstCard);
        }
				$scope.firstCard = 'undefined';

			}
		}

}]);
