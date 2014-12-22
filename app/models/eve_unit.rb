class EveUnit < ActiveRecord::Base
  self.table_name = 'eve_unit'
  self.primary_key = :unit_id

end
