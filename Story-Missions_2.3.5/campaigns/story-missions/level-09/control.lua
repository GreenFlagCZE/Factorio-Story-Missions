require "util"
local intro_screen = require("intro_screen")
require "story"


local think = function(thought)
  game.players[1].print({"","[img=entity/character][color=orange]",{"engineer-title"},": [/color]",{"think-"..thought}})
end

local msg = function(msg)
  game.players[1].print({"","[img=entity/radar][color=red]",{"computer-title"},": [/color]",{"msg-"..msg}})
end

-- PLAYER PERM-DEATH
function check_for_player_death(event)
	if  event.name == defines.events.on_player_died then
		game.set_game_state({game_finished=true, player_won=false, can_continue=false})
	end
end

local function on_configuration_changed()
	game.reload_script()
end

-- MAP REVEAL POINT OF INTEREST DURING THE MISSION
local red_chest1 = {-833.5, 101.5}
script.on_init(function()
  global.story = story_init()
  game.forces.player.set_spawn_position(red_chest1, 1)
end)
local chart_areas1 = function()
  local surface = game.surfaces[1]
  local force = game.forces.player
  for k, entity in pairs (surface.find_entities_filtered{force = force, area = {{-500, -250},{500, 250}}}) do
    local position = entity.position
   -- force.chart(surface, {{position.x - 16, position.y - 16}, {position.x + 16, position.y + 16}})
  end
  force.chart(surface, {{red_chest1[1] - 25, red_chest1[2] - 25}, {red_chest1[1] + 25, red_chest1[2] + 25}})
end
local chart_tag1 = function()
  local surface = game.surfaces[1]
  local force = game.forces.player
  for k, entity in pairs (surface.find_entities_filtered{force = force, area = {{-833.5, 101.5},{-833.5, 101.5}}}) do
    local position = entity.position
   --force.add_chart_tag (surface, {position = {-833.5, 101.5}, icon = {type="item", name="radar"}, text = "control unit"})
   game.print(string.format("[gps=%s, %s]", position.x, position.y))  		
  end
end


local red_chest2 = {-704.5, -224.5}
script.on_init(function()
  global.story = story_init()
  game.forces.player.set_spawn_position(red_chest2, 1)
end)
local chart_areas2 = function()
  local surface = game.surfaces[1]
  local force = game.forces.player
  for k, entity in pairs (surface.find_entities_filtered{force = force, area = {{-500, -250},{500, 250}}}) do
    local position = entity.position
   -- force.chart(surface, {{position.x - 16, position.y - 16}, {position.x + 16, position.y + 16}})
  end
  force.chart(surface, {{red_chest2[1] - 25, red_chest2[2] - 25}, {red_chest2[1] + 25, red_chest2[2] + 25}})
end
local chart_tag2 = function()
  local surface = game.surfaces[1]
  local force = game.forces.player
  for k, entity in pairs (surface.find_entities_filtered{force = force, area = {{-704.5, -224.5},{-704.5, -224.5}}}) do
    local position = entity.position
   game.print(string.format("[gps=%s, %s]", position.x, position.y))  		
  end
end


local red_chest3 = {-495.5, -554.5}
script.on_init(function()
  global.story = story_init()
  game.forces.player.set_spawn_position(red_chest3, 1)
end)
local chart_areas3 = function()
  local surface = game.surfaces[1]
  local force = game.forces.player
  for k, entity in pairs (surface.find_entities_filtered{force = force, area = {{-500, -250},{500, 250}}}) do
    local position = entity.position
   -- force.chart(surface, {{position.x - 16, position.y - 16}, {position.x + 16, position.y + 16}})
  end
  force.chart(surface, {{red_chest3[1] - 25, red_chest3[2] - 25}, {red_chest3[1] + 25, red_chest3[2] + 25}})
end
local chart_tag3 = function()
  local surface = game.surfaces[1]
  local force = game.forces.player
  for k, entity in pairs (surface.find_entities_filtered{force = force, area = {{-495.5, -554.5},{-495.5, -554.5}}}) do
    local position = entity.position
   game.print(string.format("[gps=%s, %s]", position.x, position.y))  		
  end
end


local red_chest4 = {28.5, -460.5}
script.on_init(function()
  global.story = story_init()
  game.forces.player.set_spawn_position(red_chest4, 1)
end)
local chart_areas4 = function()
  local surface = game.surfaces[1]
  local force = game.forces.player
  for k, entity in pairs (surface.find_entities_filtered{force = force, area = {{-500, -250},{500, 250}}}) do
    local position = entity.position
   -- force.chart(surface, {{position.x - 16, position.y - 16}, {position.x + 16, position.y + 16}})
  end
  force.chart(surface, {{red_chest4[1] - 35, red_chest4[2] - 35}, {red_chest4[1] + 35, red_chest4[2] + 35}})
end
local chart_tag4 = function()
  local surface = game.surfaces[1]
  local force = game.forces.player
  for k, entity in pairs (surface.find_entities_filtered{force = force, area = {{28.5, -460.5},{28.5, -460.5}}}) do
    local position = entity.position
   game.print(string.format("[gps=%s, %s]", position.x, position.y))  		
  end
end


local radar_chart1 = {201.5, 365.5}
script.on_init(function()
  global.story = story_init()
  game.forces.player.set_spawn_position(radar_chart1, 1)
end)
local chart_areas5 = function()
  local surface = game.surfaces[1]
  local force = game.forces.player
  for k, entity in pairs (surface.find_entities_filtered{force = force, area = {{-500, -250},{500, 250}}}) do
    local position = entity.position
   -- force.chart(surface, {{position.x - 16, position.y - 16}, {position.x + 16, position.y + 16}})
  end
  force.chart(surface, {{radar_chart1[1] - 50, radar_chart1[2] - 50}, {radar_chart1[1] + 50, radar_chart1[2] + 50}})
end
local chart_tag5 = function()
  local surface = game.surfaces[1]
  local force = game.forces.player
  for k, entity in pairs (surface.find_entities_filtered{force = force, area = {{201.5, 365.5},{201.5, 365.5}}}) do
    local position = entity.position
   game.print(string.format("[gps=%s, %s]", position.x, position.y))  		
  end
end

local radar_chart2 = {508.5, 762.5}
script.on_init(function()
  global.story = story_init()
  game.forces.player.set_spawn_position(radar_chart2, 1)
end)
local chart_areas6 = function()
  local surface = game.surfaces[1]
  local force = game.forces.player
  for k, entity in pairs (surface.find_entities_filtered{force = force, area = {{-500, -250},{500, 250}}}) do
    local position = entity.position
   -- force.chart(surface, {{position.x - 16, position.y - 16}, {position.x + 16, position.y + 16}})
  end
  force.chart(surface, {{radar_chart2[1] - 25, radar_chart2[2] - 25}, {radar_chart2[1] + 25, radar_chart2[2] + 25}})
end
local chart_tag6 = function()
  local surface = game.surfaces[1]
  local force = game.forces.player
  for k, entity in pairs (surface.find_entities_filtered{force = force, area = {{508.5, 762.5},{508.5, 762.5}}}) do
    local position = entity.position
   game.print(string.format("[gps=%s, %s]", position.x, position.y))  		
  end
end


local radar_chart3 = {606.5, 218.5}
script.on_init(function()
  global.story = story_init()
  game.forces.player.set_spawn_position(radar_chart3, 1)
end)
local chart_areas7 = function()
  local surface = game.surfaces[1]
  local force = game.forces.player
  for k, entity in pairs (surface.find_entities_filtered{force = force, area = {{-500, -250},{500, 250}}}) do
    local position = entity.position
   -- force.chart(surface, {{position.x - 16, position.y - 16}, {position.x + 16, position.y + 16}})
  end
  force.chart(surface, {{radar_chart3[1] - 15, radar_chart3[2] - 50}, {radar_chart3[1] + 15, radar_chart3[2] + 50}})
end


local radar_chart4 = {-327.5, 242.5}
script.on_init(function()
  global.story = story_init()
  game.forces.player.set_spawn_position(radar_chart4, 1)
end)
local chart_areas8 = function()
  local surface = game.surfaces[1]
  local force = game.forces.player
  for k, entity in pairs (surface.find_entities_filtered{force = force, area = {{-500, -250},{500, 250}}}) do
    local position = entity.position
   force.chart(surface, {{position.x - 16, position.y - 16}, {position.x + 16, position.y + 16}})
  end
  force.chart(surface, {{radar_chart4[1] - 100, radar_chart4[2] - 35}, {radar_chart4[1] + 100, radar_chart4[2] + 35}})
end







