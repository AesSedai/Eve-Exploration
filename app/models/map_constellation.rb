class MapConstellation < ActiveRecord::Base
  self.table_name = 'map_constellation'
  self.primary_key = :constellation_id

  belongs_to :map_region, foreign_key: 'region_id'
  has_many :map_solar_systems, foreign_key: 'constellation_id'

  has_many :map_constellation_jumps, foreign_key: 'from_constellation_id'
  has_many :to_map_constellations, :through => :map_constellation_jumps, foreign_key: 'to_constellation_id'
  has_many :to_map_regions, -> {where ('map_constellation_jump.to_region_id != map_constellation_jump.from_region_id')}, :through => :map_constellation_jumps, foreign_key: 'to_region_id'
end
