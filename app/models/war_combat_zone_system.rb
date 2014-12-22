class WarCombatZoneSystem < ActiveRecord::Base
  self.table_name = 'war_combat_zone_system'
  self.primary_key = :solar_system_id

end