-- GAME INIT PARAMAMETERS AND TECHS
local on_player_created = function(event)

  local player = game.players[1]

  player.force.enable_research()
  game.forces.player.disable_all_prototypes()
  game.forces.player.reset_technology_effects()
  --game.forces.player.reset()
  game.forces.player.research_queue_enabled = true

  
  -- FOR HORROR GAMES
  -- game.surfaces[1].freeze_daytime = true
  -- game.surfaces[1].daytime   = 0.4
  -- game.surfaces[1].brightness_visual_weights = { 1 / 0.85, 1 / 0.85, 1 / 0.85 }

  global.cars = global.cars or {}
  game.players[1].clear_recipe_notifications()

 
 
 -- INVINCIBLE STRUCTURES
    ------------
  global.enemy_engines_1 = game.get_entity_by_tag("gen1")
  global.enemy_engines_2 = game.get_entity_by_tag("gen2")
  global.enemy_engines_3 = game.get_entity_by_tag("gen3")
  global.enemy_engines_4 = game.get_entity_by_tag("gen4")
  global.enemy_engines_5 = game.get_entity_by_tag("gen5")
  global.enemy_engines_6 = game.get_entity_by_tag("gen6")
  global.enemy_engines_7 = game.get_entity_by_tag("gen7")
  global.enemy_engines_8 = game.get_entity_by_tag("gen8")
  local engines_entities =
  {
    global.enemy_engines_1,
	global.enemy_engines_2,
	global.enemy_engines_3,
	global.enemy_engines_4,
	global.enemy_engines_5,
	global.enemy_engines_6,
	global.enemy_engines_7,
	global.enemy_engines_8
  }
  for index, entity in pairs(engines_entities) do
    entity.minable = false
    entity.destructible = false
  end
  global.intro_entities_engines = engines_entities
      
  ------------
  global.track_1 = game.get_entity_by_tag("track1")
  global.track_2 = game.get_entity_by_tag("track2")
  global.track_3 = game.get_entity_by_tag("track3")
  global.track_4 = game.get_entity_by_tag("track-radar")
  global.track_5 = game.get_entity_by_tag("track-radar2")
  local tracks_entities =
  {
    global.track_1,
	global.track_2,
	global.track_3,
	global.track_4,
	global.track_5
  }
  for index, entity in pairs(tracks_entities) do
    entity.minable = false
    entity.destructible = false
  end
  global.intro_entities_tracks = tracks_entities
     	 
  ------------
  global.computer_1 = game.get_entity_by_tag("computer1")
  local tracks_computers_1 =
  {
	global.computer_1
  }
  for index, entity in pairs(tracks_computers_1) do
    entity.minable = false
    entity.destructible = false
  end
  global.intro_entities_computers_1 = tracks_computers_1
     
  ------------ 
  global.computer_2 = game.get_entity_by_tag("computer2")
  local tracks_computers_2 =
  {
	global.computer_2
  }
  for index, entity in pairs(tracks_computers_2) do
    entity.minable = false
    entity.destructible = false
  end
  global.intro_entities_computers_2 = tracks_computers_2
     
  ------------ 
  global.computer_3 = game.get_entity_by_tag("computer3")
  local tracks_computers_3 =
  {
	global.computer_3
  }
  for index, entity in pairs(tracks_computers_3) do
    entity.minable = false
    entity.destructible = false
  end
  global.intro_entities_computers_3 = tracks_computers_3
     
  ------------
  global.computer_4 = game.get_entity_by_tag("computer4")
  local tracks_computers_4 =
  {
	global.computer_4
  }
  for index, entity in pairs(tracks_computers_4) do
    entity.minable = false
    entity.destructible = false
  end
  global.intro_entities_computers_4 = tracks_computers_4
     	 
  ------------

  global.enemy_silo = game.get_entity_by_tag("enemy-silo")
  local enemy_silos =
  {
	global.enemy_silo
  }
  for index, entity in pairs(enemy_silos) do
    entity.minable = false
    entity.destructible = false
  end
  global.intro_entities_enemy_silos = enemy_silos
     	 
  ------------
  global.silo = game.get_entity_by_tag("silo")
  local silos =
  {
	global.silo
  }
  for index, entity in pairs(silos) do
    entity.minable = false
    entity.destructible = false
  end
  global.intro_entities_silos = silos	 
  ------------
 
 
  -- TECH TREE: 
  local technology_list = game.forces.player.technologies  
  -- equipment enabled
  technology_list["modular-armor"].enabled = true
  technology_list["night-vision-equipment"].enabled = true
  technology_list["belt-immunity-equipment"].enabled = true
  technology_list["solar-panel-equipment"].enabled = true
  technology_list["battery-equipment"].enabled = true
  technology_list["personal-roboport-equipment"].enabled = true
	
  technology_list["power-armor"].enabled = true
  technology_list["personal-laser-defense-equipment"].enabled = true
  technology_list["exoskeleton-equipment"].enabled = true
  technology_list["energy-shield-equipment"].enabled = true
  technology_list["discharge-defense-equipment"].enabled = true

  technology_list["power-armor-mk2"].enabled = true
  technology_list["battery-mk2-equipment"].enabled = true
  technology_list["energy-shield-mk2-equipment"].enabled = true

  technology_list["distractor"].enabled = true
  technology_list["destroyer"].enabled = true
  technology_list["defender"].enabled = true


  -- enabled
  -- red science
  technology_list["automation"].researched = true
  technology_list["stone-wall"].researched = true
  technology_list["gun-turret"].researched = true
  technology_list["optics"].researched = true
  technology_list["logistics"].researched = true
  technology_list["military"].researched = true
  technology_list["logistic-science-pack"].researched = true
  technology_list["steel-processing"].researched = true
  technology_list["electronics"].researched = true 
  technology_list["heavy-armor"].researched = true
  technology_list["steel-axe"].enabled = true 
  technology_list["toolbelt"].enabled = true  

  --green science
  technology_list["fast-inserter"].enabled = true 
  technology_list["automation-2"].researched = true
  technology_list["electric-energy-distribution-1"].researched = true  
  technology_list["engine"].researched = true 
  technology_list["fluid-handling"].researched = true 
  technology_list["oil-processing"].researched = true
  technology_list["military-2"].enabled = true
  technology_list["logistics-2"].enabled = true
  technology_list["advanced-material-processing"].enabled = true
  technology_list["solar-energy"].enabled = true
  technology_list["modules"].enabled = true
  technology_list["speed-module"].enabled = true
  technology_list["effectivity-module"].enabled = true
  technology_list["productivity-module"].enabled = true
  technology_list["sulfur-processing"].researched = true
  technology_list["advanced-electronics"].enabled = true
  technology_list["explosives"].enabled = true
  technology_list["electric-energy-accumulators"].enabled = true
  technology_list["circuit-network"].enabled = true
  technology_list["railway"].researched = true
  technology_list["automated-rail-transportation"].researched = true
  technology_list["rail-signals"].enabled = true
  technology_list["automobilism"].researched = true
  technology_list["gate"].enabled = true
  technology_list["battery"].enabled = true
  technology_list["plastics"].researched = true
  technology_list["fluid-wagon"].researched = true
  technology_list["stack-inserter"].enabled = true
  technology_list["concrete"].enabled = true
  
  --grey science
  technology_list["military-science-pack"].enabled = true
  technology_list["flamethrower"].enabled = true
  technology_list["flammables"].enabled = true
  technology_list["land-mine"].enabled = true
  technology_list["rocketry"].enabled = true
  
  --blue science
  technology_list["chemical-science-pack"].enabled = true
  technology_list["laser"].enabled = true
  technology_list["speed-module-2"].enabled = true
  technology_list["effectivity-module-2"].enabled = true
  technology_list["productivity-module-2"].enabled = true
  technology_list["laser-turret"].enabled = true
  technology_list["tank"].enabled = true
  technology_list["explosive-rocketry"].enabled = true 
  technology_list["military-3"].enabled = true
  technology_list["advanced-material-processing-2"].enabled = true  
  technology_list["advanced-oil-processing"].enabled = true 
  technology_list["lubricant"].enabled = true
  technology_list["rocket-fuel"].enabled = true 
  technology_list["electric-engine"].enabled = true  
  technology_list["low-density-structure"].enabled = true  
  technology_list["robotics"].enabled = true
  technology_list["construction-robotics"].enabled = true
  technology_list["logistic-robotics"].enabled = true
  technology_list["uranium-processing"].enabled = true
  technology_list["nuclear-power"].enabled = true
  technology_list["advanced-electronics-2"].enabled = true
  technology_list["electric-energy-distribution-2"].enabled = true 

  --purple science
  technology_list["production-science-pack"].enabled = true
  technology_list["automation-3"].enabled = true
  technology_list["logistics-3"].enabled = true
  technology_list["effect-transmission"].enabled = true
  technology_list["nuclear-fuel-reprocessing"].enabled = true
  technology_list["kovarex-enrichment-process"].enabled = true 
  technology_list["coal-liquefaction"].enabled = true
  technology_list["speed-module-3"].enabled = true
  technology_list["effectivity-module-3"].enabled = true
  technology_list["productivity-module-3"].enabled = true
  
  --yellow science
  technology_list["military-4"].enabled = true
  technology_list["utility-science-pack"].enabled = true
  technology_list["uranium-ammo"].enabled = true 

  technology_list["logistic-system"].enabled = true
  technology_list["atomic-bomb"].enabled = true

  
  --special
  technology_list["spidertron"].enabled = true
  technology_list["artillery"].researched = true
  technology_list["fusion-reactor-equipment"].enabled = true  
  technology_list["space-science-pack"].enabled = true 
  technology_list["personal-roboport-mk2-equipment"].enabled = true
  
  --blocked tech
  technology_list["cliff-explosives"].enabled = false
  technology_list["landfill"].enabled = false
  technology_list["rocket-silo"].enabled = false 
  technology_list["rocket-control-unit"].enabled = false
   
  
  --tech upgrades
  technology_list["braking-force-1"].enabled = true
  technology_list["braking-force-2"].enabled = true
  technology_list["braking-force-3"].enabled = true
  technology_list["braking-force-4"].enabled = true
  technology_list["braking-force-5"].enabled = true
  technology_list["braking-force-6"].enabled = true
  technology_list["braking-force-7"].enabled = true
  technology_list["energy-weapons-damage-1"].enabled = true
  technology_list["energy-weapons-damage-2"].enabled = true
  technology_list["energy-weapons-damage-3"].enabled = true
  technology_list["energy-weapons-damage-4"].enabled = true
  technology_list["energy-weapons-damage-5"].enabled = true
  technology_list["energy-weapons-damage-6"].enabled = true
  technology_list["inserter-capacity-bonus-1"].researched = true
  technology_list["inserter-capacity-bonus-2"].enabled = true
  technology_list["inserter-capacity-bonus-3"].enabled = true
  technology_list["inserter-capacity-bonus-4"].enabled = true
  technology_list["inserter-capacity-bonus-5"].enabled = true
  technology_list["inserter-capacity-bonus-6"].enabled = true
  technology_list["inserter-capacity-bonus-7"].enabled = true
  technology_list["laser-shooting-speed-1"].enabled = true
  technology_list["laser-shooting-speed-2"].enabled = true
  technology_list["laser-shooting-speed-3"].enabled = true
  technology_list["laser-shooting-speed-4"].enabled = true
  technology_list["laser-shooting-speed-5"].enabled = true
  technology_list["laser-shooting-speed-6"].enabled = true
  technology_list["laser-shooting-speed-7"].enabled = true
  technology_list["stronger-explosives-1"].enabled = true
  technology_list["stronger-explosives-2"].enabled = true
  technology_list["stronger-explosives-3"].enabled = true
  technology_list["stronger-explosives-4"].enabled = true
  technology_list["stronger-explosives-5"].enabled = true
  technology_list["stronger-explosives-6"].enabled = true
  technology_list["stronger-explosives-7"].enabled = true
  technology_list["physical-projectile-damage-1"].researched = true
  technology_list["physical-projectile-damage-2"].enabled = true
  technology_list["physical-projectile-damage-3"].enabled = true
  technology_list["physical-projectile-damage-4"].enabled = true
  technology_list["physical-projectile-damage-5"].enabled = true
  technology_list["physical-projectile-damage-6"].enabled = true
  technology_list["physical-projectile-damage-7"].enabled = true
  technology_list["refined-flammables-1"].enabled = true
  technology_list["refined-flammables-2"].enabled = true
  technology_list["refined-flammables-3"].enabled = true
  technology_list["refined-flammables-4"].enabled = true
  technology_list["refined-flammables-5"].enabled = true
  technology_list["refined-flammables-6"].enabled = true
  technology_list["research-speed-1"].enabled = true
  technology_list["research-speed-2"].enabled = true
  technology_list["research-speed-3"].enabled = true
  technology_list["research-speed-4"].enabled = true
  technology_list["research-speed-5"].enabled = true
  technology_list["research-speed-6"].enabled = true
  technology_list["mining-productivity-1"].enabled = true
  technology_list["mining-productivity-2"].enabled = true
  technology_list["mining-productivity-3"].enabled = true
  technology_list["mining-productivity-4"].enabled = true
  technology_list["weapon-shooting-speed-1"].researched = true
  technology_list["weapon-shooting-speed-2"].enabled = true
  technology_list["weapon-shooting-speed-3"].enabled = true
  technology_list["weapon-shooting-speed-4"].enabled = true
  technology_list["weapon-shooting-speed-5"].enabled = true
  technology_list["weapon-shooting-speed-6"].enabled = true
  technology_list["worker-robots-speed-1"].enabled = true
  technology_list["worker-robots-speed-2"].enabled = true
  technology_list["worker-robots-speed-3"].enabled = true
  technology_list["worker-robots-speed-4"].enabled = true
  technology_list["worker-robots-speed-5"].enabled = true
  technology_list["worker-robots-speed-6"].enabled = true
  technology_list["worker-robots-storage-1"].enabled = true
  technology_list["worker-robots-storage-2"].enabled = true
  technology_list["worker-robots-storage-3"].enabled = true
  technology_list["artillery-shell-range-1"].enabled = true
  technology_list["artillery-shell-speed-1"].enabled = false
  technology_list["follower-robot-count-1"].enabled = true
  technology_list["follower-robot-count-2"].enabled = true
  technology_list["follower-robot-count-3"].enabled = true
  technology_list["follower-robot-count-4"].enabled = true
  technology_list["follower-robot-count-5"].enabled = true
  technology_list["follower-robot-count-6"].enabled = true
  technology_list["follower-robot-count-7"].enabled = true
  
  local recipe_list = player.force.recipes
  game.players[1].clear_recipe_notifications()
