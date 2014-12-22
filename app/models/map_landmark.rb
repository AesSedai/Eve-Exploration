class MapLandmark < ActiveRecord::Base
  self.table_name = 'map_landmark'
  self.primary_key = :landmark_id

end
