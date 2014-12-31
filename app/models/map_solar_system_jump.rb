class MapSolarSystemJump < ActiveRecord::Base
  self.table_name = 'map_solar_system_jump'

  belongs_to :map_solar_system, foreign_key: 'from_solar_system_id'
  belongs_to :to_map_solar_system, :class_name => MapSolarSystem, foreign_key: 'to_solar_system_id'
  belongs_to :to_map_constellation, :class_name => MapConstellation, foreign_key: 'to_constellation_id'
  belongs_to :to_map_region, :class_name => MapRegion, foreign_key: 'to_region_id'

end