end


local player_item_list =
{
  ["submachine-gun"] = 1,
  ["piercing-rounds-magazine"] = 33,
  ["light-armor"] = 1,
  ["iron-plate"] = 100,
  ["copper-plate"] = 75,
  ["steel-plate"] = 40,
  ["electric-mining-drill"] = 2,
  ["medium-electric-pole"] = 12,
  ["inserter"] = 25,
  ["transport-belt"] = 100,
  ["wood"] = 46
}

local car_item_list =
{

  ["assembling-machine-2"] = 10,
  ["stone-furnace"] = 15,
  ["electric-mining-drill"] = 8,
  ["lab"] = 4,
  ["pipe"] = 80,
  ["fast-transport-belt"] = 60,
  ["long-handed-inserter"] = 15,
  ["fast-inserter"] = 10,
  ["stone"] = 200,
  ["firearm-magazine"] = 9,
  ["coal"] = 36
}



-- local on_player_created = function(event)
  -- local player = game.get_player(event.player_index)
  -- util.insert_safe(player.character, player_item_list)
-- end


local get_angle = function(position_1, position_2)
  local d_x = (position_2[1] or position_2.x) - (position_1[1] or position_1.x)
  local d_y = (position_2[2] or position_2.y) - (position_1[2] or position_1.y)
  return math.atan2(d_y, d_x)
end

local get_orientation = function(source_position, target_position)

  -- Angle in rads
  local angle = get_angle(target_position, source_position)

  -- Convert to orientation
  local orientation =  (angle / (2 * math.pi)) - 0.25
  if orientation < 0 then orientation = orientation + 1 end
  if orientation > 1 then orientation = orientation - 1 end

  return orientation

end

local car_waypoints =
{
  {-278, -496},
  {-277, -203},
  {-259, -195}
}


local update_car_driving = function()

  local car = global.car
  local waypoint = global.car_waypoints[1]

  if not waypoint then
    car.speed = car.speed * 0.55
    car.riding_state =
    {
      acceleration = defines.riding.acceleration.braking,
      direction = defines.riding.direction.straight
    }
    return
  end

  local distance = util.distance(car.position, {x = waypoint[1], y = waypoint[2]})
  if distance < 2 then
    table.remove(global.car_waypoints, 1)
    return
  end

  local direction

  local target_orientation = get_orientation(car.position, waypoint)
  if math.abs(car.orientation - target_orientation) <= 1/128 then
    car.orientation = target_orientation
    direction = defines.riding.direction.straight
  else

    local change = car.orientation - target_orientation
    if change > 0.5 then
      change = -1 + change
    end
    if change < -0.5 then
      change = 1 + change
    end

    if change > 0 then
      --direction = defines.riding.direction.left
      car.orientation = car.orientation - (0.08 * change)
    else
      car.orientation = car.orientation - (0.08 * change)
      --direction = defines.riding.direction.right
    end

  end

  car.riding_state =
  {
    acceleration = defines.riding.acceleration.accelerating,
    direction = defines.riding.direction.straight
  }
end

