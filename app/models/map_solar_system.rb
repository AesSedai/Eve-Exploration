class MapSolarSystem < ActiveRecord::Base

  self.table_name = 'mapSolarSystems'

  belongs_to :map_constellation
  belongs_to :map_region

end