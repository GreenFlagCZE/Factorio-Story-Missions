require "util"
require "story"
local intro_screen = require("intro_screen")


local think = function(thought)
  game.players[1].print({"","[img=entity/character][color=orange]",{"engineer-title"},": [/color]",{"think-"..thought}})
end

local msg = function(msg)
  game.players[1].print({"","[img=entity/radar][color=red]",{"computer-title"},": [/color]",{"msg-"..msg}})
end

function check_for_player_death(event)
	if  event.name == defines.events.on_player_died then
		game.set_game_state({game_finished=true, player_won=false, can_continue=false})
	end
  end
  
  
local function on_configuration_changed()
	game.reload_script()
end

-- MAP REVEAL POINT OF INTEREST DURING THE MISSION
local red_worm1 = {-235.5, 363.5}
script.on_init(function()
  global.story = story_init()
  game.forces.player.set_spawn_position(red_worm1, 1)
end)
local chart_areas1 = function()
  local surface = game.surfaces[1]
  local force = game.forces.player
  for k, entity in pairs (surface.find_entities_filtered{force = force, area = {{-500, -250},{500, 250}}}) do
    local position = entity.position
   -- force.chart(surface, {{position.x - 16, position.y - 16}, {position.x + 16, position.y + 16}})
  end
  force.chart(surface, {{red_worm1[1] - 25, red_worm1[2] - 25}, {red_worm1[1] + 25, red_worm1[2] + 25}})
end
local chart_tag1 = function()
  local surface = game.surfaces[1]
  local force = game.forces.player
  for k, entity in pairs (surface.find_entities_filtered{force = force, area = {{-235.5, 363.5},{-235.5, 363.5}}}) do
    local position = entity.position
   --force.add_chart_tag (surface, {position = {-833.5, 101.5}, icon = {type="item", name="radar"}, text = "control unit"})
   game.print(string.format("[gps=%s, %s]", position.x, position.y))  		
  end
end

-- MAP REVEAL POINT OF INTEREST DURING THE MISSION
local red_worm2 = {338.5, 188.5}
script.on_init(function()
  global.story = story_init()
  game.forces.player.set_spawn_position(red_worm2, 1)
end)
local chart_areas2 = function()
  local surface = game.surfaces[1]
  local force = game.forces.player
  for k, entity in pairs (surface.find_entities_filtered{force = force, area = {{-500, -250},{500, 250}}}) do
    local position = entity.position
   -- force.chart(surface, {{position.x - 16, position.y - 16}, {position.x + 16, position.y + 16}})
  end
  force.chart(surface, {{red_worm2[1] - 25, red_worm2[2] - 25}, {red_worm2[1] + 25, red_worm2[2] + 25}})
end
local chart_tag2 = function()
  local surface = game.surfaces[1]
  local force = game.forces.player
  for k, entity in pairs (surface.find_entities_filtered{force = force, area = {{338.5, 188.5},{338.5, 188.5}}}) do
    local position = entity.position
   --force.add_chart_tag (surface, {position = {-833.5, 101.5}, icon = {type="item", name="radar"}, text = "control unit"})
   game.print(string.format("[gps=%s, %s]", position.x, position.y))  		
  end
end

-- MAP REVEAL POINT OF INTEREST DURING THE MISSION
local red_worm3 = {114.5, 466.5}
script.on_init(function()
  global.story = story_init()
  game.forces.player.set_spawn_position(red_worm3, 1)
end)
local chart_areas3 = function()
  local surface = game.surfaces[1]
  local force = game.forces.player
  for k, entity in pairs (surface.find_entities_filtered{force = force, area = {{-500, -250},{500, 250}}}) do
    local position = entity.position
   -- force.chart(surface, {{position.x - 16, position.y - 16}, {position.x + 16, position.y + 16}})
  end
  force.chart(surface, {{red_worm3[1] - 25, red_worm3[2] - 25}, {red_worm3[1] + 25, red_worm3[2] + 25}})
end
local chart_tag3 = function()
  local surface = game.surfaces[1]
  local force = game.forces.player
  for k, entity in pairs (surface.find_entities_filtered{force = force, area = {{114.5, 466.5},{114.5, 466.5}}}) do
    local position = entity.position
   --force.add_chart_tag (surface, {position = {-833.5, 101.5}, icon = {type="item", name="radar"}, text = "control unit"})
   game.print(string.format("[gps=%s, %s]", position.x, position.y))  		
  end
end



