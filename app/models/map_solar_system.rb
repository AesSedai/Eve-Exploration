class MapSolarSystem < ActiveRecord::Base
  self.table_name = 'map_solar_system'
  self.primary_key = :solar_system_id

  belongs_to :map_constellation, foreign_key: 'constellation_id'
  belongs_to :map_region, foreign_key: 'region_id'
  has_one :map_jump_history, foreign_key: 'solar_system_id'

end
