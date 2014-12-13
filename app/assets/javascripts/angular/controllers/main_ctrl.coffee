app.controller 'MainCtrl', ($scope, Restangular) ->

  $scope.data = "blank"

  Restangular.setResponseExtractor (data, operation, route, url, response, deferred) ->
    x2js = new X2JS()
    return x2js.xml_str2json(data).eveapi.result.rowset.row

  Restangular.all('map/Jumps.xml.aspx').getList().then((response) ->
    $scope.data = response
  )

  return