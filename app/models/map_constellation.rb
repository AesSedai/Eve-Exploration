class MapConstellation < ActiveRecord::Base
  self.table_name = 'map_constellation'
  self.primary_key = :constellation_id

  belongs_to :map_region, foreign_key: 'region_id'
  has_many :map_solar_systems, foreign_key: 'constellation_id'

end
