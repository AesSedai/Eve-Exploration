class MapDenormalize < ActiveRecord::Base
  self.table_name = 'map_denormalize'
  self.primary_key = :item_id

end
