# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141217183654) do

  create_table 'agt_agent', primary_key: 'agent_id', force: true do |t|
    t.integer 'division_id',    limit: 1
    t.integer 'corporation_id'
    t.integer 'location_id'
    t.integer 'level',          limit: 1
    t.integer 'quality',        limit: 2
    t.integer 'agent_type_id'
    t.boolean 'is_locator'
  end

  add_index 'agt_agent', ['corporation_id'], name: 'agtAgents_IX_corporation', using: :btree
  add_index 'agt_agent', ['location_id'], name: 'agtAgents_IX_station', using: :btree

  create_table 'agt_agent_type', primary_key: 'agent_type_id', force: true do |t|
    t.string 'agent_type', limit: 50
  end

  create_table 'agt_research_agent', id: false, force: true do |t|
    t.integer 'agent_id', null: false
    t.integer 'type_id',  null: false
  end

  add_index 'agt_research_agent', ['type_id'], name: 'agtResearchAgents_IX_type', using: :btree

  create_table 'cert_cert', primary_key: 'cert_id', force: true do |t|
    t.text 'description'
    t.integer 'groupid'
    t.string 'name'
  end

  create_table 'cert_mastery', id: false, force: true do |t|
    t.integer 'type_id'
    t.integer 'mastery_level'
    t.integer 'cert_id'
  end

  create_table 'cert_skill', id: false, force: true do |t|
    t.integer 'cert_id'
    t.integer 'skill_id'
    t.integer 'cert_level_int'
    t.integer 'skill_level'
    t.string  'cert_level_text', limit: 8
  end

  create_table 'chr_ancestry', primary_key: 'ancestry_id', force: true do |t|
    t.string  'ancestry_name',     limit: 100
    t.integer 'bloodline_id',      limit: 1
    t.string  'description',       limit: 1000
    t.integer 'perception',        limit: 1
    t.integer 'willpower',         limit: 1
    t.integer 'charisma',          limit: 1
    t.integer 'memory',            limit: 1
    t.integer 'intelligence',      limit: 1
    t.integer 'icon_id'
    t.string  'short_description', limit: 500
  end

  create_table 'chr_attribute', primary_key: 'attribute_id', force: true do |t|
    t.string  'attribute_name',    limit: 100
    t.string  'description',       limit: 1000
    t.integer 'icon_id'
    t.string  'short_description', limit: 500
    t.string  'notes',             limit: 500
  end

  create_table 'chr_bloodline', primary_key: 'bloodline_id', force: true do |t|
    t.string  'bloodline_name',           limit: 100
    t.integer 'race_id',                  limit: 1
    t.string  'description',              limit: 1000
    t.string  'male_description',         limit: 1000
    t.string  'female_description',       limit: 1000
    t.integer 'ship_type_id'
    t.integer 'corporation_id'
    t.integer 'perception',               limit: 1
    t.integer 'willpower',                limit: 1
    t.integer 'charisma',                 limit: 1
    t.integer 'memory',                   limit: 1
    t.integer 'intelligence',             limit: 1
    t.integer 'icon_id'
    t.string  'short_description',        limit: 500
    t.string  'short_male_description',   limit: 500
    t.string  'short_female_description', limit: 500
  end

  create_table 'chr_faction', primary_key: 'faction_id', force: true do |t|
    t.string  'faction_name',           limit: 100
    t.string  'description',            limit: 1000
    t.integer 'race_i_ds'
    t.integer 'solar_system_id'
    t.integer 'corporation_id'
    t.float   'size_factor',            limit: 53
    t.integer 'station_count',          limit: 2
    t.integer 'station_system_count',   limit: 2
    t.integer 'militia_corporation_id'
    t.integer 'icon_id'
  end

  create_table 'chr_race', primary_key: 'race_id', force: true do |t|
    t.string  'race_name',         limit: 100
    t.string  'description',       limit: 1000
    t.integer 'icon_id'
    t.string  'short_description', limit: 500
  end

  create_table 'crp_activity', primary_key: 'activity_id', force: true do |t|
    t.string 'activity_name', limit: 100
    t.string 'description',   limit: 1000
  end

  create_table 'crp_npc_corporation', primary_key: 'corporation_id', force: true do |t|
    t.string  'size',                 limit: 1
    t.string  'extent',               limit: 1
    t.integer 'solar_system_id'
    t.integer 'investor_id1'
    t.integer 'investor_shares1',     limit: 1
    t.integer 'investor_id2'
    t.integer 'investor_shares2',     limit: 1
    t.integer 'investor_id3'
    t.integer 'investor_shares3',     limit: 1
    t.integer 'investor_id4'
    t.integer 'investor_shares4',     limit: 1
    t.integer 'friend_id'
    t.integer 'enemy_id'
    t.integer 'public_shares',        limit: 8
    t.integer 'initial_price'
    t.float   'min_security',         limit: 53
    t.boolean 'scattered'
    t.integer 'fringe',               limit: 1
    t.integer 'corridor',             limit: 1
    t.integer 'hub',                  limit: 1
    t.integer 'border',               limit: 1
    t.integer 'faction_id'
    t.float   'size_factor',          limit: 53
    t.integer 'station_count',        limit: 2
    t.integer 'station_system_count', limit: 2
    t.string  'description',          limit: 4000
    t.integer 'icon_id'
  end

  create_table 'crp_npc_corporation_division', id: false, force: true do |t|
    t.integer 'corporation_id',           null: false
    t.integer 'division_id',    limit: 1, null: false
    t.integer 'size',           limit: 1
  end

  create_table 'crp_npc_corporation_research_field', id: false, force: true do |t|
    t.integer 'skill_id',       null: false
    t.integer 'corporation_id', null: false
  end

  create_table 'crp_npc_corporation_trade', id: false, force: true do |t|
    t.integer 'corporation_id', null: false
    t.integer 'type_id',        null: false
  end

  create_table 'crp_npc_division', primary_key: 'division_id', force: true do |t|
    t.string 'division_name', limit: 100
    t.string 'description',   limit: 1000
    t.string 'leader_type',   limit: 100
  end

  create_table 'dgm_attribute_category', primary_key: 'category_id', force: true do |t|
    t.string 'category_name',        limit: 50
    t.string 'category_description', limit: 200
  end

  create_table 'dgm_attribute_type', primary_key: 'attribute_id', force: true do |t|
    t.string  'attribute_name', limit: 100
    t.string  'description',    limit: 1000
    t.integer 'icon_id'
    t.float   'default_value',  limit: 53
    t.boolean 'published'
    t.string  'display_name',   limit: 100
    t.integer 'unit_id',        limit: 1
    t.boolean 'stackable'
    t.boolean 'high_is_good'
    t.integer 'category_id',    limit: 1
  end

  create_table 'dgm_effect', primary_key: 'effect_id', force: true do |t|
    t.string  'effect_name',                        limit: 400
    t.integer 'effect_category',                    limit: 2
    t.integer 'pre_expression'
    t.integer 'post_expression'
    t.string  'description',                        limit: 1000
    t.string  'guid',                               limit: 60
    t.integer 'icon_id'
    t.boolean 'is_offensive'
    t.boolean 'is_assistance'
    t.integer 'duration_attribute_id',              limit: 2
    t.integer 'tracking_speed_attribute_id',        limit: 2
    t.integer 'discharge_attribute_id',             limit: 2
    t.integer 'range_attribute_id',                 limit: 2
    t.integer 'falloff_attribute_id',               limit: 2
    t.boolean 'disallow_auto_repeat'
    t.boolean 'published'
    t.string  'display_name',                       limit: 100
    t.boolean 'is_warp_safe'
    t.boolean 'range_chance'
    t.boolean 'electronic_chance'
    t.boolean 'propulsion_chance'
    t.integer 'distribution',                       limit: 1
    t.string  'sfx_name',                           limit: 20
    t.integer 'npc_usage_chance_attribute_id',      limit: 2
    t.integer 'npc_activation_chance_attribute_id', limit: 2
    t.integer 'fitting_usage_chance_attribute_id',  limit: 2
    t.text    'modifier_info',                      limit: 2147483647
  end

  create_table 'dgm_expression', primary_key: 'expression_id', force: true do |t|
    t.integer 'operand_id'
    t.integer 'arg1'
    t.integer 'arg2'
    t.string  'expression_value',        limit: 100
    t.string  'description',             limit: 1000
    t.string  'expression_name',         limit: 500
    t.integer 'expression_type_id'
    t.integer 'expression_group_id',     limit: 2
    t.integer 'expression_attribute_id', limit: 2
  end

  create_table 'dgm_type_attribute', id: false, force: true do |t|
    t.integer 'type_id',                 null: false
    t.integer 'attribute_id', limit: 2,  null: false
    t.integer 'value_int'
    t.float   'value_float',  limit: 53
  end

  create_table 'dgm_type_effect', id: false, force: true do |t|
    t.integer 'type_id',              null: false
    t.integer 'effect_id',  limit: 2, null: false
    t.boolean 'is_default'
  end

  create_table 'eve_icon', primary_key: 'icon_id', force: true do |t|
    t.string 'icon_file',   limit: 500, null: false
    t.text 'description'
  end

  create_table 'eve_unit', primary_key: 'unit_id', force: true do |t|
    t.string 'unit_name',    limit: 100
    t.string 'display_name', limit: 50
    t.string 'description',  limit: 1000
  end

  create_table 'industry_activity', id: false, force: true do |t|
    t.integer 'type_id',     default: 0, null: false
    t.integer 'time'
    t.integer 'activity_id', default: 0, null: false
  end

  add_index 'industry_activity', ['activity_id'], name: 'activityID', using: :btree

  create_table 'industry_activity_material', id: false, force: true do |t|
    t.integer 'type_id'
    t.integer 'activity_id'
    t.integer 'material_type_id'
    t.integer 'quantity'
    t.integer 'consume',          limit: 1, default: 1
  end

  add_index 'industry_activity_material', ['type_id', 'activity_id'], name: 'typeID_2', using: :btree
  add_index 'industry_activity_material', ['type_id'], name: 'typeID', using: :btree

  create_table 'industry_activity_probability', id: false, force: true do |t|
    t.integer 'type_id'
    t.integer 'activity_id'
    t.integer 'product_type_id'
    t.decimal 'probability',     precision: 3, scale: 2
  end

  add_index 'industry_activity_probability', ['product_type_id'], name: 'productTypeID', using: :btree
  add_index 'industry_activity_probability', ['type_id', 'activity_id'], name: 'typeID_2', using: :btree
  add_index 'industry_activity_probability', ['type_id'], name: 'typeID', using: :btree

  create_table 'industry_activity_product', id: false, force: true do |t|
    t.integer 'type_id'
    t.integer 'activity_id'
    t.integer 'product_type_id'
    t.integer 'quantity'
  end

  add_index 'industry_activity_product', ['product_type_id'], name: 'productTypeID', using: :btree
  add_index 'industry_activity_product', ['type_id', 'activity_id'], name: 'typeID_2', using: :btree
  add_index 'industry_activity_product', ['type_id'], name: 'typeID', using: :btree

  create_table 'industry_activity_skill', id: false, force: true do |t|
    t.integer 'type_id'
    t.integer 'activity_id'
    t.integer 'skill_id'
    t.integer 'level'
  end

  add_index 'industry_activity_skill', ['type_id', 'activity_id'], name: 'typeID_2', using: :btree
  add_index 'industry_activity_skill', ['type_id'], name: 'typeID', using: :btree

  create_table 'industry_blueprint', primary_key: 'type_id', force: true do |t|
    t.integer 'max_production_limit'
  end

  create_table 'inv_category', primary_key: 'category_id', force: true do |t|
    t.string  'category_name', limit: 100
    t.string  'description',   limit: 3000
    t.integer 'icon_id'
    t.boolean 'published'
  end

  create_table 'inv_contraband_type', id: false, force: true do |t|
    t.integer 'faction_id',                    null: false
    t.integer 'type_id',                       null: false
    t.float   'standing_loss',      limit: 53
    t.float   'confiscate_min_sec', limit: 53
    t.float   'fine_by_value',      limit: 53
    t.float   'attack_min_sec',     limit: 53
  end

  add_index 'inv_contraband_type', ['type_id'], name: 'invContrabandTypes_IX_type', using: :btree

  create_table 'inv_control_tower_resource', id: false, force: true do |t|
    t.integer 'control_tower_type_id',            null: false
    t.integer 'resource_type_id',                 null: false
    t.integer 'purpose',               limit: 1
    t.integer 'quantity'
    t.float   'min_security_level',    limit: 53
    t.integer 'faction_id'
  end

  create_table 'inv_control_tower_resource_purpose', primary_key: 'purpose', force: true do |t|
    t.string 'purpose_text', limit: 100
  end

  create_table 'inv_flag', primary_key: 'flag_id', force: true do |t|
    t.string  'flag_name', limit: 200
    t.string  'flag_text', limit: 100
    t.integer 'order_id'
  end

  create_table 'inv_group', primary_key: 'group_id', force: true do |t|
    t.integer 'category_id'
    t.string  'group_name',             limit: 100
    t.string  'description',            limit: 3000
    t.integer 'icon_id'
    t.boolean 'use_base_price'
    t.boolean 'allow_manufacture'
    t.boolean 'allow_recycler'
    t.boolean 'anchored'
    t.boolean 'anchorable'
    t.boolean 'fittable_non_singleton'
    t.boolean 'published'
  end

  add_index 'inv_group', ['category_id'], name: 'invGroups_IX_category', using: :btree

  create_table 'inv_item', primary_key: 'item_id', force: true do |t|
    t.integer 'type_id',               null: false
    t.integer 'owner_id',              null: false
    t.integer 'location_id', limit: 8, null: false
    t.integer 'flag_id',     limit: 2, null: false
    t.integer 'quantity',              null: false
  end

  add_index 'inv_item', ['location_id'], name: 'items_IX_Location', using: :btree
  add_index 'inv_item', ['owner_id', 'location_id'], name: 'items_IX_OwnerLocation', using: :btree

  create_table 'inv_market_group', primary_key: 'market_group_id', force: true do |t|
    t.integer 'parent_group_id'
    t.string  'market_group_name', limit: 100
    t.string  'description',       limit: 3000
    t.integer 'icon_id'
    t.boolean 'has_types'
  end

  create_table 'inv_meta_group', primary_key: 'meta_group_id', force: true do |t|
    t.string  'meta_group_name', limit: 100
    t.string  'description',     limit: 1000
    t.integer 'icon_id'
  end

  create_table 'inv_meta_type', primary_key: 'type_id', force: true do |t|
    t.integer 'parent_type_id'
    t.integer 'meta_group_id',  limit: 2
  end

  create_table 'inv_name', primary_key: 'item_id', force: true do |t|
    t.string 'item_name', limit: 200, null: false
  end

  create_table 'inv_position', primary_key: 'item_id', force: true do |t|
    t.float 'x',     limit: 53, default: 0.0, null: false
    t.float 'y',     limit: 53, default: 0.0, null: false
    t.float 'z',     limit: 53, default: 0.0, null: false
    t.float 'yaw',   limit: 24
    t.float 'pitch', limit: 24
    t.float 'roll',  limit: 24
  end

  create_table 'inv_trait', id: false, force: true do |t|
    t.integer 'type_id'
    t.integer 'skill_id'
    t.float   'bonus',      limit: 53
    t.text 'bonus_text'
    t.integer 'unit_id'
  end

  create_table 'inv_type', primary_key: 'type_id', force: true do |t|
    t.integer 'group_id'
    t.string  'type_name',             limit: 100
    t.string  'description',           limit: 3000
    t.float   'mass',                  limit: 53
    t.float   'volume',                limit: 53
    t.float   'capacity',              limit: 53
    t.integer 'portion_size'
    t.integer 'race_id',               limit: 1
    t.decimal 'base_price',                         precision: 19, scale: 4
    t.boolean 'published'
    t.integer 'market_group_id'
    t.float   'chance_of_duplicating', limit: 53
  end

  add_index 'inv_type', ['group_id'], name: 'invTypes_IX_Group', using: :btree

  create_table 'inv_type_material', id: false, force: true do |t|
    t.integer 'type_id',                      null: false
    t.integer 'material_type_id',             null: false
    t.integer 'quantity',         default: 0, null: false
  end

  create_table 'inv_type_reaction', id: false, force: true do |t|
    t.integer 'reaction_type_id',           null: false
    t.boolean 'input',                      null: false
    t.integer 'type_id',                    null: false
    t.integer 'quantity',         limit: 2
  end

  create_table 'inv_unique_name', primary_key: 'item_id', force: true do |t|
    t.string  'item_name', limit: 200, null: false
    t.integer 'group_id'
  end

  add_index 'inv_unique_name', ['group_id', 'item_name'], name: 'invUniqueNames_IX_GroupName', using: :btree
  add_index 'inv_unique_name', ['item_name'], name: 'invUniqueNames_UQ', unique: true, using: :btree

  create_table 'map_celestial_statistic', primary_key: 'celestial_id', force: true do |t|
    t.float   'temperature',     limit: 53
    t.text    'spectral_class',  limit: 2147483647
    t.float   'luminosity',      limit: 53
    t.float   'age',             limit: 53
    t.float   'life',            limit: 53
    t.float   'orbit_radius',    limit: 53
    t.float   'eccentricity',    limit: 53
    t.float   'mass_dust',       limit: 53
    t.float   'mass_gas',        limit: 53
    t.integer 'fragmented'
    t.float   'density',         limit: 53
    t.float   'surface_gravity', limit: 53
    t.float   'escape_velocity', limit: 53
    t.float   'orbit_period',    limit: 53
    t.float   'rotation_rate',   limit: 53
    t.integer 'locked'
    t.integer 'pressure'
    t.integer 'radius'
    t.integer 'mass'
  end

  create_table 'map_constellation', primary_key: 'constellation_id', force: true do |t|
    t.integer 'region_id'
    t.text    'constellation_name', limit: 2147483647
    t.float   'x',                  limit: 53
    t.float   'y',                  limit: 53
    t.float   'z',                  limit: 53
    t.float   'x_min',              limit: 53
    t.float   'x_max',              limit: 53
    t.float   'y_min',              limit: 53
    t.float   'y_max',              limit: 53
    t.float   'z_min',              limit: 53
    t.float   'z_max',              limit: 53
    t.integer 'faction_id'
    t.float   'radius',             limit: 53
  end

  add_index 'map_constellation', ['region_id'], name: 'mapConstellations_IX_region', using: :btree

  create_table 'map_constellation_jump', id: false, force: true do |t|
    t.integer 'from_region_id',        limit: 8
    t.integer 'from_constellation_id', limit: 8, null: false
    t.integer 'to_constellation_id',   limit: 8, null: false
    t.integer 'to_region_id',          limit: 8
  end

  create_table 'map_denormalize', primary_key: 'item_id', force: true do |t|
    t.integer 'type_id'
    t.integer 'group_id'
    t.integer 'solar_system_id'
    t.integer 'constellation_id'
    t.integer 'region_id'
    t.integer 'orbit_id'
    t.float   'x',                limit: 53
    t.float   'y',                limit: 53
    t.float   'z',                limit: 53
    t.float   'radius',           limit: 53
    t.text    'item_name',        limit: 2147483647
    t.float   'security',         limit: 53
    t.integer 'celestial_index'
    t.integer 'orbit_index'
  end

  add_index 'map_denormalize', ['constellation_id'], name: 'mapDenormalize_IX_constellation', using: :btree
  add_index 'map_denormalize', ['group_id', 'constellation_id'], name: 'mapDenormalize_IX_groupConstellation', using: :btree
  add_index 'map_denormalize', ['group_id', 'region_id'], name: 'mapDenormalize_IX_groupRegion', using: :btree
  add_index 'map_denormalize', ['group_id', 'solar_system_id'], name: 'mapDenormalize_IX_groupSystem', using: :btree
  add_index 'map_denormalize', ['orbit_id'], name: 'mapDenormalize_IX_orbit', using: :btree
  add_index 'map_denormalize', ['region_id'], name: 'mapDenormalize_IX_region', using: :btree
  add_index 'map_denormalize', ['solar_system_id', 'x', 'y', 'z', 'item_name', 'item_id'], name: 'mapDenormalize_gis', length: {'solar_system_id' =>nil, 'x' =>nil, 'y' =>nil, 'z' =>nil, 'item_name' =>40, 'item_id' =>nil}, using: :btree
  add_index 'map_denormalize', ['solar_system_id'], name: 'mapDenormalize_IX_system', using: :btree

  create_table 'map_jump', primary_key: 'stargate_id', force: true do |t|
    t.integer 'destination_id', limit: 8
  end

  create_table 'map_jump_history', primary_key: 'solar_system_id', force: true do |t|
    t.integer  'history_id'
    t.integer  'solar_system_id'
    t.integer  'ship_jumps'
    t.datetime 'cached_until'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'map_landmark', primary_key: 'landmark_id', force: true do |t|
    t.text    'landmark_name', limit: 2147483647
    t.text    'description',   limit: 2147483647
    t.integer 'location_id',   limit: 8
    t.float   'x',             limit: 53
    t.float   'y',             limit: 53
    t.float   'z',             limit: 53
    t.integer 'icon_id',       limit: 8
  end

  create_table 'map_location_scene', primary_key: 'location_id', force: true do |t|
    t.integer 'graphic_id'
  end

  create_table 'map_location_wormhole_class', primary_key: 'location_id', force: true do |t|
    t.integer 'wormhole_class_id'
  end

  create_table 'map_region', primary_key: 'region_id', force: true do |t|
    t.text    'region_name', limit: 2147483647
    t.float   'x',           limit: 53
    t.float   'y',           limit: 53
    t.float   'z',           limit: 53
    t.float   'x_min',       limit: 53
    t.float   'x_max',       limit: 53
    t.float   'y_min',       limit: 53
    t.float   'y_max',       limit: 53
    t.float   'z_min',       limit: 53
    t.float   'z_max',       limit: 53
    t.integer 'faction_id'
    t.float   'radius',      limit: 53
  end

  add_index 'map_region', ['region_id'], name: 'mapRegions_IX_region', using: :btree

  create_table 'map_region_jump', id: false, force: true do |t|
    t.integer 'from_region_id', limit: 8, null: false
    t.integer 'to_region_id',   limit: 8, null: false
  end

  create_table 'map_solar_system', primary_key: 'solar_system_id', force: true do |t|
    t.integer 'region_id'
    t.integer 'constellation_id'
    t.text    'solar_system_name', limit: 2147483647
    t.float   'x',                 limit: 53
    t.float   'y',                 limit: 53
    t.float   'z',                 limit: 53
    t.float   'x_min',             limit: 53
    t.float   'x_max',             limit: 53
    t.float   'y_min',             limit: 53
    t.float   'y_max',             limit: 53
    t.float   'z_min',             limit: 53
    t.float   'z_max',             limit: 53
    t.float   'luminosity',        limit: 53
    t.integer 'border',            limit: 1
    t.integer 'fringe',            limit: 1
    t.integer 'corridor',          limit: 1
    t.integer 'hub',               limit: 1
    t.integer 'international',     limit: 1
    t.integer 'regional',          limit: 1
    t.integer 'constellation',     limit: 1
    t.float   'security',          limit: 53
    t.integer 'faction_id'
    t.float   'radius',            limit: 53
    t.integer 'sun_type_id'
    t.text    'security_class',    limit: 2147483647
  end

  add_index 'map_solar_system', ['constellation_id'], name: 'mapSolarSystems_IX_constellation', using: :btree
  add_index 'map_solar_system', ['region_id'], name: 'mapSolarSystems_IX_region', using: :btree
  add_index 'map_solar_system', ['security'], name: 'mapSolarSystems_IX_security', using: :btree
  add_index 'map_solar_system', ['solar_system_name'], name: 'mss_name', length: {'solar_system_name' =>40}, using: :btree

  create_table 'map_solar_system_jump', id: false, force: true do |t|
    t.integer 'from_region_id',        limit: 8
    t.integer 'from_constellation_id', limit: 8
    t.integer 'from_solar_system_id',  limit: 8, null: false
    t.integer 'to_solar_system_id',    limit: 8, null: false
    t.integer 'to_constellation_id',   limit: 8
    t.integer 'to_region_id',          limit: 8
  end

  create_table 'map_universe', primary_key: 'universe_id', force: true do |t|
    t.string 'universe_name', limit: 100
    t.float  'x',             limit: 53
    t.float  'y',             limit: 53
    t.float  'z',             limit: 53
    t.float  'x_min',         limit: 53
    t.float  'x_max',         limit: 53
    t.float  'y_min',         limit: 53
    t.float  'y_max',         limit: 53
    t.float  'z_min',         limit: 53
    t.float  'z_max',         limit: 53
    t.float  'radius',        limit: 53
  end

  create_table 'planet_schematic', primary_key: 'schematic_id', force: true do |t|
    t.string 'schematic_name'
    t.integer 'cycle_time'
  end

  create_table 'planet_schematics_pin_map', id: false, force: true do |t|
    t.integer 'schematic_id', limit: 2, null: false
    t.integer 'pin_type_id',            null: false
  end

  create_table 'planet_schematics_type_map', id: false, force: true do |t|
    t.integer 'schematic_id', limit: 2, null: false
    t.integer 'type_id',                null: false
    t.integer 'quantity',     limit: 2
    t.boolean 'is_input'
  end

  create_table 'ram_activity', primary_key: 'activity_id', force: true do |t|
    t.string  'activity_name', limit: 100
    t.string  'icon_no',       limit: 5
    t.string  'description',   limit: 1000
    t.boolean 'published'
  end

  create_table 'ram_assembly_line_station', id: false, force: true do |t|
    t.integer 'station_id',                      null: false
    t.integer 'assembly_line_type_id', limit: 1, null: false
    t.integer 'quantity',              limit: 1
    t.integer 'station_type_id'
    t.integer 'owner_id'
    t.integer 'solar_system_id'
    t.integer 'region_id'
  end

  add_index 'ram_assembly_line_station', ['owner_id'], name: 'ramAssemblyLineStations_IX_owner', using: :btree
  add_index 'ram_assembly_line_station', ['region_id'], name: 'ramAssemblyLineStations_IX_region', using: :btree

  create_table 'ram_assembly_line_type', primary_key: 'assembly_line_type_id', force: true do |t|
    t.string  'assembly_line_type_name',  limit: 100
    t.string  'description',              limit: 1000
    t.float   'base_time_multiplier',     limit: 53
    t.float   'base_material_multiplier', limit: 53
    t.float   'base_cost_multiplier',     limit: 53
    t.float   'volume',                   limit: 53
    t.integer 'activity_id',              limit: 1
    t.float   'min_cost_per_hour',        limit: 53
  end

  create_table 'ram_assembly_line_type_detail_per_category', id: false, force: true do |t|
    t.integer 'assembly_line_type_id', limit: 1,  null: false
    t.integer 'category_id',                      null: false
    t.float   'time_multiplier',       limit: 53
    t.float   'material_multiplier',   limit: 53
    t.float   'cost_multiplier',       limit: 53
  end

  create_table 'ram_assembly_line_type_detail_per_group', id: false, force: true do |t|
    t.integer 'assembly_line_type_id', limit: 1,  null: false
    t.integer 'group_id',                         null: false
    t.float   'time_multiplier',       limit: 53
    t.float   'material_multiplier',   limit: 53
    t.float   'cost_multiplier',       limit: 53
  end

  create_table 'ram_installation_type_content', id: false, force: true do |t|
    t.integer 'installation_type_id',            null: false
    t.integer 'assembly_line_type_id', limit: 1, null: false
    t.integer 'quantity',              limit: 1
  end

  create_table 'sta_operation', primary_key: 'operation_id', force: true do |t|
    t.integer 'activity_id',              limit: 1
    t.string  'operation_name',           limit: 100
    t.string  'description',              limit: 1000
    t.integer 'fringe',                   limit: 1
    t.integer 'corridor',                 limit: 1
    t.integer 'hub',                      limit: 1
    t.integer 'border',                   limit: 1
    t.integer 'ratio',                    limit: 1
    t.integer 'caldari_station_type_id'
    t.integer 'minmatar_station_type_id'
    t.integer 'amarr_station_type_id'
    t.integer 'gallente_station_type_id'
    t.integer 'jove_station_type_id'
  end

  create_table 'sta_operation_service', id: false, force: true do |t|
    t.integer 'operation_id', limit: 1, null: false
    t.integer 'service_id',             null: false
  end

  create_table 'sta_service', primary_key: 'service_id', force: true do |t|
    t.string 'service_name', limit: 100
    t.string 'description',  limit: 1000
  end

  create_table 'sta_station', primary_key: 'station_id', force: true do |t|
    t.integer 'security',                   limit: 2
    t.float   'docking_cost_per_volume',    limit: 53
    t.float   'max_ship_volume_dockable',   limit: 53
    t.integer 'office_rental_cost'
    t.integer 'operation_id',               limit: 1
    t.integer 'station_type_id'
    t.integer 'corporation_id'
    t.integer 'solar_system_id'
    t.integer 'constellation_id'
    t.integer 'region_id'
    t.string  'station_name',               limit: 100
    t.float   'x',                          limit: 53
    t.float   'y',                          limit: 53
    t.float   'z',                          limit: 53
    t.float   'reprocessing_efficiency',    limit: 53
    t.float   'reprocessing_stations_take', limit: 53
    t.integer 'reprocessing_hangar_flag',   limit: 1
  end

  add_index 'sta_station', ['constellation_id'], name: 'staStations_IX_constellation', using: :btree
  add_index 'sta_station', ['corporation_id'], name: 'staStations_IX_corporation', using: :btree
  add_index 'sta_station', ['operation_id'], name: 'staStations_IX_operation', using: :btree
  add_index 'sta_station', ['region_id'], name: 'staStations_IX_region', using: :btree
  add_index 'sta_station', ['solar_system_id'], name: 'staStations_IX_system', using: :btree
  add_index 'sta_station', ['station_type_id'], name: 'staStations_IX_type', using: :btree

  create_table 'sta_station_type', primary_key: 'station_type_id', force: true do |t|
    t.float   'dock_entry_x',            limit: 53
    t.float   'dock_entry_y',            limit: 53
    t.float   'dock_entry_z',            limit: 53
    t.float   'dock_orientation_x',      limit: 53
    t.float   'dock_orientation_y',      limit: 53
    t.float   'dock_orientation_z',      limit: 53
    t.integer 'operation_id',            limit: 1
    t.integer 'office_slots',            limit: 1
    t.float   'reprocessing_efficiency', limit: 53
    t.boolean 'conquerable'
  end

  create_table 'translation_table', id: false, force: true do |t|
    t.string  'source_table',      limit: 200, null: false
    t.string  'destination_table', limit: 200
    t.string  'translated_key',    limit: 200, null: false
    t.integer 'tc_group_id'
    t.integer 'tc_id'
  end

  create_table 'trn_translation', id: false, force: true do |t|
    t.integer 'tc_id',       limit: 2,          null: false
    t.integer 'key_id',                         null: false
    t.string  'language_id', limit: 50,         null: false
    t.text    'text',        limit: 2147483647, null: false
  end

  create_table 'trn_translation_column', primary_key: 'tc_id', force: true do |t|
    t.integer 'tc_group_id', limit: 2
    t.string  'table_name',  limit: 256, null: false
    t.string  'column_name', limit: 128, null: false
    t.string  'master_id',   limit: 128
  end

  create_table 'trn_translation_language', primary_key: 'numeric_language_id', force: true do |t|
    t.string 'language_id',   limit: 50
    t.string 'language_name', limit: 200
  end

  create_table 'war_combat_zone', primary_key: 'combat_zone_id', force: true do |t|
    t.string  'combat_zone_name', limit: 100
    t.integer 'faction_id'
    t.integer 'center_system_id'
    t.string  'description',      limit: 500
  end

  create_table 'war_combat_zone_system', primary_key: 'solar_system_id', force: true do |t|
    t.integer 'combat_zone_id'
  end

end
