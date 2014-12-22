class ChrAncestry < ActiveRecord::Base
  self.table_name = 'chr_ancestry'
  self.primary_key = :ancestry_id

end
