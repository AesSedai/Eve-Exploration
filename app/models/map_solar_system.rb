class MapSolarSystem < ActiveRecord::Base
  self.table_name = 'map_solar_system'
  self.primary_key = :solar_system_id

  belongs_to :map_constellation, foreign_key: 'constellation_id'
  belongs_to :map_region, foreign_key: 'region_id'
  has_one :map_jump_cache, foreign_key: 'solar_system_id'
  has_many :map_jump_histories, foreign_key: 'solar_system_id'

  has_many :map_solar_system_jumps, foreign_key: 'from_solar_system_id'
  has_many :to_map_solar_systems, :through => :map_solar_system_jumps, foreign_key: 'to_solar_system_id'
  has_many :to_map_constellations, -> {where ('map_solar_system_jump.to_constellation_id != map_solar_system_jump.from_constellation_id')}, :through => :map_solar_system_jumps, foreign_key: 'to_constellation_id'
  has_many :to_map_regions, -> {where ('map_solar_system_jump.to_region_id != map_solar_system_jump.from_region_id')}, :through => :map_solar_system_jumps, foreign_key: 'to_region_id'

end
