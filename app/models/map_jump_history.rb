class MapJumpHistory < ActiveRecord::Base
  self.table_name = 'map_jump_history'
  self.primary_key = :solar_system_id

  belongs_to :map_solar_system, foreign_key: 'solar_system_id'

end
