class MapConstellation < ActiveRecord::Base

  self.table_name = 'mapConstellations'

  belongs_to :map_region

  has_many :map_solar_systems, foreign_key: 'constellationID'

end