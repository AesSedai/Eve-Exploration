app.controller 'MainCtrl', ($scope, Restangular, DTOptionsBuilder, DTColumnDefBuilder) ->

  $scope.data = []
  $scope.api_data = []
  ###
  $scope.dtOptions = DTOptionsBuilder.newOptions().withPaginationType('full_numbers').withDisplayLength(20)
  $scope.dtColumnDefs = [
    DTColumnDefBuilder.newColumnDef(0),
    DTColumnDefBuilder.newColumnDef(1)
  ]
  ###

  Restangular.setResponseExtractor (data, operation, route, url, response, deferred) ->
    if url is 'https://api.eveonline.com/map/Jumps.xml.aspx'
      x2js = new X2JS()
      return x2js.xml_str2json(data).eveapi.result.rowset.row
    else
      return response.data

  Restangular.allUrl('eve-route', 'https://api.eveonline.com/map/Jumps.xml.aspx').getList().then((response) ->
    $scope.api_data = response
    console.log 'api_data', $scope.api_data.length, $scope.api_data

    Restangular.all('api/v1/map_solar_systems').getList().then((response) ->
      $scope.data = response
      console.log 'data', $scope.data.length, $scope.data

      for system in $scope.data
        for system2 in $scope.api_data
          if system.solarSystemID == parseInt(system2.solarSystemID)
            s = system
            s.shipJumps = parseInt(system2.shipJumps)
            break
        unless system.hasOwnProperty("shipJumps")
          system.shipJumps = 0

      console.log "final", $scope.data.length, $scope.data

    )

  )

  return