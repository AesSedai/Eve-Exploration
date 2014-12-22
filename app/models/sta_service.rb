class StaService < ActiveRecord::Base
  self.table_name = 'sta_service'
  self.primary_key = :service_id

end
