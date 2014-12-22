class PlanetSchematic < ActiveRecord::Base
  self.table_name = 'planet_schematic'
  self.primary_key = :schematic_id

end