story_table =
{
  {
    {
      init = function()
        init()
      end
    },
	{
      init = function()
	  global.radar = game.surfaces[1].find_entities_filtered{name = "radar-remnants", limit = 1}[1]
        if not game.is_multiplayer() then
          game.tick_paused = true
        end
        for k, player in pairs (game.players) do
          intro_screen.create(player) 
		  player.set_controller
		  {
              type = defines.controllers.cutscene,
              waypoints =
              {  
				{
			      target = global.radar,
                  transition_time = 1,
                  time_to_wait = 1,
                  zoom = 1 
				},
			  },
              start_position = global.radar.position,
              start_zoom = 1
            }
        end
        -- game.play_sound({path = "utility/game_won"})
      end
    }, 
    {
      init = function()
        global.car_waypoints = car_waypoints
        for k, waypoint in pairs (car_waypoints) do
          -- Debug visualisation to see car waypoints.
          --game.surfaces[1].set_tiles{{name = "concrete", position = waypoint}}
        end
        for k, player in pairs (game.players) do
          if player.character then player.character.destroy() end
        end
        local start_position = global.car_waypoints[1]
        table.remove(global.car_waypoints, 1)
        local driving_car = game.surfaces[1].create_entity{name = "car", position = start_position, force = "player"}
        global.cars =
        {
          [driving_car.unit_number] = driving_car
        }
        local dude = game.surfaces[1].create_entity{name = "character", force = "player", position = start_position}
        global.radar = game.surfaces[1].find_entities_filtered{name = "1x2-remnants", limit = 1}[1]
        global.radar1 = game.surfaces[1].find_entities_filtered{name = "crash-site-spaceship-wreck-medium-1", limit = 1}[1]
		global.radar2 = game.surfaces[1].find_entities_filtered{name = "land-mine-remnants", limit = 1}[1]
		driving_car.set_driver(dude)
        global.dude = dude
        global.car = driving_car
        global.car.orientation = get_orientation(global.car.position, global.car_waypoints[1])
        global.car.speed = 0.1
        util.insert_safe(global.car, car_item_list)
        global.car.color = { r = 0.869, g = 0.5  , b = 0.130, a = 0.5 }
        for k, player in pairs (game.players) do
          player.set_controller
          {
            type = defines.controllers.cutscene,
            waypoints =
            {
                {
                  target = global.radar,
                  transition_time = 1,
                  time_to_wait = 1,
                  zoom = 1
                },
				{
                  target = global.radar1,
                  transition_time = 400,
                  time_to_wait = 0,
                  zoom = 0.7
                },
				{
                  target = global.radar2,
                  transition_time = 180,
                  time_to_wait = 0,
                  zoom = 0.6
                },
				{
                  target = global.car,
                  transition_time = 150,
                  time_to_wait = 150,
                  zoom = 1.5
                },
            },
            start_position = global.radar.position,
            start_zoom = 1
          }
        end
      end,
      update = update_car_driving,
      condition = function(event)
        if event.tick % 60 ~= 0 then return end
        return global.car.speed == 0
      end
    },
    {
      init = function()
        if global.dude and global.dude.valid then
          global.dude.destroy()
        end
        for k, player in pairs (game.players) do
          if player.controller_type == defines.controllers.cutscene then
            player.exit_cutscene()
          end
          if player.character then player.character.destroy() end
          player.teleport({x = global.car.position.x + 1, y = global.car.position.y - 1})
          player.create_character()
          util.insert_safe(player, player_item_list)
          player.zoom = 0.75
          player.set_controller
          {
            type = defines.controllers.cutscene,
            waypoints =
            {
              {
                target = player.character,
                transition_time = 150,
                time_to_wait = 30,
                zoom = 0.75
              }
            },
            start_position = global.car.position,
            start_zoom = 1.5
          }
        end
      end,
      condition = story_elapsed_check(3)
    },
    {
      action =
      function()
	  	local recipe_list = game.players[1].force.recipes
		recipe_list["artillery-targeting-remote"].enabled = false
		recipe_list["artillery-turret"].enabled = false
		recipe_list["artillery-wagon"].enabled = false
      end
	},
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
			character.insert{name = "piercing-rounds-magazine", count = 400}
			character.insert{name = "uranium-rounds-magazine", count = 150}
			character.insert{name = "explosive-cannon-shell", count = 125}
			character.insert{name = "laser-turret", count = 12}
		    character.insert{name = "copper-plate", count = 300}
			character.insert{name = "iron-plate", count = 400}
			character.insert{name = "transport-belt", count = 300}
			character.insert{name = "construction-robot", count = 40}
			character.insert{name = "modular-armor", count = 1} 
			character.insert{name = "solar-panel-equipment", count = 6}
			character.insert{name = "energy-shield-equipment", count = 1}
			character.insert{name = "battery-mk2-equipment", count = 1}	
			character.insert{name = "stone-wall", count = 100}
			
			game.map_settings.enemy_expansion.enabled = false
			game.map_settings.enemy_evolution.enabled = true
			game.forces.enemy.evolution_factor = 0
			game.difficulty_settings.technology_price_multiplier = 1
			game.difficulty_settings.recipe_difficulty = 0	
			
		elseif game.difficulty == defines.difficulty.normal then  
		    character.insert{name = "piercing-rounds-magazine", count = 53}
			game.map_settings.enemy_expansion.enabled = false
			game.map_settings.enemy_evolution.enabled = true
			game.forces.enemy.evolution_factor = .40
			game.difficulty_settings.technology_price_multiplier = 1
			game.difficulty_settings.recipe_difficulty = 1
			
		elseif game.difficulty == defines.difficulty.hard then  
			game.map_settings.enemy_expansion.enabled = true
			game.map_settings.enemy_evolution.enabled = true
			game.forces.enemy.evolution_factor = .68
			game.difficulty_settings.technology_price_multiplier = 2
			game.difficulty_settings.recipe_difficulty = 1
        end
      end
    },
    --------------------------
	--/// BUILD 2 MINES /// --
	--------------------------
	{
      condition = story_elapsed_check(1),
	}, 
	{
      action =
      function()
        game.show_message_dialog{text = {"msg-base-1"}}

      end
    },
	{
      condition = story_elapsed_check(1),
	},
    {
      action =
      function()
		think("msg1")
      end
	}, 
	{
      condition = story_elapsed_check(1),

	},	
	{
      init = function()
        set_goal({"goal-build-mines",0,2})
        global.build_units = 0
      end,
      update = function(event)
	    if 	event.name == defines.events.on_entity_died and
			event.entity.force.name == "enemy" and
			event.entity.name == "car" then
			game.show_message_dialog{text = {"msg-base-fail"}}
			game.set_game_state({game_finished=true, player_won=false, can_continue=false})
        elseif event.name == defines.events.on_entity_died and event.entity.name == 'electric-mining-drill' then
          global.build_units = global.build_units - 1
          set_goal({"goal-build-mines",global.build_units,2},true)
        elseif event.name == defines.events.on_built_entity and event.created_entity.name == 'electric-mining-drill' then
          global.build_units = global.build_units + 1
          set_goal({"goal-build-mines",global.build_units,2},true)
        elseif event.name == defines.events.on_player_mined_entity and event.entity.name =='electric-mining-drill' then
          global.build_units = global.build_units - 1
          set_goal({"goal-build-mines",global.build_units,2},true)
        end
      end,
      condition = function(event)
        return global.build_units >= 2
      end
    },
	{
	  action = function()
        set_goal("")
        
	  end
	},
	{ 
	  condition = story_elapsed_check(3),	  
    },
    {
      action =
      function()
        game.show_message_dialog{text = {"msg-base-2"}}
		game.show_message_dialog{text = {"msg-base-3"}}
		game.show_message_dialog{text = {"msg-base-4"}}
		game.show_message_dialog{text = {"msg-base-5"}}
		game.show_message_dialog{text = {"msg-base-6"}}
      end
    },
	{ 
	  condition = story_elapsed_check(1),	  
    },
    --------------------------
	--/// DESTROY NESTS  /// --
	--------------------------	
	{ 
	  init = function()

		game.surfaces[1].create_entity({name='straight-rail', force = "player", position={x=-241,y=143}})
		game.surfaces[1].create_entity({name='straight-rail', force = "player", position={x=-239,y=159}})

      end
	},
		-- bug attack wave
	{ 
	  condition = story_elapsed_check(0.2),	  
    },
	{
      init = function()
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-278,y=-33}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-278,y=-34}})
        game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-278,y=-32}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-277,y=-33}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-277,y=-32}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-276,y=-33}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-276,y=-32}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-279,y=-33}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-279,y=-33}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-277,y=-35}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-277,y=-35}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-277,y=-35}})

      end
	},
	{ 
	  condition = story_elapsed_check(0.2),	  
    },
	{
      init = function()
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-278,y=-33}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-278,y=-34}})
        game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-278,y=-32}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-277,y=-33}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-277,y=-32}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-276,y=-33}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-276,y=-32}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-279,y=-33}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-279,y=-33}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-277,y=-35}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-277,y=-35}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-277,y=-35}})

      end
	},
	{ 
	  condition = story_elapsed_check(0.2),	  
    },
	{
      init = function()
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-278,y=-33}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-278,y=-34}})
        game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-278,y=-32}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-277,y=-33}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-277,y=-32}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-276,y=-33}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-276,y=-32}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-279,y=-33}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-279,y=-33}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-277,y=-35}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-277,y=-35}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-277,y=-35}})

      end
	},
	{
      init = function()
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-250,y=25}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-250,y=24}})
        game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-250,y=22}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-249,y=23}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-250,y=22}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-248,y=23}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-251,y=22}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-249,y=23}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-245,y=23}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-242,y=28}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-241,y=21}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-242,y=26}})

      end
	},
	{ 
	  condition = story_elapsed_check(0.1),	  
    },
	{
      init = function()
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-250,y=25}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-250,y=24}})
        game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-250,y=22}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-249,y=23}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-250,y=22}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-248,y=23}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-251,y=22}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-249,y=23}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-245,y=23}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-242,y=28}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-241,y=21}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-242,y=26}})

      end
	},
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
		global.radar_base1 = game.surfaces[1].find_entities_filtered{area = {{-241.5, -9.5}, {-241.5, -9.5}}, name = "straight-rail", limit = 1}[1]
		global.radar_base2 = game.surfaces[1].find_entities_filtered{area = {{-241.5, -26.5}, {-241.5, -26.5}}, name = "straight-rail", limit = 1}[1]
		global.radar_base3 = game.surfaces[1].find_entities_filtered{area = {{-308.5, -16.5}, {-308.5, -16.5}}, name = "medium-worm-turret", limit = 1}[1]
		global.radar_base4 = game.surfaces[1].find_entities_filtered{area = {{-333.5, -38.5}, {-333.5, -38.5}}, name = "biter-spawner", limit = 1}[1]
        if global.radar_base1 and global.radar_base2 and global.radar_base3 and global.radar_base4 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {

				{
                  target = global.radar_base1,
                  transition_time = 200,
                  time_to_wait = 30,
                  zoom = 1.5
                },
				{
                  target = global.radar_base2,
                  transition_time = 150,
                  time_to_wait = 350,
                  zoom = 0.8
                },
				{
                  target = global.radar_base3,
                  transition_time = 200,
                  time_to_wait = 50,
                  zoom = 1
                },
				{
                  target = global.radar_base4,
                  transition_time = 170,
                  time_to_wait = 120,
                  zoom = 1.2
                },
				{
                  target = player.character,
                  transition_time = 100,
                  time_to_wait = 50,
                  zoom = 1
                },
              },
              start_position = global.radar_base1.position,
              start_zoom = 2
            }
          end
        end
      end,
      condition = story_elapsed_check(1),
    },
	{
      condition = story_elapsed_check(24),
	},
	{
      init = function()
		game.players[1].character.destructible = true
      end
    },
	{
      action =
      function()
        game.show_message_dialog{text = {"msg-base-7"}}
		game.show_message_dialog{text = {"msg-base-8"}}
      end
    },
	{
      condition = story_elapsed_check(2),
      action = function()
	    set_goal({"goal-destroy-spawns"})
      end
    },
	{ 
	  condition = story_elapsed_check(0.2),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-137.5,y=-30.5}})
      end
    },
	{ 
	  condition = story_elapsed_check(0.2),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-136.5,y=-32.5}})
      end
    },
	{ 
	  condition = story_elapsed_check(0.2),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-135.5,y=-34.5}})
      end
    },
	{ 
	  condition = story_elapsed_check(0.2),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-134.5,y=-36.5}})
      end
    },
	{ 
	  condition = story_elapsed_check(0.2),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-133.5,y=-38.5}})	
      end
    },
	{ 
	  condition = story_elapsed_check(0.2),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-132.5,y=-40.5}})	
      end
    },
	{ 
	  condition = story_elapsed_check(0.2),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-131.5,y=-42.5}})
      end
    },
	{ 
	  condition = story_elapsed_check(0.2),
      init = function() 
        game.surfaces[1].create_entity({name='construction-robot', force='player', position={x=-134.5,y=-43.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.2),
      init = function() 
        game.surfaces[1].create_entity({name='construction-robot', force='player', position={x=-132.5,y=-45.5}})
      end
    },
	{ 
	  condition = story_elapsed_check(0.2),
      init = function() 
        game.surfaces[1].create_entity({name='construction-robot', force='player', position={x=-131.5,y=-47.5}})	
      end
    },
	{
      condition = story_elapsed_check(5),
	},
	{
      action =
      function()
        game.show_message_dialog{text = {"msg-base-8.1"}}
		set_goal("")
      end
    },
	{
      condition = story_elapsed_check(1),
	},
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
		global.radar_art1 = game.surfaces[1].find_entities_filtered{area = {{-247.5, -53.5}, {-247.5, -53.5}}, name = "artillery-turret", limit = 1}[1]
		global.radar_art2 = game.surfaces[1].find_entities_filtered{area = {{-191.2, -82.5}, {-191.2, -82.5}}, name = "straight-rail", limit = 1}[1]
        if global.radar_art1 and global.radar_art2 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {

				{
                  target = global.radar_art1,
                  transition_time = 150,
                  time_to_wait = 150,
                  zoom = 1.2
                },
				{
                  target = global.radar_art2,
                  transition_time = 150,
                  time_to_wait = 200,
                  zoom = 0.9
                },
				{
                  target = player.character,
                  transition_time = 100,
                  time_to_wait = 30,
                  zoom = 1
                },
              },
              start_position = player.character.position
              --start_zoom = 1.2
            }
          end
        end
      end,
      condition = story_elapsed_check(1),
    },
	{
      condition = story_elapsed_check(8),
	},
	{
      action =
      function()

		game.show_message_dialog{text = {"msg-base-8.2"}}
      end
    },
	{
      condition = story_elapsed_check(4),
	},
	{
      init = function()
		game.players[1].character.destructible = true
      end
    },
	{
      action = function()
	    set_goal({"goal-destroy-spawns-2",0,4})
        global.units_killed = 0
      end
    },
    {
      init = function()
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "biter-spawner" or
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "spitter-spawner" then
          global.units_killed = global.units_killed + 1
		  set_goal({"goal-destroy-spawns-2",global.units_killed,4})
        end
      end,
      condition = function() return global.units_killed >= 4 end,
      action = function()
        set_goal("")
      end
    },
	{
      condition = story_elapsed_check(3),
      action = function()
	    set_goal("")
      end
    },
	{ 
	  condition = story_elapsed_check(5),	  
    },
	{
      action =
      function()
		game.show_message_dialog{text = {"msg-base-8.3"}}
      end
    },
	{
      condition = story_elapsed_check(2),
      action = function()
	    set_goal({"goal-wait"})
      end
    },
	{ 
	  condition = story_elapsed_check(30),	  
    },
	{
      action =
      function()
	    set_goal("")
        game.show_message_dialog{text = {"msg-base-9"}}
		game.show_message_dialog{text = {"msg-base-10"}}
		game.show_message_dialog{text = {"msg-base-11"}}
      end
    },
    --------------------------
	--/// DESTROY GENERATORS  /// --
	--------------------------	
	{
	  init = function()

		game.surfaces[1].create_entity({name='land-mine', force = "enemy", position={x=-242.5,y=102.5}})
        game.surfaces[1].create_entity({name='land-mine', force = "enemy", position={x=-242.5,y=103.5}})
		game.surfaces[1].create_entity({name='land-mine', force = "enemy", position={x=-237.5,y=100.5}})
        game.surfaces[1].create_entity({name='land-mine', force = "enemy", position={x=-237.5,y=101.5}})
		game.surfaces[1].create_entity({name='land-mine', force = "enemy", position={x=-237.5,y=102.5}})
      end
	},
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
		global.radar_base1 = game.surfaces[1].find_entities_filtered{area = {{-241.5, 101.5}, {-241.5, 101.5}}, name = "straight-rail", limit = 1}[1]
		global.radar_base2 = game.surfaces[1].find_entities_filtered{area = {{-241.5, 118.5}, {-241.5, 118.5}}, name = "straight-rail", limit = 1}[1]
		global.radar_base3 = game.surfaces[1].find_entities_filtered{area = {{-231.5, 236.5}, {-231.5, 236.5}}, name = "steam-engine", limit = 1}[1]
        if global.radar_base1 and global.radar_base2 and global.radar_base3 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {

				{
                  target = global.radar_base1,
                  transition_time = 0,
                  time_to_wait = 300,
                  zoom = 1.5
                },
				{
                  target = global.radar_base2,
                  transition_time = 200,
                  time_to_wait = 120,
                  zoom = 0.8
                },
				{
                  target = global.radar_base3,
                  transition_time = 250,
                  time_to_wait = 150,
                  zoom = 1
                },
				{
                  target = player.character,
                  transition_time = 100,
                  time_to_wait = 0,
                  zoom = 1
                },
              },
              start_position = global.radar_base1.position,
              start_zoom = 1.5
            }
          end
        end
      end,
      condition = story_elapsed_check(0),
    },
	{
      condition = story_elapsed_check(16),
    },
	{
      action =
      function()
		game.show_message_dialog{text = {"msg-base-12"}}

      end
    },
	{
	  condition = story_elapsed_check(5),
      action =
      function()
		game.show_message_dialog{text = {"msg-base-13"}}
      end
    },
	{
	  action = function()
        set_goal("")
		for index, entity in pairs(global.intro_entities_engines) do
		entity.destructible = true
        end
	  end
	},
	{
	  action = function()
        set_goal("")
		for index, entity in pairs(global.intro_entities_tracks) do
		entity.destructible = true
		entity.minable = true
        end
	  end
	},
	{
      init = function()
		game.players[1].character.destructible = true
      end
    },
	{
      init = function()
		chart_areas8()
      end
    },
	{
      condition = story_elapsed_check(2),
      action = function()
	    set_goal({"goal-destroy-engines",0,8})
        global.units_killed = 0
      end
    },
    {
      init = function()
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
			event.entity.force.name == "enemy" and
            event.entity.name == "steam-engine" then
          global.units_killed = global.units_killed + 1
		  set_goal({"goal-destroy-engines",global.units_killed,8})
        end
      end,
      condition = function() return global.units_killed >= 8 end,
      action = function()
        set_goal("")
      end
    },
	{ 
	  condition = story_elapsed_check(2),	  
    },
	{
      -- this will activate main pirate base
	  init = function()

		game.surfaces[1].create_entity({name='straight-rail', force = "enemy", position={x=761,y=405}})
        game.surfaces[1].create_entity({name='straight-rail', force = "enemy", position={x=815,y=381}})
		game.surfaces[1].create_entity({name='straight-rail', force = "enemy", position={x=821,y=381}})
		game.surfaces[1].create_entity({name='straight-rail', force = "enemy", position={x=833,y=137}})
		game.surfaces[1].create_entity({name='big-electric-pole', force = "enemy", position={x=857,y=176}})
		game.surfaces[1].create_entity({name='big-electric-pole', force = "enemy", position={x=877,y=235}})
		game.surfaces[1].create_entity({name='big-electric-pole', force = "enemy", position={x=864,y=141}})
		game.surfaces[1].create_entity({name='big-electric-pole', force = "enemy", position={x=626,y=422}})
		--game.surfaces[1].create_entity({name='burner-inserter', force = "enemy", position={x=790.5,y=398.5}})
      end
	},
	{
	  action = function()
        local mainenemy_chest = game.get_entity_by_tag("spawn-fuel")
        mainenemy_chest.insert{name = "uranium-fuel-cell", count = 100}
      end
    },
	
	------------------------------------
	--/// BUILD 8 MINES  /// --
	------------------------------------	
	{
      action =
      function()
		game.show_message_dialog{text = {"msg-base-14"}}
      end
    },
	{
      condition = story_elapsed_check(1),
	}, 
	{
      init = function()
        set_goal({"goal-build-mines-2",0,8})
        global.build_units = 0
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and event.entity.name == 'electric-mining-drill' then
          global.build_units = global.build_units - 1
          set_goal({"goal-build-mines-2",global.build_units,8},true)
        elseif event.name == defines.events.on_built_entity and event.created_entity.name == 'electric-mining-drill' then
          global.build_units = global.build_units + 1
          set_goal({"goal-build-mines-2",global.build_units,8},true)
        elseif event.name == defines.events.on_player_mined_entity and event.entity.name =='electric-mining-drill' then
          global.build_units = global.build_units - 1
          set_goal({"goal-build-mines-2",global.build_units,8},true)
        end
      end,
      condition = function(event)
        return global.build_units >= 8
      end
    },
    ------------------------------------
	--/// TAKE FIRST COMPUTERS  /// --
	------------------------------------	

	{
      action = function()
        set_goal("")
        local cchest = game.get_entity_by_tag("computer1")
        cchest.insert{name = "rocket-control-unit", count = 1}

      end
    },
	{
      condition = story_elapsed_check(2),
	}, 
	{ 
      init = function()	   
	   local lab_boom = game.surfaces[1].create_entity({name='explosive-rocket', target={-235,-132}, speed=1, position = {-235,-132}, force = "enemy"})
      end
    },
	{
      condition = story_elapsed_check(2),
	},
	{
      action =
      function()
		game.show_message_dialog{text = {"msg-base-15"}}
      end
    },
	{
      condition = story_elapsed_check(2),
	},
	{
      condition = story_elapsed_check(2),
      action = function()
	    set_goal({"goal-wait"})
      end
    },
	{ 
	  condition = story_elapsed_check(30),	  
    },
	{
      action =
      function()
		game.show_message_dialog{text = {"msg-base-15.1"}}
		game.show_message_dialog{text = {"msg-base-16"}}
		game.show_message_dialog{text = {"msg-base-17"}}
		game.show_message_dialog{text = {"msg-base-18"}}
      end
    },
	{
      condition = story_elapsed_check(5),
	},
	{
      action =
      function()
		game.show_message_dialog{text = {"msg-base-19"}}
		set_goal("")
      end
    },
	{
      condition = story_elapsed_check(1),
	},
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
		global.radar_red1 = game.surfaces[1].find_entities_filtered{area = {{-833.5, 101.5}, {-833.5, 101.5}}, name = "red-chest", limit = 1}[1]
        if global.radar_red1 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
				{
                  target = global.radar_red1,
                  transition_time = 200,
                  time_to_wait = 50,
                  zoom = 1.2
                },
				{
                  target = global.radar_red1,
                  transition_time = 100,
                  time_to_wait = 200,
                  zoom = 0.8
                },
				{
                  target = player.character,
                  transition_time = 100,
                  time_to_wait = 30,
                  zoom = 1
                },
              },
              start_position = player.character.position
            }
          end
        end
      end,
      condition = story_elapsed_check(1),
    },
	{
      condition = story_elapsed_check(12),
	},
	{
      init = function()
		chart_areas1()
		chart_tag1()
      end
    },
	{
      init = function()
		game.players[1].character.destructible = true
      end
    },
	{
      condition = story_elapsed_check(2),
	  update = (function()
        local only_update = false
        return function(event)
		  local echest = game.get_entity_by_tag("computer1")
          local resources1 = echest.get_item_count("rocket-control-unit") 
          set_goal
          (
            {
              "goal-first-computer",
              resources1,
			  1
            },

            only_update
          )
          only_update = true
        end
      end)(),
      condition = function()
	    local echest = game.get_entity_by_tag("computer1")
        return 
              echest.get_item_count("rocket-control-unit") == 0
        end,
      action = function()
        set_goal("")
      end
    },
	{ 
	  condition = story_elapsed_check(2),	  
    },
	{
	  action = function()
        set_goal("")
		for index, entity in pairs(global.intro_entities_computers_1) do
		entity.destructible = true
        end
	  end
	},
    ------------------------------------
	--/// TAKE SECOND COMPUTERS  /// --
	------------------------------------	

	{
      action = function()
        set_goal("")
        local cchest = game.get_entity_by_tag("computer2")
        cchest.insert{name = "rocket-control-unit", count = 3}

      end
    },
	{
      action =
      function()
		game.show_message_dialog{text = {"msg-base-20"}}
      end
    },
	{
      init = function()
		chart_areas2()
		chart_tag2()
      end
    },
	{
      condition = story_elapsed_check(2),
	},
	{
      condition = story_elapsed_check(1),
	  update = (function()
        local only_update = false
        return function(event)
		  local echest = game.get_entity_by_tag("computer2")
          local resources1 = echest.get_item_count("rocket-control-unit") 
          set_goal
          (
            {
              "goal-second-computer",
              resources1,
			  3
            },

            only_update
          )
          only_update = true
        end
      end)(),
      condition = function()
	    local echest = game.get_entity_by_tag("computer2")
        return 
              echest.get_item_count("rocket-control-unit") == 0
        end,
      action = function()
        set_goal("")
      end
    },
	{ 
	  condition = story_elapsed_check(2),	  
    },
	{
	  action = function()
        set_goal("")
		for index, entity in pairs(global.intro_entities_computers_2) do
		entity.destructible = true
        end
	  end
	},
    ------------------------------------
	--/// TAKE THIRD COMPUTERS  /// --
	------------------------------------	
	{
      action = function()
        set_goal("")
        local cchest = game.get_entity_by_tag("computer3")
        cchest.insert{name = "rocket-control-unit", count = 5}

      end
    },
	{
      action =
      function()
		game.show_message_dialog{text = {"msg-base-21"}}
		game.show_message_dialog{text = {"msg-base-21.1"}}
      end
    },
	{
      init = function()
		chart_areas3()
		chart_tag3()
      end
    },
	{
      condition = story_elapsed_check(2),
	},
	{
      condition = story_elapsed_check(1),
	  update = (function()
        local only_update = false
        return function(event)
		  local echest = game.get_entity_by_tag("computer3")
          local resources1 = echest.get_item_count("rocket-control-unit") 
          set_goal
          (
            {
              "goal-third-computer",
              resources1,
			  5
            },

            only_update
          )
          only_update = true
        end
      end)(),
      condition = function()
	    local echest = game.get_entity_by_tag("computer3")
        return 
              echest.get_item_count("rocket-control-unit") == 0
        end,
      action = function()
        set_goal("")
      end
    },	
	{ 
	  condition = story_elapsed_check(2),	  
    },
	{
	  action = function()
        set_goal("")
		for index, entity in pairs(global.intro_entities_computers_3) do
		entity.destructible = true
        end
	  end
	},
	{
    -- this will activate main pirate base roboports invasion
	  init = function()

		game.surfaces[1].create_entity({name='roboport', force = "enemy", position={x=400,y=412}})
		
      end
	},
	-- artillery attack on player
	{
      action =
      function()
		game.show_message_dialog{text = {"msg-base-22"}}
		game.show_message_dialog{text = {"msg-base-23"}}
      end
    },
	{ 
	  condition = story_elapsed_check(2),
      init = function()	  
      local atom_boom = game.surfaces[1].create_entity({name='artillery-projectile', target={-495,-536}, speed=1, position = {-200,-500}, force = "enemy"})	  
	  local atom_boom = game.surfaces[1].create_entity({name='artillery-projectile', target={-477,-553}, speed=1, position = {-300,-500}, force = "enemy"})
      local atom_boom = game.surfaces[1].create_entity({name='artillery-projectile', target={-508,-540}, speed=1, position = {-200,-500}, force = "enemy"})	
	  local atom_boom = game.surfaces[1].create_entity({name='artillery-projectile', target={-510,-554}, speed=1, position = {-300,-500}, force = "enemy"})	
	  end
    },
	{
      action =
      function()
		think("msg10")
      end
	}, 
	{ 
	  condition = story_elapsed_check(2),
      init = function()	  
      local atom_boom = game.surfaces[1].create_entity({name='artillery-projectile', target={-497,-526}, speed=1, position = {-200,-500}, force = "enemy"})	  
	  local atom_boom = game.surfaces[1].create_entity({name='artillery-projectile', target={-466,-560}, speed=1, position = {-300,-500}, force = "enemy"})
      local atom_boom = game.surfaces[1].create_entity({name='artillery-projectile', target={-529,-542}, speed=1, position = {-200,-500}, force = "enemy"})		
	  end
    },
	{ 
	  condition = story_elapsed_check(3),
      init = function()	  
      local atom_boom = game.surfaces[1].create_entity({name='artillery-projectile', target={-493,-554}, speed=1, position = {-200,-500}, force = "enemy"})	  
	  local atom_boom = game.surfaces[1].create_entity({name='artillery-projectile', target={-502,-549}, speed=1, position = {-300,-500}, force = "enemy"})
      local atom_boom = game.surfaces[1].create_entity({name='artillery-projectile', target={-488,-543}, speed=1, position = {-200,-500}, force = "enemy"})		
	  end
    },
    {
      action =
      function()
		think("msg11")
      end
	}, 
	{ 
	  condition = story_elapsed_check(3),
      init = function()	  
      local atom_boom = game.surfaces[1].create_entity({name='artillery-projectile', target={-488,-499}, speed=1, position = {-200,-500}, force = "enemy"})	  
	  local atom_boom = game.surfaces[1].create_entity({name='artillery-projectile', target={-458,-484}, speed=1, position = {-300,-500}, force = "enemy"})
      local atom_boom = game.surfaces[1].create_entity({name='artillery-projectile', target={-435,-493}, speed=1, position = {-200,-500}, force = "enemy"})		
	  end
    },
	------------------------------------
	--/// TAKE FORTH COMPUTERS  /// --
	------------------------------------	
	{
      action = function()
        set_goal("")
        local cchest = game.get_entity_by_tag("computer4")
        cchest.insert{name = "rocket-control-unit", count = 1}

      end
    },
	{ 
	  condition = story_elapsed_check(6),
    },
	{
      action =
      function()
		think("msg12")
      end
	}, 
	{ 
	  condition = story_elapsed_check(6),
    },
	{
      action =
      function()
		game.show_message_dialog{text = {"msg-base-24"}}
		game.show_message_dialog{text = {"msg-base-25"}}
      end
    },
	{ 
	  condition = story_elapsed_check(1),
    },
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
		global.radar_red4 = game.surfaces[1].find_entities_filtered{area = {{28.5, -460.5}, {28.5, -460.5}}, name = "red-chest", limit = 1}[1]
        if global.radar_red4 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
				{
                  target = global.radar_red4,
                  transition_time = 200,
                  time_to_wait = 100,
                  zoom = 1.5
                },
				{
                  target = global.radar_red4,
                  transition_time = 200,
                  time_to_wait = 200,
                  zoom = 0.8
                },
				{
                  target = player.character,
                  transition_time = 100,
                  time_to_wait = 30,
                  zoom = 1
                },
              },
              start_position = player.character.position
            }
          end
        end
      end,
      condition = story_elapsed_check(1),
    },
	{
      condition = story_elapsed_check(14),
	},
	{
      init = function()
		chart_areas4()
		chart_tag4()
      end
    },
	{
      condition = story_elapsed_check(2),
      action = function()
	    set_goal({"goal-forth-computer"})
      end
    },
	{
      init = function()
		game.players[1].character.destructible = true
      end
    },
	{ 
	  condition = story_elapsed_check(5),
    },
	{
      action =
      function()
		think("msg13")
      end
	}, 
	{ 
	  condition = story_elapsed_check(20),
    },
	{
      action =
      function()
		game.show_message_dialog{text = {"msg-base-26"}}
		game.show_message_dialog{text = {"msg-base-27"}}
      end
    },
	{
      init = function()
		chart_areas5()
		chart_tag5()
      end
    },
	{
      condition = story_elapsed_check(1),
	  update = (function()
        local only_update = false
        return function(event)
		  local echest = game.get_entity_by_tag("computer4")
          local resources1 = echest.get_item_count("rocket-control-unit") 
          set_goal
          (
            {
              "goal-forth-computer-2",
              resources1,
			  1
            },

            only_update
          )
          only_update = true
        end
      end)(),
      condition = function()
	    local echest = game.get_entity_by_tag("computer4")
        return 
              echest.get_item_count("rocket-control-unit") == 0
        end,
      action = function()
        set_goal("")
      end
    },
	{ 
	  condition = story_elapsed_check(2),	  
    },
	{
	  action = function()
        set_goal("")
		for index, entity in pairs(global.intro_entities_computers_4) do
		entity.destructible = true
        end
	  end
	},
	---------------------------------------------
	--/// PREPARE AND LAUNCH ROCKET IN SILO  /// --
	--------------------------------------------
	{
    action =
      function()
		game.show_message_dialog{text = {"msg-base-28"}}
		game.show_message_dialog{text = {"msg-base-29"}}
		game.show_message_dialog{text = {"msg-base-30"}}
      end
    },
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
			game.map_settings.enemy_expansion.enabled = true
		elseif game.difficulty == defines.difficulty.normal then  
			game.map_settings.enemy_expansion.enabled = true
		elseif game.difficulty == defines.difficulty.hard then  
		    game.map_settings.enemy_expansion.enabled = true
        end
      end
    },
	{
      condition = story_elapsed_check(2),
      action =
      function()
        set_goal({"goal-prepare-silo"})
      end
	},

	{ condition = function(event)
        return event.name == defines.events.on_rocket_launch_ordered --and event.rocket.get_item_count("satellite") > 0
      end
    },
	{ 
	  condition = story_elapsed_check(1),
      action = function()
	    set_goal({"goal-launch-silo"})
      end	  
    },
	{
    condition = story_elapsed_check(0.5),
    action = 
	  function()
		game.show_message_dialog{text = {"msg-base-31"}}
		game.show_message_dialog{text = {"msg-base-32"}}
		game.show_message_dialog{text = {"msg-base-33"}}
		game.show_message_dialog{text = {"msg-base-34"}}
		game.show_message_dialog{text = {"msg-base-35"}}
		game.show_message_dialog{text = {"msg-base-36"}}
		game.show_message_dialog{text = {"msg-base-37"}}
      end
    },
	{
	  action = function()
		for index, entity in pairs(global.intro_entities_silos) do
		entity.destructible = true
        end
	  end
	},
	{ 
	  condition = story_elapsed_check(7),  
    },
	{
    action = 
	  function()
		game.show_message_dialog{text = {"msg-base-38"}}
      end
    },
	{ 
      init = function()
	   local silo_one = game.get_entity_by_tag("silo")
	   global.silo_one = silo_one
	   
	   local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={-187,-118}, speed=1, position = {-170,-100}, force = "enemy"})
	   global.atom_boom = atom_boom
      end
    },
	{ 
	  condition = story_elapsed_check(5),	  
    },
	{
      condition = story_elapsed_check(2),
      action = function()
	  set_goal("")
      end
    },
	{ 
	  condition = story_elapsed_check(6),	  
    },
	-----------------------------------
	--/// RESEARCH ROCKET SILO  /// --
	-----------------------------------
	{
    condition = story_elapsed_check(1),
    action = 
	  function()
		game.show_message_dialog{text = {"msg-base-39"}}
		game.show_message_dialog{text = {"msg-base-40"}}
      end
    },
	{ 
	  condition = story_elapsed_check(2),
    },
	{
      action =
      function()
		think("msg14")
      end
	}, 
	{ 
	  condition = story_elapsed_check(3),
    },
	{
      action =
      function()
		think("msg15")
      end
	}, 
	{ 
	  condition = story_elapsed_check(6),
    },
	{
      action =
      function()
		think("msg16")
      end
	}, 
	{
    condition = story_elapsed_check(8),
    },
	{
	action = 
	  function()
		game.show_message_dialog{text = {"msg-base-41"}}
      end
    },
	{ 
	  condition = story_elapsed_check(2),
    },
	{
      action =
      function()
		think("msg17")
      end
	}, 
	{ 
	  condition = story_elapsed_check(5),
    },
	{
      action =
      function()
		think("msg18")
      end
	}, 
	{
    condition = story_elapsed_check(7),
	},
	{
    action = 
	  function()
		game.show_message_dialog{text = {"msg-base-42"}}
      end
    },
	{
      condition = story_elapsed_check(1),
      action =
      function()
        set_goal("")
		game.players[1].force.technologies["rocket-control-unit"].enabled = true
		game.players[1].force.technologies["rocket-silo"].enabled = true      
      end
	},
	{
      condition = story_elapsed_check(2),
      action = function()
	  set_goal({"goal-research-silo"})
      end
    },
	{
	  condition = story_elapsed_check(2),
      action =
      function(event)
        if event.name == defines.events.on_built_entity and event.created_entity.name == "rocket-silo" then
          event.created_entity.energy = 1 
        end
      end
    },
	{
	  condition = story_elapsed_check(3),
	  condition = function() return game.players[1].force.technologies["rocket-silo"].researched end,
      action =
      function()
	    set_goal("")
      end
    },
	-----------------------------------
	--/// BUILD ROCKET SILO  /// --
	-----------------------------------
	{
    condition = story_elapsed_check(2),
    action = 
	  function()
		game.show_message_dialog{text = {"msg-base-43"}}
      end
    },
	{
      condition = story_elapsed_check(2),
	}, 
	{
      init = function()
        set_goal({"goal-build-silo",0,1})
        global.build_units = 0
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and event.entity.name == 'rocket-silo' then
          global.build_units = global.build_units - 1
          set_goal({"goal-build-silo",global.build_units,1},true)
        elseif event.name == defines.events.on_built_entity and event.created_entity.name == 'rocket-silo' or
		       event.name == defines.events.on_robot_built_entity and event.created_entity.name == 'rocket-silo' then
          global.build_units = global.build_units + 1
          set_goal({"goal-build-silo",global.build_units,1},true)
        elseif event.name == defines.events.on_player_mined_entity and event.entity.name =='rocket-silo' then
          global.build_units = global.build_units - 1
          set_goal({"goal-build-silo",global.build_units,1},true)
        end
      end,
      condition = function(event)
        return global.build_units >= 1
      end
    },
	
	-----------------------------------
	--/// DESTROY ROCKET SILO  /// --
	-----------------------------------
	
	{
	  action = function()
        set_goal("")
		for index, entity in pairs(global.intro_entities_enemy_silos) do
		entity.destructible = true
        end
	  end
	},
	{
    condition = story_elapsed_check(2),
    action = 
	  function()
		game.show_message_dialog{text = {"msg-base-44"}}
      end
    },
	{
    condition = story_elapsed_check(2),
    },
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
		global.radar_ebase1 = game.surfaces[1].find_entities_filtered{area = {{811.5, 318.5}, {811.5, 318.5}}, name = "rocket-silo", limit = 1}[1]
		global.radar_ebase2 = game.surfaces[1].find_entities_filtered{area = {{607.5, 217.5}, {607.5, 217.5}}, name = "laser-turret", limit = 1}[1]
		global.radar_ebase3 = game.surfaces[1].find_entities_filtered{area = {{509.5, 762.5}, {509.5, 762.5}}, name = "steel-chest", limit = 1}[1]
        if global.radar_ebase1 and global.radar_ebase2 and global.radar_ebase3 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {

				{
                  target = global.radar_ebase1,
                  transition_time = 300,
                  time_to_wait = 100,
                  zoom = 1.2
                },
				{
                  target = global.radar_ebase2,
                  transition_time = 330,
                  time_to_wait = 50,
                  zoom = 0.85
                },
				{
                  target = global.radar_ebase2,
                  transition_time = 300,
                  time_to_wait = 200,
                  zoom = 0.6
                },
				{
                  target = global.radar_ebase3,
                  transition_time = 200,
                  time_to_wait = 300,
                  zoom = 0.9
                },
				{
                  target = player.character,
                  transition_time = 250,
                  time_to_wait = 30,
                  zoom = 0.75
                },
              },
            start_position = global.radar_ebase1.position,
            start_zoom = 0.6
            }
          end
        end
      end,
      condition = story_elapsed_check(2),
    },
	{
      condition = story_elapsed_check(16),
	},
	{
    action = 
	  function()
		game.show_message_dialog{text = {"msg-base-45"}}
		game.show_message_dialog{text = {"msg-base-46"}}
      end
    },
	{
      condition = story_elapsed_check(16),
	},
	{
      init = function()
		chart_areas6()
		chart_areas7()
		chart_tag6()
      end
    },
	{
      condition = story_elapsed_check(2),
      action = function()
	    set_goal({"goal-destroy-silo",0,1})
        global.units_killed = 0
      end
    },
	{
      init = function()
		game.players[1].character.destructible = true
      end
    },
    {
      init = function()
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
			event.entity.force.name == "enemy" and
            event.entity.name == "rocket-silo" then
          global.units_killed = global.units_killed + 1
		  set_goal({"goal-destroy-silo",global.units_killed,1})
        end
      end,
      condition = function() return global.units_killed >= 1 end,
      action = function()
        set_goal("")
      end
    },
	{ 
	  condition = story_elapsed_check(2),	  
    },
	{ 
	  init = function()

		game.surfaces[1].create_entity({name='fast-inserter', force = "pirate", position={x=-62.5,y=-849.5}})
      end
	},
	{
    action = 
	  function()
		game.show_message_dialog{text = {"msg-base-46.1"}}
      end
    },
	{
      condition = story_elapsed_check(2),
      action = function()
	    set_goal({"goal-wait"})
      end
    },
	{ 
	  condition = story_elapsed_check(13),	  
    },
	{
    action = 
	  function()
		game.show_message_dialog{text = {"msg-base-47"}}
      end
    },
	{
      condition = story_elapsed_check(1),
      action = function()
	    set_goal("")
      end
    },
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
		global.radar_base1 = game.surfaces[1].find_entities_filtered{area = {{-55.5, -843.5}, {-55.5, -843.5}}, name = "fast-underground-belt", limit = 1}[1]
        if global.radar_base1 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {

				{
                  target = global.radar_base1,
                  transition_time = 400,
                  time_to_wait = 800,
                  zoom = 0.7
                },
				{
                  target = global.radar_base1,
                  transition_time = 500,
                  time_to_wait = 600,
                  zoom = 0.6
                },
				{
                  target = player.character,
                  transition_time = 0,
                  time_to_wait = 0,
                  zoom = 1
                },
              },
              start_position = global.radar_base1.position,
              start_zoom = 1.2
            }
          end
        end
      end,
      condition = story_elapsed_check(0),
    },
	{
      condition = story_elapsed_check(15),
    },
	{
    action = 
	  function()
		game.show_message_dialog{text = {"msg-base-48"}, point_to={type="position", position={x=-55.5,y=-843.5}}}
      end
    },
	{ 
	  condition = story_elapsed_check(2),
    },
	{
      action =
      function()
		think("msg19")
      end
	},
	{
      condition = story_elapsed_check(23),
    },
	{
    action = 
	  function()
		game.show_message_dialog{text = {"msg-base-49"}}
		game.show_message_dialog{text = {"msg-base-50"}}
		game.show_message_dialog{text = {"msg-base-51"}}
		game.show_message_dialog{text = {"msg-base-52"}}
		game.show_message_dialog{text = {"msg-base-53"}}
      end
    },
	{ 
	  condition = story_elapsed_check(5),	  
    },
	{
      init = function()
		game.players[1].character.destructible = true
      end
    },
	{ 
	  condition = story_elapsed_check(1),	  
    },
	{
      action =
      function()
        if game.difficulty == defines.difficulty.easy then
			game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-10")}) -- YOU WIN THE GAME
		elseif game.difficulty == defines.difficulty.normal then  
			game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-10")}) -- YOU WIN THE GAME
		elseif game.difficulty == defines.difficulty.hard then  
		    game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-10")}) -- YOU WIN THE GAME
        end
      end
    },	
  }
}


