app.controller 'MainCtrl', ($scope, Restangular, DTOptionsBuilder, DTColumnBuilder) ->

  $scope.dtOptions = DTOptionsBuilder.newOptions().withOption("ajax",
    url: "http://dev.eve.com/api/v1/map_solar_systems"
    type: "GET"
    dataSrc: 'data'
  ).withOption("serverSide", true).withOption('processing', true).withPaginationType("full_numbers")

  $scope.dtColumns = [
    DTColumnBuilder.newColumn("rName").withTitle("Region Name")
    DTColumnBuilder.newColumn("cName").withTitle("Constellation Name")
    DTColumnBuilder.newColumn("sName").withTitle("Solar System Name")
    DTColumnBuilder.newColumn("sJumps").withTitle("Ship Jumps")
  ]

  return