local on_player_created = function(event)

  local player = game.players[1]

  player.force.enable_research()
  game.forces.player.disable_all_prototypes()
  game.forces.player.reset_technology_effects()
  --game.forces.player.reset()
  game.forces.player.research_queue_enabled = true
  
  
     ------------
  global.enemy_radar_1 = game.get_entity_by_tag("enemy_radar1")
  global.enemy_radar_2 = game.get_entity_by_tag("enemy_radar2")
  local radar_entities =
  {
    global.enemy_radar_1,
	global.enemy_radar_2

  }
  for index, entity in pairs(radar_entities) do
    entity.minable = false
    entity.destructible = false
  end
  global.intro_entities_radar = radar_entities
  
   ------------
  
 
  local technology_list = game.forces.player.technologies  
  -- equipment enabled
  technology_list["night-vision-equipment"].enabled = true
  technology_list["personal-laser-defense-equipment"].enabled = true
  technology_list["exoskeleton-equipment"].enabled = true
  technology_list["solar-panel-equipment"].enabled = true
  technology_list["energy-shield-equipment"].enabled = true
  technology_list["energy-shield-mk2-equipment"].enabled = true
  technology_list["battery-equipment"].enabled = true
  technology_list["modular-armor"].enabled = true
  technology_list["destroyer"].enabled = true
  technology_list["defender"].enabled = true
  technology_list["discharge-defense-equipment"].enabled = true
  technology_list["distractor"].enabled = true
  technology_list["belt-immunity-equipment"].enabled = true
  technology_list["power-armor"].enabled = true
  technology_list["power-armor-mk2"].enabled = true
  technology_list["battery-mk2-equipment"].enabled = true
  technology_list["personal-roboport-equipment"].enabled = false
  
  -- enabled
  technology_list["automation"].researched = true
  technology_list["stone-wall"].researched = true
  technology_list["gun-turret"].researched = true
  technology_list["optics"].researched = true
  technology_list["logistics"].researched = true
  technology_list["military"].researched = true
  technology_list["logistic-science-pack"].researched = true
  technology_list["steel-processing"].researched = true
  technology_list["electronics"].researched = true 
  technology_list["fast-inserter"].researched = true 
  technology_list["automation-2"].researched = true
  technology_list["electric-energy-distribution-1"].researched = true 
  technology_list["electric-energy-distribution-2"].enabled = true
  technology_list["engine"].researched = true 
  technology_list["fluid-handling"].researched = true 
  technology_list["oil-processing"].researched = true
  technology_list["heavy-armor"].enabled = true
  technology_list["steel-axe"].researched = true 
  technology_list["military-2"].researched = true
  technology_list["chemical-science-pack"].enabled = true
  technology_list["military-science-pack"].researched = true 
  technology_list["logistics-2"].enabled = true
  technology_list["advanced-material-processing"].researched = true
  technology_list["solar-energy"].researched = true
  technology_list["laser"].enabled = true
  technology_list["flamethrower"].enabled = true
  technology_list["flammables"].enabled = true
  technology_list["modules"].enabled = true
  technology_list["speed-module"].enabled = true
  technology_list["effectivity-module"].enabled = true
  technology_list["productivity-module"].enabled = true
  technology_list["speed-module-2"].enabled = true
  technology_list["effectivity-module-2"].enabled = true
  technology_list["productivity-module-2"].enabled = true
  technology_list["speed-module-3"].enabled = true
  technology_list["effectivity-module-3"].enabled = true
  technology_list["productivity-module-3"].enabled = true
  technology_list["sulfur-processing"].researched = true
  technology_list["toolbelt"].enabled = true
  technology_list["advanced-electronics"].enabled = true
  technology_list["advanced-electronics-2"].enabled = true
  technology_list["explosives"].enabled = true
  technology_list["land-mine"].enabled = true
  technology_list["electric-energy-accumulators"].enabled = true
  technology_list["laser-turret"].enabled = true
  technology_list["tank"].enabled = true
  technology_list["circuit-network"].enabled = true
  technology_list["military-3"].enabled = true
  technology_list["railway"].researched = true
  technology_list["automated-rail-transportation"].enabled = true
  technology_list["rail-signals"].enabled = true
  technology_list["automobilism"].researched = true
  technology_list["gate"].researched = true
  technology_list["rocketry"].enabled = true
  technology_list["battery"].enabled = true
  technology_list["plastics"].researched = true
  technology_list["fluid-wagon"].researched = true
  technology_list["stack-inserter"].enabled = true
  technology_list["explosive-rocketry"].enabled = true 
  technology_list["utility-science-pack"].enabled = true
  technology_list["military-4"].enabled = true
  technology_list["production-science-pack"].enabled = true
  technology_list["automation-3"].enabled = true  
  technology_list["advanced-material-processing-2"].enabled = true  
  technology_list["advanced-oil-processing"].enabled = true  
  technology_list["uranium-processing"].enabled = true
  technology_list["uranium-ammo"].enabled = true
  technology_list["lubricant"].enabled = true
  technology_list["rocket-fuel"].enabled = true 
  technology_list["kovarex-enrichment-process"].enabled = true 
  technology_list["electric-engine"].enabled = true  
  technology_list["low-density-structure"].enabled = false 
  technology_list["rocket-control-unit"].enabled = true
  technology_list["concrete"].enabled = true
  technology_list["robotics"].enabled = true
  technology_list["construction-robotics"].enabled = true
  technology_list["logistic-robotics"].enabled = true
  technology_list["nuclear-fuel-reprocessing"].enabled = true
  technology_list["logistics-3"].enabled = true
  technology_list["nuclear-power"].researched = true
  technology_list["logistic-system"].enabled = true
  --special

  
  --blocked tech
  technology_list["cliff-explosives"].enabled = false
  technology_list["landfill"].enabled = false
  technology_list["artillery"].enabled = false
  technology_list["atomic-bomb"].enabled = false
  technology_list["spidertron"].enabled = false
   
  
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
  technology_list["inserter-capacity-bonus-2"].researched = true
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
  technology_list["physical-projectile-damage-1"].researched = true
  technology_list["physical-projectile-damage-2"].enabled = true
  technology_list["physical-projectile-damage-3"].enabled = true
  technology_list["physical-projectile-damage-4"].enabled = true
  technology_list["physical-projectile-damage-5"].enabled = true
  technology_list["physical-projectile-damage-6"].enabled = true
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
  technology_list["mining-productivity-4"].enabled = false
  technology_list["weapon-shooting-speed-1"].researched = true
  technology_list["weapon-shooting-speed-2"].enabled = true
  technology_list["weapon-shooting-speed-3"].enabled = true
  technology_list["weapon-shooting-speed-4"].enabled = true
  technology_list["weapon-shooting-speed-5"].enabled = true
  technology_list["weapon-shooting-speed-6"].enabled = true
  technology_list["worker-robots-speed-1"].researched = true
  technology_list["worker-robots-speed-2"].enabled = true
  technology_list["worker-robots-speed-3"].enabled = true
  technology_list["worker-robots-speed-4"].enabled = true
  technology_list["worker-robots-speed-5"].enabled = true
  technology_list["worker-robots-storage-1"].researched = true
  technology_list["worker-robots-storage-2"].enabled = true
  technology_list["worker-robots-storage-3"].enabled = true
  technology_list["artillery-shell-range-1"].enabled = false
  technology_list["artillery-shell-speed-1"].enabled = false
  technology_list["follower-robot-count-1"].enabled = true
  technology_list["follower-robot-count-2"].enabled = true
  technology_list["follower-robot-count-3"].enabled = true
  technology_list["follower-robot-count-4"].enabled = true
  technology_list["follower-robot-count-5"].enabled = true
  technology_list["follower-robot-count-6"].enabled = true

  
  local recipe_list = player.force.recipes
  game.players[1].clear_recipe_notifications()
  recipe_list["heat-exchanger"].enabled = true
  recipe_list["heat-pipe"].enabled = true
  recipe_list["steam-turbine"].enabled = true
  recipe_list["nuclear-reactor"].enabled = false
  

  
