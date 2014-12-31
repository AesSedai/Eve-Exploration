class MapRegion < ActiveRecord::Base
  self.table_name = 'map_region'
  self.primary_key = :region_id

  has_many :map_constellations, foreign_key: 'region_id'
  has_many :map_solar_systems, foreign_key: 'region_id'

  has_many :map_region_jumps, foreign_key: 'from_region_id'
  has_many :to_map_regions, :through => :map_region_jumps, foreign_key: 'to_region_id'
end
