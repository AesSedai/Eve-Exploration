class RamActivity < ActiveRecord::Base
  self.table_name = 'ram_activity'
  self.primary_key = :activity_id

end
