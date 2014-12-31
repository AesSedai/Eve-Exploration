class MapRegionJump < ActiveRecord::Base
  self.table_name = 'map_region_jump'

  belongs_to :map_region, foreign_key: 'from_region_id'
  belongs_to :to_map_region, :class_name => MapRegion, foreign_key: 'to_region_id'

end
