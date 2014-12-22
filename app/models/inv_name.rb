class InvName < ActiveRecord::Base
  self.table_name = 'inv_name'
  self.primary_key = :item_id

end
