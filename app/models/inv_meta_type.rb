class InvMetaType < ActiveRecord::Base
  self.table_name = 'inv_meta_type'
  self.primary_key = :type_id

end
