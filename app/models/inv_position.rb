class InvPosition < ActiveRecord::Base
  self.table_name = 'inv_position'
  self.primary_key = :item_id

end