story_init_helpers(story_table)

local story_events =
{
  defines.events.on_tick,
  defines.events.on_entity_died,
  defines.events.on_built_entity,
  defines.events.on_player_mined_item,
  defines.events.on_player_mined_entity,
  defines.events.on_sector_scanned,
  defines.events.on_entity_died,
  defines.events.on_entity_damaged,
  defines.events.on_rocket_launched,
  defines.events.on_rocket_launch_ordered,
  defines.events.on_robot_built_entity,
  defines.events.on_player_died
}

local build_events =
{
  --defines.events.on_built_entity,
  --defines.events.on_robot_built_entity,
  defines.events.script_raised_built,
  defines.events.script_raised_revive
}

local on_built_entity = function(event)

  local entity = event.entity or event.created_entity
  if not (entity and entity.valid) then return end

  if entity.name == "car" then
    global.cars[entity.unit_number] = entity
  end

end

local on_player_driving_changed_state = function(event)
  -- If they find the car in the ruin, only consider it for the objectives if they get in.
  local car = event.entity
  if not (car and car.valid) then return end

  if car.name ~= "car" then return end

  global.cars[car.unit_number] = car

end

local function on_configuration_changed()
	game.reload_script()
end

 script.on_event(story_events, function(event)
   --if game.players[1].character then
     check_for_player_death(event)
     story_update(global.story, event)
   --end
end)

script.on_event(defines.events.on_player_created, on_player_created)

script.on_event(build_events, on_built_entity)
script.on_event(defines.events.on_player_driving_changed_state, on_player_driving_changed_state)
script.on_event(defines.events.on_gui_click, intro_screen.on_gui_click)
script.on_init(on_configuration_changed)
script.on_configuration_changed(on_configuration_changed)