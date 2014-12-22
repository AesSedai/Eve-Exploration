class AgtAgent < ActiveRecord::Base
  self.table_name = 'agt_agent'
  self.primary_key = :agent_id

end
