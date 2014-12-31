app.controller 'MainCtrl', ($scope, Restangular, DTOptionsBuilder, DTColumnBuilder) ->

  $scope.main =
    refreshTime: 0

  Restangular.oneUrl('time', 'http://dev.eve.com/api/v1/map_solar_systems/?time').get().then((response)->
    $scope.main.refreshTime = parseInt(response)
    $scope.$broadcast('timer-set-countdown', $scope.main.refreshTime)
    $scope.$broadcast('timer-start');
  )

  $scope.dtOptions = DTOptionsBuilder.newOptions().withOption("ajax",
    url: "http://dev.eve.com/api/v1/map_solar_systems/?to_data_table"
    type: "GET"
    dataSrc: 'data'
  ).withOption("serverSide", true).withOption('processing', true).withOption('order', [3, 'desc']).withPaginationType("full_numbers")

  $scope.dtColumns = [
    DTColumnBuilder.newColumn("region_name").withTitle("Region Name")
    DTColumnBuilder.newColumn("constellation_name").withTitle("Constellation Name")
    DTColumnBuilder.newColumn("solar_system_name").withTitle("Solar System Name")
    DTColumnBuilder.newColumn("ship_jumps").withTitle("Ship Jumps")
  ]

  return