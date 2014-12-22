class InvItem < ActiveRecord::Base
  self.table_name = 'inv_item'
  self.primary_key = :item_id

end
