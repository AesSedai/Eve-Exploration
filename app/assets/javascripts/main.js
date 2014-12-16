var app = angular.module("eve", ['restangular', 'ui.bootstrap', 'datatables']);

app.config(function($httpProvider, RestangularProvider) {

  RestangularProvider.setBaseUrl('');

  /*
    if(angular.mock){
        RestangularProvider.setBaseUrl('http://dev.esume.com/' + 'api/v1');
    }
    else{
    RestangularProvider.setBaseUrl('http://dev.esume.com/' + 'api/v1'); //$("#url-div").data("root-path") + 'api/v1');
    }
    */
});
