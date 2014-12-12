var app = angular.module("eve", ['restangular', 'ui.select', 'ui.bootstrap']);

app.config(function($httpProvider, RestangularProvider) {
  $httpProvider.defaults.headers.common['X-CSRF-Token'] =
    $('meta[name=csrf-token]').attr('content');

  RestangularProvider.setBaseUrl('http://dev.esume.com/' + 'api/v1');

  /*
    if(angular.mock){
        RestangularProvider.setBaseUrl('http://dev.esume.com/' + 'api/v1');
    }
    else{
    RestangularProvider.setBaseUrl('http://dev.esume.com/' + 'api/v1'); //$("#url-div").data("root-path") + 'api/v1');
    }
    */
});
