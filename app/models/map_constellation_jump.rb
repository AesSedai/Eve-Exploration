class MapConstellationJump < ActiveRecord::Base
  self.table_name = 'map_constellation_jump'

  belongs_to :map_constellation, foreign_key: 'from_constellation_id'
  belongs_to :to_map_constellation, :class_name => MapConstellation, foreign_key: 'to_constellation_id'
  belongs_to :to_map_region, :class_name => MapRegion, foreign_key: 'to_region_id'

end
