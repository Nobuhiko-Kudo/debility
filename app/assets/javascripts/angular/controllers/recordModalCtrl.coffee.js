window.app.controller('recordModalCtrl', ['$scope','$modalInstance', 'items', function($scope, $modalInstance, items) {
    $scope.data = items;
    $scope.ok = function(){
      $modalInstance.close();
    }
    $scope.cancel = function(){
      $modalInstance.dismiss();
    }
}]);
