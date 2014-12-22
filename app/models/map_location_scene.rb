class MapLocationScene < ActiveRecord::Base
  self.table_name = 'map_location_scene'
  self.primary_key = :location_id

end
