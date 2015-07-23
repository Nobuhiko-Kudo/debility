# AngularJSの設定ファイル
# 依存ライブラリを記述する
window.app = angular.module('gameFactory', [])

# CSRFのトークンを設定するようにする
window.app.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

# AngularJSがturbolinksと一緒に動くようにする
$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
