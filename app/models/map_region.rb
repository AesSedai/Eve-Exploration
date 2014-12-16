class MapRegion < ActiveRecord::Base

  self.table_name = 'mapRegions'

  has_many :map_constellations, foreign_key: 'regionID'
  has_many :map_solar_systems, foreign_key: 'regionID'

end