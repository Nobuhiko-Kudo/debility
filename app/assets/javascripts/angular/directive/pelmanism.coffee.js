
window.app.directive('cardPea', function() {
  return {
    restrict: 'E',
    scope: {
      cardType: '@'
    },
    template: '<div class="card-pea1 {{cardType}}"><div class="card-pea2 {{cardType}}"></div></div>'
  };
});
