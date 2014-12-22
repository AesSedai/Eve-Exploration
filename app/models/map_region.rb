class MapRegion < ActiveRecord::Base
  self.table_name = 'map_region'
  self.primary_key = :region_id

  has_many :map_constellations, foreign_key: 'region_id'
  has_many :map_solar_systems, foreign_key: 'region_id'

end