end




local story_table =
{
  {
    {
      init = function()
	  global.radar = game.surfaces[1].find_entities_filtered{name = "roboport-remnants", limit = 1}[1]
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
                  zoom = 2 
				},
			  },
              start_position = global.radar.position,
              start_zoom = 2
            }
        end
        -- game.play_sound({path = "utility/game_won"})
      end
    },
	{
      init = function()
        global.radar = game.surfaces[1].find_entities_filtered{name = "roboport-remnants", limit = 1}[1]
		global.radar2 = game.surfaces[1].find_entities_filtered{area = {{134.5, 18.5}, {134.5, 18.5}}, name = "medium-electric-pole", limit = 1}[1]
		global.radar3 = game.surfaces[1].find_entities_filtered{name = "1x2-remnants", limit = 1}[1]
		global.radar4 = game.surfaces[1].find_entities_filtered{name = "electric-mining-drill-remnants", limit = 1}[1]
        if global.radar and global.radar2 and global.radar3 and global.radar4 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
                {
                  target = global.radar,
                  transition_time = 0,
                  time_to_wait = 0,
				  zoom = 1
                },
				{
                  target = global.radar,
                  transition_time = 100,
                  time_to_wait = 100,
				  zoom = 0.7
                },
				{
                  target = global.radar2,
                  transition_time = 400,
                  time_to_wait = 200,
                  zoom = 0.9
                },
				{
                  target = global.radar3,
                  transition_time = 0,
                  time_to_wait = 10,
                  zoom = 0.7
                },
				{
                  target = global.radar4,
                  transition_time = 300,
                  time_to_wait = 100,
                  zoom = 0.8
                },
				{
                  target = player.character,
                  transition_time = 300,
                  time_to_wait = 0,
                  zoom = 1
                },
              },
              start_position = global.radar.position,
			  --start_position = player.character.position,
              start_zoom = 1
            }
          end
        end
      end,
	  condition = story_elapsed_check(0.1),
    },
	{
	  
      action = function()
      local character = game.players[1]
		character.insert{name = "submachine-gun", count = 1}
		character.insert{name = "piercing-rounds-magazine", count = 20}
		character.insert{name = "iron-plate", count = 150}
		character.insert{name = "copper-plate", count = 100}
		character.insert{name = "steel-plate", count = 75}
        character.insert{name = "light-armor", count = 1}
		character.insert{name = "underground-belt", count = 12} 
		character.insert{name = "electric-mining-drill", count = 3}
		character.insert{name = "assembling-machine-2", count = 15} 
		character.insert{name = "gun-turret", count = 4} 
		character.insert{name = "solar-panel", count = 9} 
		character.insert{name = "lab", count = 4} 
		character.insert{name = "steel-furnace", count = 6} 
		character.insert{name = "iron-gear-wheel", count = 50} 
		character.insert{name = "medium-electric-pole", count = 22} 
		character.insert{name = "inserter", count = 20} 
		character.insert{name = "fast-inserter", count = 7} 
		character.insert{name = "small-lamp", count = 10}
		character.insert{name = "transport-belt", count = 50}
		character.insert{name = "logistic-chest-storage", count = 2}
      end
    },	
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
		    character.insert{name = "firearm-magazine", count = 200}
			character.insert{name = "piercing-rounds-magazine", count = 120}
			character.insert{name = "laser-turret", count = 10}
			character.insert{name = "gun-turret", count = 6}
			character.insert{name = "transport-belt", count = 325}
			character.insert{name = "iron-plate", count = 350}
			character.insert{name = "steel-furnace", count = 6} 
			character.insert{name = "inserter", count = 20} 
			character.insert{name = "copper-plate", count = 200}
			character.insert{name = "flamethrower-turret", count = 2}
			character.insert{name = "uranium-fuel-cell", count = 40}	
			character.insert{name = "electric-mining-drill", count = 6}	
            character.insert{name = "land-mine", count = 15}
			character.insert{name = "stone-wall", count = 100}
			
			game.forces.enemy.evolution_factor = .10
			game.map_settings.enemy_expansion.enabled = false
			
		elseif game.difficulty == defines.difficulty.normal then  
		    character.insert{name = "piercing-rounds-magazine", count = 48}
			character.insert{name = "laser-turret", count = 2} 
			character.insert{name = "flamethrower-turret", count = 1}
			character.insert{name = "land-mine", count = 10}
			character.insert{name = "stone-wall", count = 20}
			character.insert{name = "gun-turret", count = 2}
			
			game.forces.enemy.evolution_factor = .25
			game.map_settings.enemy_expansion.enabled = false
			
		elseif game.difficulty == defines.difficulty.hard then 
		
		    game.forces.enemy.evolution_factor = .39
			game.map_settings.enemy_expansion.enabled = true
			
        end
      end
    },
	-----------------------------
	-- /// RESSEARCH SCIENCE PACK  /// --
	-----------------------------
	-- MISSION FASE 1
	{
      condition = story_elapsed_check(1),
      action =
      function()
        set_goal("")
      end
	},
	{
      condition = story_elapsed_check(1),
      action =
      function()
	    game.show_message_dialog{text = {"msg-base-1"}}
		game.show_message_dialog{text = {"msg-base-2"}}
		game.show_message_dialog{text = {"msg-base-3"}}
      end
    },
	{
      condition = story_elapsed_check(1),
      action = function()
	    set_goal({"goal-science-pack"})
        global.something = 0
      end
    },
	{
      condition = story_elapsed_check(7),
      action =
      function()
	    game.show_message_dialog{text = {"msg-base-4"}}
		set_goal("")
      end
    },
	-- nuclear power plant is on fire
	{
      init = function()
        game.surfaces[1].create_entity({name='crash-site-fire-flame',position={x=150.5,y=152.5}})  
		game.surfaces[1].create_entity({name='crash-site-fire-flame',position={x=150.5,y=145.5}})  
 		game.surfaces[1].create_entity({name='crash-site-fire-flame',position={x=154.5,y=165.5}})  
		game.surfaces[1].create_entity({name='crash-site-fire-flame',position={x=168.5,y=157.5}})  	
		game.surfaces[1].create_entity({name='crash-site-fire-flame',position={x=168.5,y=145.5}}) 
		game.surfaces[1].create_entity({name='crash-site-fire-flame',position={x=175.5,y=164.5}}) 
		game.surfaces[1].create_entity({name='crash-site-explosion-smoke',position={x=150.5,y=152.5}})  
		game.surfaces[1].create_entity({name='crash-site-explosion-smoke',position={x=150.5,y=145.5}})  
 		game.surfaces[1].create_entity({name='crash-site-explosion-smoke',position={x=154.5,y=165.5}})  
		game.surfaces[1].create_entity({name='crash-site-explosion-smoke',position={x=168.5,y=157.5}})  	
		game.surfaces[1].create_entity({name='crash-site-explosion-smoke',position={x=168.5,y=145.5}}) 
		game.surfaces[1].create_entity({name='crash-site-explosion-smoke',position={x=175.5,y=164.5}}) 
		game.surfaces[1].create_entity({name='crash-site-fire-smoke',position={x=150.5,y=152.5}})  
		game.surfaces[1].create_entity({name='crash-site-fire-smoke',position={x=150.5,y=145.5}})  
 		game.surfaces[1].create_entity({name='crash-site-fire-smoke',position={x=154.5,y=165.5}})  
		game.surfaces[1].create_entity({name='crash-site-fire-smoke',position={x=168.5,y=157.5}})  	
		game.surfaces[1].create_entity({name='crash-site-fire-smoke',position={x=168.5,y=145.5}}) 
		game.surfaces[1].create_entity({name='crash-site-fire-smoke',position={x=175.5,y=164.5}}) 
      end 
    },
	{
      init = function()
        game.surfaces[1].create_entity({name='crash-site-fire-flame',position={x=152.5,y=152.5}})  
		game.surfaces[1].create_entity({name='crash-site-fire-flame',position={x=152.5,y=145.5}})  
 		game.surfaces[1].create_entity({name='crash-site-fire-flame',position={x=156.5,y=165.5}})  
		game.surfaces[1].create_entity({name='crash-site-fire-flame',position={x=170.5,y=157.5}})  	
		game.surfaces[1].create_entity({name='crash-site-fire-flame',position={x=170.5,y=145.5}}) 
		game.surfaces[1].create_entity({name='crash-site-fire-flame',position={x=177.5,y=164.5}}) 
		game.surfaces[1].create_entity({name='crash-site-explosion-smoke',position={x=150.5,y=154.5}})  
		game.surfaces[1].create_entity({name='crash-site-explosion-smoke',position={x=150.5,y=147.5}})  
 		game.surfaces[1].create_entity({name='crash-site-explosion-smoke',position={x=154.5,y=167.5}})  
		game.surfaces[1].create_entity({name='crash-site-explosion-smoke',position={x=168.5,y=159.5}})  	
		game.surfaces[1].create_entity({name='crash-site-explosion-smoke',position={x=168.5,y=147.5}}) 
		game.surfaces[1].create_entity({name='crash-site-explosion-smoke',position={x=175.5,y=167.5}}) 
		game.surfaces[1].create_entity({name='crash-site-fire-smoke',position={x=151.5,y=151.5}})  
		game.surfaces[1].create_entity({name='crash-site-fire-smoke',position={x=151.5,y=149.5}})  
 		game.surfaces[1].create_entity({name='crash-site-fire-smoke',position={x=155.5,y=169.5}})  
		game.surfaces[1].create_entity({name='crash-site-fire-smoke',position={x=169.5,y=159.5}})  	
		game.surfaces[1].create_entity({name='crash-site-fire-smoke',position={x=169.5,y=146.5}}) 
		game.surfaces[1].create_entity({name='crash-site-fire-smoke',position={x=176.5,y=165.5}}) 
      end 
    },
    {
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
        global.radar = game.surfaces[1].find_entities_filtered{name = "nuclear-reactor", limit = 1}[1]
        if global.radar then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
                {
                  target = global.radar,
                  transition_time = 100,
                  time_to_wait = 50,
				  zoom = 0.85
                },
				{
                  target = global.radar,
                  transition_time = 200,
                  time_to_wait = 200,
				  zoom = 1.2
                },
				{
                  target = global.radar,
                  transition_time = 70,
                  time_to_wait = 10,
				  zoom = 1
                },
				{
                  target = player.character,
                  transition_time = 100,
                  time_to_wait = 0,
                  zoom = 1
                },
              },
			  start_position = player.character.position,
              start_zoom = 1
            }
          end
        end
      end,
	  condition = story_elapsed_check(2),
    },
	{
      condition = story_elapsed_check(1),
	},  
	{
      init = function()
		game.players[1].character.destructible = true
      end
    },
	{
      condition = story_elapsed_check(1),
      action =
      function()
        set_goal({"goal-science-pack2"})
      end
	},
	{
      condition = story_elapsed_check(20),
      action =
      function()
         think("msg3")
      end
    },
	{
      condition = story_elapsed_check(5),
      action =
      function()
         think("msg4")
      end
    },
	{
      condition = story_elapsed_check(5),
      action =
      function()
        set_goal({"goal-science-pack4"})
      end
	},
	{
      condition = story_elapsed_check(6),
	},
	{
      action =
      function()
        if game.difficulty == defines.difficulty.easy then
		  story_show_message_dialog{text={"msg-base-hint1"}, image = "logistic1.png"}
		  story_show_message_dialog{text={"msg-base-hint2"}, image = "logistic2.png"}
		  story_show_message_dialog{text={"msg-base-hint3"}, image = "logistic3.png"}
		elseif game.difficulty == defines.difficulty.normal then  
		  story_show_message_dialog{text={"msg-base-hint1"}, image = "logistic1.png"}
		  story_show_message_dialog{text={"msg-base-hint2"}, image = "logistic2.png"}
		  story_show_message_dialog{text={"msg-base-hint3"}, image = "logistic3.png"}
		elseif game.difficulty == defines.difficulty.hard then  
		    game.forces.enemy.evolution_factor = .46
        end
      end
    },
    {
      init = function()
	    set_goal({"goal-science-pack3",0,8})
        global.builds = 0
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
		   event.entity.force.name == "player" and
           event.entity.name == "roboport" then
           game.set_game_state({game_finished=true, player_won=false, can_continue=false})
        elseif event.name == defines.events.on_built_entity and event.created_entity.name == 'logistic-chest-passive-provider' or 
			   event.name == defines.events.on_robot_built_entity and event.created_entity.name == 'logistic-chest-passive-provider' then
          global.builds = global.builds + 1
          set_goal({"goal-science-pack3",global.builds,8})
        end
      end,
      condition = function(event)
        return global.builds >= 8
      end
	},
	{
	  condition = story_elapsed_check(3),
    },
	{
      action = function()
	    set_goal("")	
		game.show_message_dialog{text = {"msg-base-bot-1"}}
      end
    },
	---------------------------------
	-- /// BONUS - SAVE BOTS 1  /// --
	---------------------------------
	{
	 init = function()
        game.surfaces[1].create_entity({name='small-worm-turret', force='worms', position={x=-244.5,y=357.5}})  
		game.surfaces[1].create_entity({name='small-worm-turret', force='worms', position={x=-236.5,y=358.5}})  
		game.surfaces[1].create_entity({name='small-worm-turret', force='worms', position={x=-237.5,y=360.5}})  
		game.surfaces[1].create_entity({name='small-worm-turret', force='worms', position={x=-235.5,y=363.5}})  
		game.surfaces[1].create_entity({name='small-worm-turret', force='worms', position={x=-227.5,y=370.5}})  
		game.surfaces[1].create_entity({name='small-worm-turret', force='worms', position={x=-224.5,y=374.5}})  
		game.surfaces[1].create_entity({name='small-worm-turret', force='worms', position={x=-227.5,y=377.5}})  
		game.surfaces[1].create_entity({name='small-worm-turret', force='worms', position={x=-223.5,y=378.5}})  
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-267.5,y=400.5}})		
      end,
	},
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
        global.radar_worm1 = game.surfaces[1].find_entities_filtered{area = {{-237.5, 360.5}, {-237.5, 360.5}}, name = "small-worm-turret", limit = 1}[1]
        if global.radar_worm1 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {

				{
                  target = global.radar_worm1,
                  transition_time = 200,
                  time_to_wait = 50,
				  zoom = 0.9
                },
				{
                  target = global.radar_worm1,
                  transition_time = 100,
                  time_to_wait = 300,
				  zoom = 0.6
                },
				{
                  target = player.character,
                  transition_time = 100,
                  time_to_wait = 0,
                  zoom = 1
                },
              },
			  start_position = player.character.position,
              --start_zoom = 1
            }
          end
        end
      end,
	  condition = story_elapsed_check(2),
    },
	{
	  condition = story_elapsed_check(2),
	},
	{
      init = function()
		game.players[1].character.destructible = true
      end
    },
	{
      init = function()
		chart_areas1()
		chart_tag1()
      end
    },
	{
      action = function()
	    set_goal({"goal-save-robot-1",0,8})
        global.units_killed = 0
      end
    },
    {
      init = function()
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "small-worm-turret" and
		   event.entity.force.name == "worms" then
          global.units_killed = global.units_killed + 1
		  set_goal({"goal-save-robot-1",global.units_killed,8})
		elseif 
			event.name == defines.events.on_entity_died and
			event.entity.force.name == "player" and
			event.entity.name == "roboport" then
			game.set_game_state({game_finished=true, player_won=false, can_continue=false})
        end
      end,
      condition = function() return global.units_killed >= 8 end,
      action = function()
        set_goal("")
      end
    },
	-- create 20 logibots
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-281.5,y=382.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-281.5,y=382.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-281.5,y=382.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-281.5,y=382.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-281.5,y=382.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-281.5,y=382.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-281.5,y=382.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-281.5,y=382.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-281.5,y=382.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-281.5,y=382.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-281.5,y=382.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-281.5,y=382.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-281.5,y=382.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-281.5,y=382.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-281.5,y=382.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-281.5,y=382.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-281.5,y=382.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-281.5,y=382.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-281.5,y=382.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=-281.5,y=382.5}})		
      end
    },
	{
	  condition = story_elapsed_check(5),
    },
	{
      action = function()
	    set_goal("")	
		game.show_message_dialog{text = {"msg-base-bot-2"}}
      end
    },
	{
      condition = story_elapsed_check(1),
      action = function()
	    set_goal({"goal-science-pack2"})
      end
    },
	
    {
      init = function()
      end,
      update = function(event)
        if 	event.name == defines.events.on_entity_died and
			event.entity.force.name == "player" and
			event.entity.name == "roboport" then
			game.set_game_state({game_finished=true, player_won=false, can_continue=false})
		elseif event.name == defines.events.on_built_entity and event.created_entity.name == "chemical-science-pack" then
           event.created_entity.energy = 1  
        end
      end,
      condition = function() return game.players[1].force.technologies["chemical-science-pack"].researched end,
      action = function()
        set_goal("")
      end
	},
	---------------------------------
	-- /// RESSEARCH ROBOTICS  /// --
	---------------------------------
	{
      condition = story_elapsed_check(1),
      action =
      function()
	    game.show_message_dialog{text = {"msg-base-7"}}
      end
    },	
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
			game.forces.enemy.evolution_factor = .12
		elseif game.difficulty == defines.difficulty.normal then  
			game.forces.enemy.evolution_factor = .30
		elseif game.difficulty == defines.difficulty.hard then  
		    game.forces.enemy.evolution_factor = .55
        end
      end
    },
	{
      condition = story_elapsed_check(1),
      action = function()
	    set_goal({"goal-research-robotics"})
        global.something = 0
      end
    },
	{
      condition = story_elapsed_check(5),
	},
	{
      action =
      function()
         think("msg5")
      end
    },
	{
      condition = story_elapsed_check(3),
      action = function()
	    set_goal({"goal-research-robotics3"})
        global.something = 0
      end
    },
	{
      condition = story_elapsed_check(6),
	},
	{
      action = function()
		game.show_message_dialog{text = {"msg-base-1.1"}}
      end
    },
	{
      init = function()
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-138,y=81}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-138,y=82}})
        game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-138,y=83}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-138,y=84}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-137,y=81}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-136,y=81}})
        game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-139,y=81}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-140,y=81}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=138,y=71}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=138,y=72}})
        game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=138,y=73}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=138,y=74}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=137,y=81}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=136,y=81}})
        game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=139,y=81}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=140,y=81}})
      end
	},
	{
      init = function()
	    local roboports = game.players[1].surface.find_entities_filtered({name='roboport', force='player'})
        game.players[1].surface.set_multi_command

        {
          command =
          {
            type=defines.command.attack,
            target=roboports[math.random(1,#roboports)],
            distraction=defines.distraction.by_enemy
          },
          unit_count = 50
        }
      end
	},
	{
      condition = story_elapsed_check(2),
	},
	{
      init = function()
	    set_goal({"goal-research-robotics2",0,4})
        global.builds = 0
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
		   event.entity.force.name == "player" and
           event.entity.name == "roboport" then
           game.set_game_state({game_finished=true, player_won=false, can_continue=false})
        elseif event.name == defines.events.on_entity_died and event.entity.name == 'lab' then
               global.builds = global.builds - 1
               set_goal({"goal-research-robotics2",global.builds,4},true)
        elseif event.name == defines.events.on_built_entity and event.created_entity.name == 'lab' or
		       event.name == defines.events.on_robot_built_entity and event.created_entity.name == 'lab' then
               global.builds = global.builds + 1
               set_goal({"goal-research-robotics2",global.builds,4})
        --elseif event.name == defines.events.on_player_mined_entity and event.entity.name =='lab' then
              -- global.builds = global.builds - 1
               --set_goal({"goal-research-robotics2",global.builds,4},true)
        end
      end,
      condition = function(event)
        return global.builds >= 4
      end
	},
	{
	  condition = story_elapsed_check(3),
    },
	{
      action = function()
	    set_goal("")	
		game.show_message_dialog{text = {"msg-base-bot-3"}}
      end
    },
	---------------------------------
	-- /// BONUS - SAVE BOTS 2  /// --
	---------------------------------
	{
	 init = function()
        game.surfaces[1].create_entity({name='medium-worm-turret', force='worms', position={x=339.5,y=182.5}})  
		game.surfaces[1].create_entity({name='medium-worm-turret', force='worms', position={x=338.5,y=188.5}})  
		game.surfaces[1].create_entity({name='medium-worm-turret', force='worms', position={x=341.5,y=195.5}})  
		game.surfaces[1].create_entity({name='medium-worm-turret', force='worms', position={x=346.5,y=197.5}})  
		game.surfaces[1].create_entity({name='medium-worm-turret', force='worms', position={x=350,y=162.5}})  
		game.surfaces[1].create_entity({name='medium-worm-turret', force='worms', position={x=334.5,y=161.5}})   
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})		
      end,
	},
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
        global.radar_worm2 = game.surfaces[1].find_entities_filtered{area = {{339.5, 182.5}, {339.5, 182.5}}, name = "medium-worm-turret", limit = 1}[1]
        if global.radar_worm2 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {

				{
                  target = global.radar_worm2,
                  transition_time = 200,
                  time_to_wait = 50,
				  zoom = 0.9
                },
				{
                  target = global.radar_worm2,
                  transition_time = 100,
                  time_to_wait = 300,
				  zoom = 0.6
                },
				{
                  target = player.character,
                  transition_time = 100,
                  time_to_wait = 0,
                  zoom = 1
                },
              },
			  start_position = player.character.position,
              --start_zoom = 1
            }
          end
        end
      end,
	  condition = story_elapsed_check(2),
    },
	{
	  condition = story_elapsed_check(1),
    },
	{
      init = function()
		game.players[1].character.destructible = true
      end
    },
	{
      init = function()
		chart_areas2()
		chart_tag2()
      end
    },
	{
      action = function()
	    set_goal({"goal-save-robot-2",0,6})
        global.units_killed = 0
      end
    },
    {
      init = function()
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "medium-worm-turret" and
		   event.entity.force.name == "worms"then
          global.units_killed = global.units_killed + 1
		  set_goal({"goal-save-robot-2",global.units_killed,6})
		elseif 
			event.name == defines.events.on_entity_died and
			event.entity.force.name == "player" and
			event.entity.name == "roboport" then
			game.set_game_state({game_finished=true, player_won=false, can_continue=false})
        end
      end,
      condition = function() return global.units_killed >= 6 end,
      action = function()
        set_goal("")
      end
    },
	-- 30 logibots
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
		{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
		{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=386.5,y=191.5}})			
      end
    },
	{
	  condition = story_elapsed_check(5),
    },
	{
      action = function()
	    set_goal("")	
		game.show_message_dialog{text = {"msg-base-bot-4"}}
      end
    },
	{
	  condition = story_elapsed_check(2),
    },
	{
      action = function()
	    set_goal("")	
		game.show_message_dialog{text = {"msg-base-bot-5"}}
      end
    },
	
	---------------------------------
	-- /// BONUS - SAVE BOTS 3  /// --
	---------------------------------
	{
	 init = function()
        game.surfaces[1].create_entity({name='big-worm-turret', force='worms', position={x=121.5,y=455.5}})  
		game.surfaces[1].create_entity({name='big-worm-turret', force='worms', position={x=114.5,y=466.5}})  
		game.surfaces[1].create_entity({name='big-worm-turret', force='worms', position={x=130.5,y=464.5}})    
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=520.5}})		
      end,
	},
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
        global.radar_worm3 = game.surfaces[1].find_entities_filtered{area = {{114.5, 466.5}, {114.5, 466.5}}, name = "big-worm-turret", limit = 1}[1]
        if global.radar_worm3 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {

				{
                  target = global.radar_worm3,
                  transition_time = 200,
                  time_to_wait = 50,
				  zoom = 0.8
                },
				{
                  target = global.radar_worm3,
                  transition_time = 100,
                  time_to_wait = 300,
				  zoom = 0.4
                },
				{
                  target = player.character,
                  transition_time = 100,
                  time_to_wait = 0,
                  zoom = 1
                },
              },
			  start_position = player.character.position,
              --start_zoom = 1
            }
          end
        end
      end,
	  condition = story_elapsed_check(2),
    },
	{
	  condition = story_elapsed_check(2),
    },
	{
      init = function()
		chart_areas3()
		chart_tag3()
      end
    },
	{
      init = function()
		game.players[1].character.destructible = true
      end
    },
	{
      action = function()
	    set_goal({"goal-save-robot-3",0,3})
        global.units_killed = 0
      end
    },
    {
      init = function()
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "big-worm-turret" and
		   event.entity.force.name == "worms" then
          global.units_killed = global.units_killed + 1
		  set_goal({"goal-save-robot-3",global.units_killed,3})
		elseif 
			event.name == defines.events.on_entity_died and
			event.entity.force.name == "player" and
			event.entity.name == "roboport" then
			game.set_game_state({game_finished=true, player_won=false, can_continue=false})
        end
      end,
      condition = function() return global.units_killed >= 3 end,
      action = function()
        set_goal("")
      end
    },
	-- 50 logibots
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='logistic-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='construction-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='construction-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='construction-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='construction-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='construction-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='construction-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='construction-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='construction-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='construction-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='construction-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{ 
	  condition = story_elapsed_check(0.5),
      init = function() 
        game.surfaces[1].create_entity({name='construction-robot', force='player', position={x=125.5,y=498.5}})		
      end
    },
	{
      action = function()
	    set_goal("")	
		game.show_message_dialog{text = {"msg-base-bot-6"}}
      end
    },
	{
      condition = story_elapsed_check(1),
      action = function()
	    set_goal({"goal-research-robotics"})
        global.something = 0
      end
    },
    {
      init = function()
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
		   event.entity.force.name == "player" and
           event.entity.name == "roboport" then
           game.set_game_state({game_finished=true, player_won=false, can_continue=false})
		elseif event.name == defines.events.on_built_entity and event.created_entity.name == "robotics" then
           event.created_entity.energy = 1  
        end
      end,
      condition = function() return game.players[1].force.technologies["robotics"].researched end,
      action = function()
        set_goal("")
      end
	},	
	-----------------------------------------------------------------------
	-- /// CHOSSE TO ATTACK ON RADARS --OR-- RESSARCH DENSITY STRUCTURE  /// --
	-----------------------------------------------------------------------
	-- MISSION FASE 2
	{
      condition = story_elapsed_check(1),
      action =
      function()
        set_goal("")
		game.players[1].force.technologies["low-density-structure"].enabled = true
      end
	},
		{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
			game.forces.enemy.evolution_factor = .15
		elseif game.difficulty == defines.difficulty.normal then  
			game.forces.enemy.evolution_factor = .38
		elseif game.difficulty == defines.difficulty.hard then  
		    game.forces.enemy.evolution_factor = .69
        end
      end
    },
	{
      action = function()
        set_goal("")
		for index, entity in pairs(global.intro_entities_radar) do
        entity.minable = true
		entity.destructible = true
        end
	  end
    },
	{
      condition = story_elapsed_check(1),
      action =
      function()
	    game.show_message_dialog{text = {"msg-base-5"}}
		game.show_message_dialog{text = {"msg-base-6"}}
      end
    },
	{
	  condition = story_elapsed_check(2),
      action =
      function()
         think("msg1")
      end
    },
	{
	  condition = story_elapsed_check(5),
      action =
      function()
         think("msg2")
      end
    },	
	{
      condition = story_elapsed_check(4),
      action = function()
	    set_goal({"goal-research-density"})
      end
    },
	{
      condition = story_elapsed_check(10),
	},
	{
      action = function()
		game.show_message_dialog{text = {"msg-base-1.1"}}
      end
    },
	{
      init = function()
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-138,y=81}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-138,y=82}})
        game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-138,y=83}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=-138,y=84}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-137,y=81}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-136,y=81}})
        game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-139,y=81}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=-140,y=81}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=138,y=71}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=138,y=72}})
        game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=138,y=73}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=138,y=74}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=137,y=81}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=136,y=81}})
        game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=139,y=81}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=140,y=81}})
      end
	},
	{
      init = function()
	    local roboports = game.players[1].surface.find_entities_filtered({name='roboport', force='player'})
        game.players[1].surface.set_multi_command

        {
          command =
          {
            type=defines.command.attack,
            target=roboports[math.random(1,#roboports)],
            distraction=defines.distraction.by_enemy
          },
          unit_count = 100
        }
      end
	},
    {
      init = function()
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "radar" and
		   event.entity.force.name == "enemy" then
		   game.show_message_dialog{text = {"msg-base-9"}}
           game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-07")}) -- YOU WIN THE GAME IF YOU DESTROY ENEMY RADAR
		elseif event.name == defines.events.on_built_entity and event.created_entity.name == "low-density-structure" then -- OR RESSEARCH DENSITY STRUCTURE TO CONTINUE IN PEACEFUL GAME
           event.created_entity.energy = 1  
        end
      end,
      condition = function() return game.players[1].force.technologies["low-density-structure"].researched end,
      action = function()
        set_goal("")
      end
	},
    ---------------------------------
	-- /// COLLECT RESSOURCES  /// --
	---------------------------------
	-- MISSION FASE 3
	{
      condition = story_elapsed_check(1),
      action =
      function()
		game.show_message_dialog{text = {"msg-base-8"}}
      end
    },
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
			game.forces.enemy.evolution_factor = .15
			game.map_settings.enemy_expansion.enabled = false
		elseif game.difficulty == defines.difficulty.normal then  
			game.forces.enemy.evolution_factor = .50
			game.map_settings.enemy_expansion.enabled = true
		elseif game.difficulty == defines.difficulty.hard then  
		    game.forces.enemy.evolution_factor = .80
			game.map_settings.enemy_expansion.enabled = true
        end
      end
    },	
	{ 
	  condition = story_elapsed_check(3),
    },
	{
      init = function()
	    local roboports = game.players[1].surface.find_entities_filtered({name='roboport', force='player'})
        game.players[1].surface.set_multi_command

        {
          command =
          {
            type=defines.command.attack,
            target=roboports[math.random(1,#roboports)],
            distraction=defines.distraction.by_enemy
          },
          unit_count = 120
        }
      end
	},
	{
      condition = story_elapsed_check(1),
	  update = (function()
        local only_update = false
        return function(event)
		  local mainchest = game.get_entity_by_tag("mainchest")
          local resources1 = mainchest.get_item_count("steel-plate") 
		  local resources2 = mainchest.get_item_count("flamethrower-ammo") 
		  local resources3 = mainchest.get_item_count("electric-engine-unit") 
		  local resources4 = mainchest.get_item_count("low-density-structure") 
          set_goal
          (
            {
              "goal-resources",
              resources1,
			  1000,
              resources2,
              500,
			  resources3,
              300,
			  resources4,
              80
            },

            only_update
          )
          only_update = true
        end
      end)(),
      condition = function()
	    local mainchest = game.get_entity_by_tag("mainchest")
        return 
              mainchest.get_item_count("steel-plate") >= 1000 and 
			  mainchest.get_item_count("flamethrower-ammo") >= 500 and 
			  mainchest.get_item_count("electric-engine-unit") >= 300 and 
			  mainchest.get_item_count("low-density-structure") >= 80
      end,
      action = function()
        set_goal("")
      end
    },
	{
      condition = story_elapsed_check(3),
      action =
      function()
		game.show_message_dialog{text = {"msg-base-9"}} -- YOU WIN
      end
    },
	{ 
	  condition = story_elapsed_check(2),
    },
	{
      action =
      function()
        if game.difficulty == defines.difficulty.easy then
			game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-07")}) -- YOU WIN THE GAME
		elseif game.difficulty == defines.difficulty.normal then  
			game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-07")}) -- YOU WIN THE GAME
		elseif game.difficulty == defines.difficulty.hard then  
		    game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-07")}) -- YOU WIN THE GAME
        end
      end
    },	
  }
}

story_init_helpers(story_table)


script.on_init(function()
  
end)


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
  defines.events.on_player_died,
  defines.events.on_robot_built_entity,
  defines.events.on_gui_click
} 
 
local function on_configuration_changed()
	game.reload_script()
end
 
 -- tahle funkce je k ho***
function check_research_hints()
  if game.players[1] == nil then
    return
  end
  if global.research_hint == nil and game.players[1].force.current_research ~= nil then
    global.research_hint = true
  end
end



 script.on_event(story_events, function(event)
   if game.players[1].character then
     check_for_player_death(event)
     story_update(global.story, event)
   end
end)

script.on_event(defines.events.on_player_created, function(event)
  on_player_created(event)
end)


script.on_event(defines.events.on_player_crafted_item, check_automate_science_packs_advice)
script.on_event(defines.events.on_gui_click, intro_screen.on_gui_click)
script.on_init(on_configuration_changed)
script.on_configuration_changed(on_configuration_changed)
