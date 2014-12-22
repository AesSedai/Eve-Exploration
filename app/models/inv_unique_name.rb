class InvUniqueName < ActiveRecord::Base
  self.table_name = 'inv_unique_name'
  self.primary_key = :item_id

end
