require "util"
local intro_screen = require("intro_screen")
require "story"


local think = function(thought)
  game.players[1].print({"","[img=entity/character][color=orange]",{"engineer-title"},": [/color]",{"think-"..thought}})
end

local msg = function(msg)
  game.players[1].print({"","[img=entity/radar][color=red]",{"computer-title"},": [/color]",{"msg-"..msg}})
end

function check_for_player_death(event)
	if  event.name == defines.events.on_player_died or event.name == defines.events.on_entity_died and
           event.entity.name == "spidertron" then
		game.set_game_state({game_finished=true, player_won=false, can_continue=false})
	end
  end

local function on_configuration_changed()
	game.reload_script()
end

local on_player_created = function(event)

  local player = game.players[1]

  player.force.enable_research()
  game.forces.player.disable_all_prototypes()
  game.forces.player.reset_technology_effects()
  --game.forces.player.reset()
  game.forces.player.research_queue_enabled = true


  
  
  ------------ Invincible Entities
  global.boil_1 = game.get_entity_by_tag("boiler1")
  global.boil_2 = game.get_entity_by_tag("boiler2")

  local base1_entities =
  {
	global.boil_1,
	global.boil_2
  }
  for index, entity in pairs(base1_entities) do
    entity.minable = false
    entity.destructible = false
  end
  global.intro_entities_base1 = base1_entities   
	 
  ------------
  global.centrifuge_1 = game.get_entity_by_tag("centrifuge1")
  global.boil_3 = game.get_entity_by_tag("boiler3")
  global.boil_4 = game.get_entity_by_tag("boiler4")

  local base2_entities =
  {
    global.centrifuge_1,
	global.boil_3,
	global.boil_4
  }
  for index, entity in pairs(base2_entities) do
    entity.minable = false
    entity.destructible = false
  end
  global.intro_entities_base2 = base2_entities
     
	 
  ------------
  
  global.reactor_dune = game.get_entity_by_tag("reactor1")
  global.boil_5 = game.get_entity_by_tag("boiler5")
  global.boil_6 = game.get_entity_by_tag("boiler6")
  global.boil_7 = game.get_entity_by_tag("boiler7")
  global.boil_8 = game.get_entity_by_tag("boiler8")
  global.boil_9 = game.get_entity_by_tag("boiler9")
  global.boil_10 = game.get_entity_by_tag("boiler10")

  local base3_entities =
  {
    global.reactor_dune,
	global.boil_5,
	global.boil_6,
	global.boil_7,
	global.boil_8,
	global.boil_9,
	global.boil_10,
  }
  for index, entity in pairs(base3_entities) do
    entity.minable = false
    entity.destructible = false
  end
  global.intro_entities_base3 = base3_entities
     
	 
  ------------
  
  -- tech tree: 
  local technology_list = game.forces.player.technologies  
  -- equipment enabled
  technology_list["modular-armor"].enabled = true
  technology_list["night-vision-equipment"].enabled = true
  technology_list["belt-immunity-equipment"].enabled = true
  technology_list["solar-panel-equipment"].enabled = true
  technology_list["battery-equipment"].enabled = true
  
  -- technology_list["power-armor"].enabled = true
  -- technology_list["personal-laser-defense-equipment"].enabled = true
  -- technology_list["exoskeleton-equipment"].enabled = true
  -- technology_list["energy-shield-equipment"].enabled = true
  technology_list["discharge-defense-equipment"].researched = true

  -- technology_list["power-armor-mk2"].enabled = true
  -- technology_list["battery-mk2-equipment"].enabled = true
  -- technology_list["energy-shield-mk2-equipment"].enabled = true

  
  --technology_list["distractor"].enabled = true
  --technology_list["destroyer"].enabled = true
  --technology_list["defender"].enabled = true

  -- enabled
  -- red science
  technology_list["automation"].researched = true
  technology_list["stone-wall"].enabled = true
  technology_list["gun-turret"].researched = true
  technology_list["optics"].enabled = true
  technology_list["logistics"].researched = true
  technology_list["military"].researched = true
  technology_list["logistic-science-pack"].enabled = true
  technology_list["steel-processing"].researched = true
  technology_list["electronics"].researched = true 
  technology_list["heavy-armor"].enabled = true
  technology_list["steel-axe"].researched = true 
  technology_list["toolbelt"].researched = true  

  --green science
  technology_list["fast-inserter"].enabled = true 
  technology_list["automation-2"].enabled = true
  technology_list["electric-energy-distribution-1"].enabled = true  
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
  technology_list["railway"].enabled = true
  technology_list["automated-rail-transportation"].enabled = true
  technology_list["rail-signals"].enabled = true
  technology_list["automobilism"].researched = true
  technology_list["gate"].enabled = true
  technology_list["battery"].researched = true
  technology_list["plastics"].researched = true
  technology_list["fluid-wagon"].enabled = true
  technology_list["stack-inserter"].enabled = true
  technology_list["concrete"].enabled = true
  
  --grey science
  -- technology_list["military-science-pack"].enabled = true
  -- technology_list["flamethrower"].enabled = true
  -- technology_list["flammables"].enabled = true
  -- technology_list["land-mine"].enabled = true
  -- technology_list["rocketry"].enabled = true
  
  --blue science
  -- technology_list["chemical-science-pack"].enabled = true
  -- technology_list["laser"].enabled = true
  -- technology_list["speed-module-2"].enabled = true
  -- technology_list["effectivity-module-2"].enabled = true
  -- technology_list["productivity-module-2"].enabled = true
  -- technology_list["laser-turret"].enabled = true
  -- technology_list["tank"].enabled = true
  -- technology_list["explosive-rocketry"].enabled = true 
  -- technology_list["military-3"].enabled = true
  -- technology_list["advanced-material-processing-2"].enabled = true  
  -- technology_list["advanced-oil-processing"].enabled = true 
  -- technology_list["lubricant"].enabled = true
  -- technology_list["rocket-fuel"].enabled = true 
  -- technology_list["electric-engine"].enabled = true  
  -- technology_list["low-density-structure"].enabled = true  
  -- technology_list["robotics"].enabled = true
  -- technology_list["construction-robotics"].enabled = true
  -- technology_list["logistic-robotics"].enabled = true
  -- technology_list["uranium-processing"].enabled = true
  -- technology_list["nuclear-power"].enabled = true
  -- technology_list["advanced-electronics-2"].enabled = true
  -- technology_list["electric-energy-distribution-2"].enabled = true 

  --purple science
  -- technology_list["production-science-pack"].enabled = true
  -- technology_list["automation-3"].enabled = true
  -- technology_list["logistics-3"].enabled = true
  -- technology_list["effect-transmission"].enabled = true
  -- technology_list["nuclear-fuel-reprocessing"].enabled = true
  -- technology_list["kovarex-enrichment-process"].enabled = true 
  -- technology_list["coal-liquefaction"].enabled = true
  -- technology_list["speed-module-3"].enabled = true
  -- technology_list["effectivity-module-3"].enabled = true
  -- technology_list["productivity-module-3"].enabled = true
  
  --yellow science
  -- technology_list["military-4"].enabled = true
  -- technology_list["utility-science-pack"].enabled = true
  -- technology_list["uranium-ammo"].enabled = true 
  -- technology_list["rocket-control-unit"].enabled = true
  -- technology_list["logistic-system"].enabled = true
  -- technology_list["atomic-bomb"].enabled = true

  
  --special
  -- technology_list["spidertron"].enabled = true
  -- technology_list["artillery"].enabled = true
  -- technology_list["fusion-reactor-equipment"].enabled = true  
  
  --blocked tech
  technology_list["cliff-explosives"].enabled = false
  technology_list["landfill"].enabled = false
  technology_list["space-science-pack"].enabled = false 
  technology_list["rocket-silo"].enabled = false 
  technology_list["personal-roboport-mk2-equipment"].enabled = false
   
  
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
  technology_list["inserter-capacity-bonus-1"].enabled = true
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
  technology_list["research-speed-1"].researched = true
  technology_list["research-speed-2"].enabled = true
  technology_list["research-speed-3"].enabled = true
  technology_list["research-speed-4"].enabled = true
  technology_list["research-speed-5"].enabled = true
  technology_list["research-speed-6"].enabled = true
  technology_list["mining-productivity-1"].enabled = true
  technology_list["mining-productivity-2"].enabled = true
  technology_list["mining-productivity-3"].enabled = true
  technology_list["mining-productivity-4"].enabled = false -- white science pack
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
  technology_list["worker-robots-speed-6"].enabled = false
  technology_list["worker-robots-storage-1"].enabled = true
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
  
end

local story_table =
{
  {
    {
      init = function()
	  global.radar = game.surfaces[1].find_entities_filtered{name = "car", limit = 1}[1]
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
	  
      action = function()
      local character = game.players[1]
		character.insert{name = "pistol", count = 1}
		character.insert{name = "shotgun", count = 1}
		character.insert{name = "shotgun-shell", count = 12}
		character.insert{name = "piercing-rounds-magazine", count = 3}
		character.insert{name = "copper-plate", count = 40}
		character.insert{name = "underground-belt", count = 12} 
		character.insert{name = "inserter", count = 30} 
		character.insert{name = "pipe", count = 10}
		character.insert{name = "transport-belt", count = 70}
      end
    },

	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
		    character.insert{name = "piercing-rounds-magazine", count = 137}
			character.insert{name = "shotgun-shell", count = 22}
			character.insert{name = "power-armor", count = 1} 
			character.insert{name = "energy-shield-equipment", count = 2}
			character.insert{name = "battery-mk2-equipment", count = 2}	
            character.insert{name = "solar-panel-equipment", count = 8}
			
			game.forces.enemy.evolution_factor = 0
			game.map_settings.enemy_expansion.enabled = false
			game.map_settings.enemy_evolution.enabled = false
			game.difficulty_settings.technology_price_multiplier = 1
			
		elseif game.difficulty == defines.difficulty.normal then  
			character.insert{name = "shotgun-shell", count = 6}
			
			game.forces.enemy.evolution_factor = .35
			game.map_settings.enemy_expansion.enabled = false
			game.map_settings.enemy_evolution.enabled = false
			game.difficulty_settings.technology_price_multiplier = 1.2
			
		elseif game.difficulty == defines.difficulty.hard then  
		    character.insert{name = "shotgun-shell", count = 1}
			game.forces.enemy.evolution_factor = .60
			game.map_settings.enemy_expansion.enabled = false
			game.map_settings.enemy_evolution.enabled = true
			game.difficulty_settings.technology_price_multiplier = 2
        end
      end
    },
	{
      action =
      function()
      local ammotron = game.get_entity_by_tag("tron")
        if game.difficulty == defines.difficulty.easy then
			ammotron.insert{name = "piercing-rounds-magazine", count = 600}
			ammotron.insert{name = "rocket", count = 1000}
			ammotron.insert{name = "explosive-rocket", count = 600}
			ammotron.insert{name = "laser-turret", count = 20}
		    ammotron.insert{name = "copper-plate", count = 300}
			ammotron.insert{name = "iron-plate", count = 500}
            ammotron.insert{name = "construction-robot", count = 40}
			ammotron.insert{name = "transport-belt", count = 375} 
			ammotron.insert{name = "fast-transport-belt", count = 250}
			ammotron.insert{name = "fast-inserter", count = 50} 
			ammotron.insert{name = "personal-laser-defense-equipment", count = 3} 
			ammotron.insert{name = "fusion-reactor-equipment", count = 1}
            ammotron.insert{name = "stone-wall", count = 125}			
			
		elseif game.difficulty == defines.difficulty.normal then  
		    ammotron.insert{name = "piercing-rounds-magazine", count = 147}
			ammotron.insert{name = "rocket", count = 250}
			ammotron.insert{name = "construction-robot", count = 7}
			
			
		elseif game.difficulty == defines.difficulty.hard then  
		    ammotron.insert{name = "rocket", count = 1}
        end
      end
    },
	-- MISSION FASE 1
	{
      condition = story_elapsed_check(1),
      action =
      function()
        set_goal("")
		think("msg1")
      end
	},	
	{
      condition = story_elapsed_check(5),
      action =
      function()
        set_goal("")
		game.show_message_dialog{text = {"msg-base-1"}}
      end
	},	
	{
      condition = story_elapsed_check(3),
      action =
      function()
        set_goal("")
        game.show_message_dialog{text = {"msg-base-2"}}
      end
	},	
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
        global.radar = game.surfaces[1].find_entities_filtered{name = "crash-site-spaceship", limit = 1}[1]
		global.radar2 = game.surfaces[1].find_entities_filtered{name = "spidertron", limit = 1}[1]
        if global.radar and global.radar2 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {

				{
                  target = global.radar,
                  transition_time = 300,
                  time_to_wait = 200,
                  zoom = 2
                },
				{
                  target = global.radar2,
                  transition_time = 200,
                  time_to_wait = 200,
                  zoom = 1.5
                },
				{
                  target = player.character,
                  transition_time = 0,
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
      condition = story_elapsed_check(0),
    },

	{
      condition = story_elapsed_check(1)
	},
	{
      init = function()
		game.players[1].character.destructible = true
      end
    },
	{
      condition = story_elapsed_check(1),
      action = function()
	    set_goal({"goal-get-spidertron"})
      end
    },
	
    {
      condition = function(event) 
	  local cardead = game.surfaces[1].find_entities_filtered{name = "spidertron", limit = 1}[1]
        if not cardead then game.set_game_state({game_finished=true, player_won=false, can_continue=false}) end 
		return game.players[1].vehicle ~= nil and (game.players[1].vehicle.type == "spider-vehicle")
		end
    },
	------------------------------
	-- /// SPIDERTRON READY /// --
	------------------------------
	-- Crystal Peak Online
	{
      condition = story_elapsed_check(1),
      action = function()
	    set_goal("")
	    local boil1 = game.get_entity_by_tag("boiler1")
           boil1.insert{name = "coal", count = 25}
	    local boil2 = game.get_entity_by_tag("boiler2")
		   boil2.insert{name = "coal", count = 25}
      end
    },
	{
      action =
      function()
		for index, entity in pairs(global.intro_entities_base1) do
          entity.minable = true
		  entity.destructible = true
        end
      end
    },
	{
      condition = story_elapsed_check(2),
      action =
      function()
        set_goal("")
		game.show_message_dialog{text = {"msg-base-3"}}
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
        global.radar = game.surfaces[1].find_entities_filtered{area = {{954.5, 41.5}, {954.5, 41.5}}, name = "radar", limit = 1}[1]
        if global.radar then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {

				{
                  target = global.radar,
                  transition_time = 10,
                  time_to_wait = 10,
                  zoom = 3
                },
				{
                  target = global.radar,
                  transition_time = 400,
                  time_to_wait = 200,
                  zoom = 1
                },
				{
                  target = player.character,
                  transition_time = 400,
                  time_to_wait = 0,
                  zoom = 1
                },
              },
              start_position = global.radar.position,
              start_zoom = 3
            }
          end
        end
      end,
      condition = story_elapsed_check(0),
    },
	{
      condition = story_elapsed_check(2),
      action =
      function()
        set_goal("")
		game.show_message_dialog{text = {"msg-base-4"}}
      end
	},
	{
      init = function()
		game.players[1].character.destructible = true
      end
    },
	{ 
	  condition = story_elapsed_check(2),	  
    },
	{
      action =
      function()
        set_goal({"goal-build-accumulators",0,4})
      end
	},
	------------------------------
	-- /// CYSTAL PEAK /// --
	------------------------------
	{ 
	  condition = story_elapsed_check(20),	  
    },
	{
      condition = story_elapsed_check(1),
      action =
      function()
        set_goal("")
		story_show_message_dialog{text={"msg-base-4.1"},
                                 image = "discharge.png"}
      end
	},
	{
      init = function()
        set_goal({"goal-build-accumulators",0,4})
        global.battery = 0
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and event.entity.name == 'accumulator' then
          global.battery = global.battery - 1
          set_goal({"goal-build-accumulators",global.battery,4},true)
        elseif event.name == defines.events.on_built_entity and event.created_entity.name == 'accumulator' or
		       event.name == defines.events.on_robot_built_entity and event.created_entity.name == 'accumulator' then
          global.battery = global.battery + 1
          set_goal({"goal-build-accumulators",global.battery,4})
        elseif event.name == defines.events.on_player_mined_entity and event.entity.name =='accumulator' then
          global.battery = global.battery - 1
          set_goal({"goal-build-accumulators",global.battery,4},true)
        end
      end,
      condition = function(event)
        return global.battery >= 4
      end
    },
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
			game.forces.enemy.evolution_factor = .10
			game.map_settings.enemy_expansion.enabled = false
		elseif game.difficulty == defines.difficulty.normal then  
			game.forces.enemy.evolution_factor = .25
			game.map_settings.enemy_expansion.enabled = false
		elseif game.difficulty == defines.difficulty.hard then  
		    game.forces.enemy.evolution_factor = .65
			game.map_settings.enemy_expansion.enabled = true
        end
      end
    },
	{
      condition = story_elapsed_check(1),
      action =
      function()
        set_goal("")
    	--grey science
		game.players[1].force.technologies["military-science-pack"].enabled = true
		game.players[1].force.technologies["flamethrower"].enabled = true
		game.players[1].force.technologies["flammables"].enabled = true
		game.players[1].force.technologies["land-mine"].enabled = true
		game.players[1].force.technologies["rocketry"].enabled = true
  
		--blue science
		game.players[1].force.technologies["military-3"].enabled = true
		game.players[1].force.technologies["chemical-science-pack"].enabled = true
		game.players[1].force.technologies["laser"].enabled = true
		game.players[1].force.technologies["speed-module-2"].enabled = true
		game.players[1].force.technologies["effectivity-module-2"].enabled = true
		game.players[1].force.technologies["productivity-module-2"].enabled = true
		game.players[1].force.technologies["laser-turret"].enabled = true
		game.players[1].force.technologies["tank"].enabled = true
		game.players[1].force.technologies["explosive-rocketry"].enabled = true 
		game.players[1].force.technologies["advanced-material-processing-2"].enabled = true  
		game.players[1].force.technologies["advanced-oil-processing"].enabled = true 
		game.players[1].force.technologies["lubricant"].enabled = true
		game.players[1].force.technologies["rocket-fuel"].enabled = true 
		game.players[1].force.technologies["electric-engine"].enabled = true  
		game.players[1].force.technologies["low-density-structure"].enabled = true  
		game.players[1].force.technologies["robotics"].enabled = true
		game.players[1].force.technologies["construction-robotics"].enabled = true
		game.players[1].force.technologies["logistic-robotics"].enabled = true
		game.players[1].force.technologies["advanced-electronics-2"].enabled = true
		game.players[1].force.technologies["electric-energy-distribution-2"].enabled = true

		
		--equipment
		game.players[1].force.technologies["power-armor"].enabled = true
		game.players[1].force.technologies["personal-laser-defense-equipment"].enabled = true
		game.players[1].force.technologies["exoskeleton-equipment"].enabled = true
		game.players[1].force.technologies["energy-shield-equipment"].enabled = true
		game.players[1].force.technologies["distractor"].enabled = true
		game.players[1].force.technologies["personal-roboport-equipment"].enabled = true
      end
	},
	{
      condition = story_elapsed_check(2),
      action =
      function()
        set_goal("")
		game.show_message_dialog{text = {"msg-base-5"}}
      end
	},
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
			game.forces.enemy.evolution_factor = .10
		elseif game.difficulty == defines.difficulty.normal then  
			game.show_message_dialog{text = {"msg-base-6"}}
		elseif game.difficulty == defines.difficulty.hard then  
		    game.show_message_dialog{text = {"msg-base-6"}}
        end
      end
    },
	{
      action =
      function()

		game.show_message_dialog{text = {"msg-base-7"}}
		game.show_message_dialog{text = {"msg-base-7.1"}}
      end
	},
	{
      condition = story_elapsed_check(2),
      action =
      function()
        set_goal("")
		think("msg2")
      end
	},	
	{
      condition = story_elapsed_check(5),
      action =
      function()
        set_goal("")
		think("msg3")
      end
	},
	{
      condition = story_elapsed_check(6),
      action =
      function()
        set_goal("")
		think("msg4")
      end
	},
		{
      condition = story_elapsed_check(2),
      action =
      function()
        set_goal("")
		think("msg5")
      end
	},
	{
      condition = story_elapsed_check(5)
	},
	{
      update = (function()
        local only_update = false
        return function(event)
          local more_things1 = game.players[1].character.get_item_count("gun-turret")
		  local more_things2 = game.players[1].character.get_item_count("piercing-rounds-magazine")
		  local more_things3 = game.players[1].character.get_item_count("rocket")
		  local more_things4 = game.players[1].character.get_item_count("grenade")
		  local more_things5 = game.players[1].character.get_item_count("assembling-machine-2")
		  local more_things6 = game.players[1].character.get_item_count("fast-transport-belt")
          set_goal
          (
            {
              "goal-inventory-prepare",
              more_things1,
			  20,
              more_things2,
              600,
			  more_things3,
              300,
			  more_things4,
              120,
			  more_things5,
              40,
			  more_things6,
              400
            },
            only_update
          )
          only_update = true
        end
      end)(),
      condition = function()
        return 
              game.players[1].character.get_item_count("gun-turret")>= 20 and 
			  game.players[1].character.get_item_count("piercing-rounds-magazine") >= 600 and 
			  game.players[1].character.get_item_count("rocket") >= 300 and 
			  game.players[1].character.get_item_count("grenade") >= 120 and
			  game.players[1].character.get_item_count("assembling-machine-2") >= 40 and
			  game.players[1].character.get_item_count("fast-transport-belt") >= 400
      end,
      action = function()
        set_goal("")
      end
    },
	{
      condition = story_elapsed_check(2),
      action =
      function()
        set_goal("")
		game.show_message_dialog{text = {"msg-base-8"}}
		game.show_message_dialog{text = {"msg-base-9"}}
      end
	},
	----------------------------------
	-- /// FIRST NUCLEAR ATTACK /// --
	----------------------------------
	-- Triumph base online
	{
      condition = story_elapsed_check(5),
      action = function()
	    set_goal("")
	    local boil1 = game.get_entity_by_tag("boiler3")
           boil1.insert{name = "coal", count = 25}
	    local boil2 = game.get_entity_by_tag("boiler4")
		   boil2.insert{name = "coal", count = 25}
		   
		   
      end
    },
	{
      init = function()
		game.surfaces[1].create_entity({name='substation', position={x=4004.5,y=-41.5},force="player"})  
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
        global.radar = game.surfaces[1].find_entities_filtered{area = {{4000.5, -41.5}, {4000.5, -41.5}}, name = "radar", limit = 1}[1]
		global.radar4 = game.surfaces[1].find_entities_filtered{area = {{1120.5, 21.5}, {1120.5, 21.5}}, name = "rock-big", limit = 1}[1]
        if global.radar and global.radar4 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {

				{
                  target = global.radar,
                  transition_time = 10,
                  time_to_wait = 10,
                  zoom = 1
                },
				{
                  target = global.radar,
                  transition_time = 300,
                  time_to_wait = 75,
                  zoom = 0.2
                },
				{
                  target = global.radar4,
                  transition_time = 1400,
                  time_to_wait = 1,
                  zoom = 0.1
                },
              },
              start_position = global.radar.position,
              start_zoom = 1
            }
          end
        end
      end,
      condition = story_elapsed_check(0),
    },
	{
      init = function()
		global.radar11 = game.surfaces[1].find_entities_filtered{area = {{1120.5, 21.5}, {1120.5, 21.5}}, name = "rock-big", limit = 1}[1]
        if global.radar11 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {

				{
                  target = global.radar11,
                  transition_time = 0,
                  time_to_wait = 0,
                  zoom = 0.1
                },
				{
                  target = global.radar11,
                  transition_time = 300,
                  time_to_wait = 300,
                  zoom = 0.4
                },
				{
                  target = player.character,
                  transition_time = 200,
                  time_to_wait = 0,
                  zoom = 1
                },
              },
              start_position = global.radar11.position,
              start_zoom = 0.1
            }
          end
        end
      end,
      condition = story_elapsed_check(0.1),
	update = function()	  
		local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1100,0}, speed=1, position = {500,-255}, force = "player"})	
		local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1150,30}, speed=1, position = {500,-255}, force = "player"})	
		local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1170,-30}, speed=1, position = {500,-255}, force = "player"})
	  end
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
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
			game.forces.enemy.evolution_factor = .12
		elseif game.difficulty == defines.difficulty.normal then  
			game.forces.enemy.evolution_factor = .49
		elseif game.difficulty == defines.difficulty.hard then  
		    game.forces.enemy.evolution_factor = .74
        end
      end
    },
	{
      condition = story_elapsed_check(1),
      action =
      function()
		set_goal({"goal-wait-until-bombs-stop"})
		game.map_settings.enemy_evolution.enabled = true -- EVOLUTION IS NOW ENABLED
      end
	},
	{ 
	  condition = story_elapsed_check(3),
      init = function()	  
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1110,20}, speed=1, position = {500,-255}, force = "player"})	  
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1170,10}, speed=1, position = {500,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1200,-10}, speed=1, position = {500,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1260,0}, speed=1, position = {1000,-255}, force = "player"})	
	  end
    },
	{ 
	  condition = story_elapsed_check(3),
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1203,30}, speed=1, position = {1000,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1230,-19}, speed=1, position = {1000,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1290,32}, speed=1, position = {1000,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1390,-40}, speed=1, position = {1000,-255}, force = "player"})	
	  end
    },
	{ 
	  condition = story_elapsed_check(3),
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1390,-40}, speed=1, position = {1000,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1350,20}, speed=1, position = {1000,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1400,-5}, speed=1, position = {1000,-255}, force = "player"})		  
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1420,-0}, speed=1, position = {1000,-255}, force = "player"})	
	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1403,80}, speed=1, position = {1000,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1430,-15}, speed=1, position = {1000,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1490,42}, speed=1, position = {1000,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1490,-40}, speed=1, position = {1000,-255}, force = "player"})		
	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1450,50}, speed=1, position = {1000,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1500,-55}, speed=1, position = {1000,-255}, force = "player"})		  
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1566,-37}, speed=1, position = {1000,-255}, force = "player"})	
	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1600,-5}, speed=1, position = {1500,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1644,10}, speed=1, position = {1500,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1674,2}, speed=1, position = {1500,-255}, force = "player"})		
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1704,-42}, speed=1, position = {1500,-255}, force = "player"})	
	  end	  
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
		
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1714,-42}, speed=1, position = {1500,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1744,-22}, speed=1, position = {1500,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1804,-1}, speed=1, position = {1500,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1777,11}, speed=1, position = {1500,-255}, force = "player"})
	  end	  
    },
	{ 
	  condition = story_elapsed_check(3),
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1834,80}, speed=1, position = {1500,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1885,67}, speed=1, position = {1500,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1759,32}, speed=1, position = {1500,-255}, force = "player"})		

      end	  
    },
	{ 
	  condition = story_elapsed_check(3),
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1822,-99}, speed=1, position = {1500,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1855,77}, speed=1, position = {1500,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1899,122}, speed=1, position = {1500,-255}, force = "player"})		
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1944,-2}, speed=1, position = {1500,-255}, force = "player"})	
      end	  
    },
	{ 
	  condition = story_elapsed_check(3),
	  init = function()

      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1955,-22}, speed=1, position = {1500,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={1999,-1}, speed=1, position = {1500,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2050,21}, speed=1, position = {1500,-255}, force = "player"})		  	  
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2040,-10}, speed=1, position = {1500,-255}, force = "player"})
      end	  
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2111,-29}, speed=1, position = {2000,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2119,47}, speed=1, position = {2000,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2177,2}, speed=1, position = {2000,-255}, force = "player"})		
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2222,-42}, speed=1, position = {2000,-255}, force = "player"})	
	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2281,-29}, speed=1, position = {2000,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2219,47}, speed=1, position = {2000,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2277,2}, speed=1, position = {2000,-255}, force = "player"})		
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2222,-42}, speed=1, position = {2000,-255}, force = "player"})	
	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2335,52}, speed=1, position = {2000,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2341,-1}, speed=1, position = {2000,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2367,81}, speed=1, position = {2000,-255}, force = "player"})		  	  
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2310,-10}, speed=1, position = {2000,-255}, force = "player"})
	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2255,-82}, speed=1, position = {2000,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2311,-1}, speed=1, position = {2000,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2377,51}, speed=1, position = {2000,-255}, force = "player"})		  	  
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2400,-20}, speed=1, position = {2000,-255}, force = "player"})
	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2450,-49}, speed=1, position = {2000,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2499,47}, speed=1, position = {2000,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2545,102}, speed=1, position = {2000,-255}, force = "player"})		
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2599,-2}, speed=1, position = {2000,-255}, force = "player"})	

	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2644,-12}, speed=1, position = {2000,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2699,-9}, speed=1, position = {2000,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2751,31}, speed=1, position = {2500,-255}, force = "player"})		  	  
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2800,0}, speed=1, position = {2500,-255}, force = "player"})	
	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2850,-89}, speed=1, position = {2500,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2899,77}, speed=1, position = {2500,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2945,22}, speed=1, position = {2500,-255}, force = "player"})		
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2995,-12}, speed=1, position = {2500,-255}, force = "player"})	

		end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={3000,50}, speed=1, position = {2500,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={2959,77}, speed=1, position = {2500,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={3045,22}, speed=1, position = {2500,-255}, force = "player"})		
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={3095,-8}, speed=1, position = {2500,-255}, force = "player"})	

		end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={3000,-72}, speed=1, position = {2500,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={3044,-49}, speed=1, position = {2500,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={3100,41}, speed=1, position = {2500,-255}, force = "player"})		  	  
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={3150,14}, speed=1, position = {2500,-255}, force = "player"})
		end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={3190,-22}, speed=1, position = {2500,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={3249,27}, speed=1, position = {2500,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={3295,52}, speed=1, position = {3000,-255}, force = "player"})		
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={3345,-22}, speed=1, position = {3000,-255}, force = "player"})	

	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={3400,-12}, speed=1, position = {3000,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={3444,-39}, speed=1, position = {3000,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={3500,41}, speed=1, position = {3000,-255}, force = "player"})		  	  
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={3550,14}, speed=1, position = {3000,-255}, force = "player"})	
	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={3600,-12}, speed=1, position = {3000,-255}, force = "player"})	
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={3614,-39}, speed=1, position = {3000,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={3650,41}, speed=1, position = {3000,-255}, force = "player"})		  	  
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={3700,14}, speed=1, position = {3000,-255}, force = "player"})	
	  end
    },
	{ 
	  condition = story_elapsed_check(5)	
    },
	{
      condition = story_elapsed_check(1),
      action =
      function()
        set_goal("")
      end
	},	
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
			game.forces.enemy.evolution_factor = .12
		elseif game.difficulty == defines.difficulty.normal then  
			game.forces.enemy.evolution_factor = .49
		elseif game.difficulty == defines.difficulty.hard then  
		    game.forces.enemy.evolution_factor = .74
        end
      end
    },
	{
      condition = story_elapsed_check(2),
      action =
      function()
        set_goal("")
		game.show_message_dialog{text = {"msg-base-10"}}
		game.show_message_dialog{text = {"msg-base-11"}}
      end
	},
	{
      condition = story_elapsed_check(2),
      action =
      function()
        set_goal("")
		game.show_message_dialog{text = {"msg-base-12"}}
      end
	},
	{
      condition = story_elapsed_check(1),
      action =
      function()
        set_goal({"goal-centrifuge"})
      end
	},
	{
      condition = function() return global.centrifuge_1.energy > 0 end,
      action = function()
        set_goal("")
      end
    },
	{
      action =
      function()
		for index, entity in pairs(global.intro_entities_base2) do
          entity.minable = true
		  entity.destructible = true
        end
      end
    },
	------------------------------
	-- /// TRIUMPH BASE /// --
	------------------------------
	{
      condition = story_elapsed_check(2),
      action =
      function()
        set_goal("")
		game.show_message_dialog{text = {"msg-base-13"}}
		game.show_message_dialog{text = {"msg-base-14"}}
		game.show_message_dialog{text = {"msg-base-15"}}
      end
	},
	{
      condition = story_elapsed_check(1),
      action =
      function()
        set_goal({"goal-triumph"})
      end
	},
	{
      condition = story_elapsed_check(1),
      action =
      function()

		
		-- blue science
		game.players[1].force.technologies["uranium-processing"].researched = true
		game.players[1].force.technologies["nuclear-power"].researched = true
		
		--purple science
		game.players[1].force.technologies["production-science-pack"].researched = true
		game.players[1].force.technologies["logistics-3"].enabled = true
		game.players[1].force.technologies["effect-transmission"].enabled = true
		game.players[1].force.technologies["kovarex-enrichment-process"].researched = true
		game.players[1].force.technologies["nuclear-fuel-reprocessing"].enabled = true		
		game.players[1].force.technologies["coal-liquefaction"].enabled = true
		game.players[1].force.technologies["speed-module-3"].enabled = true
		game.players[1].force.technologies["effectivity-module-3"].enabled = true
		game.players[1].force.technologies["productivity-module-3"].enabled = true
  		game.players[1].force.technologies["automation-3"].enabled = true
		
		--yellow science
		game.players[1].force.technologies["utility-science-pack"].enabled = true
		game.players[1].force.technologies["military-4"].enabled = true
		game.players[1].force.technologies["uranium-ammo"].enabled = true 
		game.players[1].force.technologies["rocket-control-unit"].enabled = true
		game.players[1].force.technologies["logistic-system"].enabled = true
		game.players[1].force.technologies["atomic-bomb"].enabled = true

  
		-- equipment
		game.players[1].force.technologies["destroyer"].enabled = true
		game.players[1].force.technologies["defender"].enabled = true
		game.players[1].force.technologies["power-armor-mk2"].enabled = true
		game.players[1].force.technologies["battery-mk2-equipment"].enabled = true
		game.players[1].force.technologies["energy-shield-mk2-equipment"].enabled = true
		game.players[1].force.technologies["fusion-reactor-equipment"].enabled = true 
      end
	},
	{
      condition = story_elapsed_check(2)
	},
	--15 minutes must wait until next objectives
	{
      condition = story_elapsed_check(900),
    },
	{
      condition = story_elapsed_check(2),
      action =
      function()
        set_goal("")
		game.show_message_dialog{text = {"msg-base-16"}}
		game.show_message_dialog{text = {"msg-base-17"}}
      end
	},
	{
      update = (function()
        local only_update = false
        return function(event)
          local more_things1 = game.players[1].character.get_item_count("laser-turret")
		  local more_things2 = game.players[1].character.get_item_count("explosive-rocket")
		  local more_things3 = game.players[1].character.get_item_count("poison-capsule")
		  local more_things4 = game.players[1].character.get_item_count("uranium-fuel-cell")
		  local more_things5 = game.players[1].character.get_item_count("assembling-machine-3")
		  local more_things6 = game.players[1].character.get_item_count("stack-inserter")
          set_goal
          (
            {
              "goal-inventory-prepare-2",
              more_things1,
			  30,
              more_things2,
              800,
			  more_things3,
              200,
			  more_things4,
              10,
			  more_things5,
              30,
			  more_things6,
              50
            },
            only_update
          )
          only_update = true
        end
      end)(),
      condition = function()
        return 
              game.players[1].character.get_item_count("laser-turret")>= 30 and 
			  game.players[1].character.get_item_count("explosive-rocket") >= 800 and 
			  game.players[1].character.get_item_count("poison-capsule") >= 200 and 
			  game.players[1].character.get_item_count("uranium-fuel-cell") >= 10 and
			  game.players[1].character.get_item_count("assembling-machine-3") >= 30 and
			  game.players[1].character.get_item_count("stack-inserter") >= 50
      end,
      action = function()
        set_goal("")
      end
    },
	------------------------------
	-- /// SECOND NUKES BARRAGE /// --
	------------------------------
	-- Dune Online
	{
      condition = story_elapsed_check(1),
      action = function()
	    set_goal("")
	    local boil1 = game.get_entity_by_tag("boiler5")
           boil1.insert{name = "coal", count = 50}
	    local boil2 = game.get_entity_by_tag("boiler6")
		   boil2.insert{name = "coal", count = 50}
		local boil3 = game.get_entity_by_tag("boiler7")
		   boil3.insert{name = "coal", count = 50}
		local boil4 = game.get_entity_by_tag("boiler8")
		   boil4.insert{name = "coal", count = 50}
	    local boil5 = game.get_entity_by_tag("boiler9")
		   boil5.insert{name = "coal", count = 50}
	    local boil6 = game.get_entity_by_tag("boiler10")
		   boil6.insert{name = "coal", count = 50}
      end
    },

	{
      init = function()
		game.surfaces[1].create_entity({name='substation',position={x=6954.5,y=-30.5},force="player"})  
      end 
    },
	{
      condition = story_elapsed_check(2),
      action =
      function()
        set_goal("")
		game.show_message_dialog{text = {"msg-base-18"}}
      end
	},
	{
      condition = story_elapsed_check(3),
	},
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
        global.radar5 = game.surfaces[1].find_entities_filtered{area = {{6951.5, -20.5}, {6951.5, -20.5}}, name = "radar", limit = 1}[1]
		global.radar6 = game.surfaces[1].find_entities_filtered{area = {{4240.5, -1.5}, {4240.5, -1.5}}, name = "rock-big", limit = 1}[1]
        if global.radar5 and global.radar6 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {

				{
                  target = global.radar5,
                  transition_time = 10,
                  time_to_wait = 10,
                  zoom = 1
                },
				{
                  target = global.radar5,
                  transition_time = 300,
                  time_to_wait = 100,
                  zoom = 0.2
                },
				{
                  target = global.radar6,
                  transition_time = 800,
                  time_to_wait = 0,
                  zoom = 0.1
                },
              },
              start_position = global.radar5.position,
              start_zoom = 1
            }
          end
        end
      end,
      condition = story_elapsed_check(0),
    },
	{
      init = function()
		global.radar7 = game.surfaces[1].find_entities_filtered{area = {{4240.5, -1.5}, {4240.5, -1.5}}, name = "rock-big", limit = 1}[1]
        if global.radar7 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
				{
                  target = global.radar7,
                  transition_time = 0,
                  time_to_wait = 0,
                  zoom = 0.1
                },
				{
                  target = global.radar7,
                  transition_time = 300,
                  time_to_wait = 300,
                  zoom = 0.5
                },
				{
                  target = player.character,
                  transition_time = 200,
                  time_to_wait = 0,
                  zoom = 1
                },
              },
              start_position = global.radar7.position,
              start_zoom = 0.1
            }
          end
        end
      end,
      condition = story_elapsed_check(0),
	  update = function()	  
		local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4195,15}, speed=1, position = {4000,-255}, force = "player"})	
		local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4230,-25}, speed=1, position = {4000,-255}, force = "player"})	
		local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4271,-10}, speed=1, position = {4000,-255}, force = "player"})
		local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4220,20}, speed=1, position = {4000,-255}, force = "player"})
	  end
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
		set_goal({"goal-wait-until-bombs-stop"})
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
			game.forces.enemy.evolution_factor = .60
			game.map_settings.enemy_expansion.enabled = true
		elseif game.difficulty == defines.difficulty.hard then  
		    game.forces.enemy.evolution_factor = .85
			game.map_settings.enemy_expansion.enabled = true
        end
      end
    },
	{ 
	  condition = story_elapsed_check(2),
      init = function()	  
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4350,10}, speed=1, position = {4000,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4320,90}, speed=1, position = {4000,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4391,-49}, speed=1, position = {4000,-255}, force = "player"})
	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4445,10}, speed=1, position = {4200,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4460,30}, speed=1, position = {4200,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4470,-49}, speed=1, position = {4200,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4490,-20}, speed=1, position = {4200,-255}, force = "player"})	  
	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4585,10}, speed=1, position = {4200,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4540,30}, speed=1, position = {4200,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4550,-49}, speed=1, position = {4200,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4570,-20}, speed=1, position = {4200,-255}, force = "player"})	  
	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4645,10}, speed=1, position = {4500,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4640,30}, speed=1, position = {4500,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4610,-39}, speed=1, position = {4500,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4670,-40}, speed=1, position = {4500,-255}, force = "player"})	  
	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4755,30}, speed=1, position = {4500,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4780,10}, speed=1, position = {4500,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4720,-29}, speed=1, position = {4500,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4770,-50}, speed=1, position = {4500,-255}, force = "player"})	  
	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4825,05}, speed=1, position = {4500,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4860,10}, speed=1, position = {4500,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4890,-19}, speed=1, position = {4500,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4950,-30}, speed=1, position = {4500,-255}, force = "player"})	  
	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4915,15}, speed=1, position = {5000,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4950,05}, speed=1, position = {5000,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={4990,-19}, speed=1, position = {5000,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5020,-20}, speed=1, position = {5000,-255}, force = "player"})	  
	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5050,-25}, speed=1, position = {5000,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5090,05}, speed=1, position = {5000,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5120,-05}, speed=1, position = {5000,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5160,-15}, speed=1, position = {5000,-255}, force = "player"})	  
	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5220,-15}, speed=1, position = {5000,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5260,-05}, speed=1, position = {5000,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5300,-15}, speed=1, position = {5000,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5350,-20}, speed=1, position = {5000,-255}, force = "player"})	  
	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5410,-25}, speed=1, position = {5500,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5460,-20}, speed=1, position = {5500,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5490,-05}, speed=1, position = {5500,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5520,10}, speed=1, position = {5500,-255}, force = "player"})	  
	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5410,-25}, speed=1, position = {5500,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5460,-20}, speed=1, position = {5500,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5490,-05}, speed=1, position = {5500,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5520,10}, speed=1, position = {5500,-255}, force = "player"})	  
	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5560,-25}, speed=1, position = {5500,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5600,-10}, speed=1, position = {5500,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5650,-15}, speed=1, position = {5500,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5700,10}, speed=1, position = {5500,-255}, force = "player"})	  
	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5560,-25}, speed=1, position = {5500,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5600,-10}, speed=1, position = {5500,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5650,-15}, speed=1, position = {5500,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5700,-30}, speed=1, position = {5500,-255}, force = "player"})	  
	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5760,-35}, speed=1, position = {5500,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5800,-20}, speed=1, position = {5500,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5850,-05}, speed=1, position = {5500,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5890,10}, speed=1, position = {5500,-255}, force = "player"})	  
	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5940,-15}, speed=1, position = {5900,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={5990,-20}, speed=1, position = {5900,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={6040,-05}, speed=1, position = {5900,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={6090,10}, speed=1, position = {5900,-255}, force = "player"})	  
	  end
    },
	{ 
	  condition = story_elapsed_check(3),	
	  init = function()
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={6110,-55}, speed=1, position = {5900,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={6120,70}, speed=1, position = {5900,-255}, force = "player"})	
	  local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={6130,35}, speed=1, position = {5900,-255}, force = "player"})
      local atom_boom = game.surfaces[1].create_entity({name='atomic-rocket', target={6175,50}, speed=1, position = {5900,-255}, force = "player"})	  
	  end
    },
	{
      condition = story_elapsed_check(5)
	},
	{
      condition = story_elapsed_check(2),
      action =
      function()
        set_goal("")
		game.show_message_dialog{text = {"msg-base-19"}}
		game.show_message_dialog{text = {"msg-base-20"}}
		game.show_message_dialog{text = {"msg-base-21"}}
		game.show_message_dialog{text = {"msg-base-22"}}
		game.show_message_dialog{text = {"msg-base-23"}}
      end
	},
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
			game.forces.enemy.evolution_factor = .15
		elseif game.difficulty == defines.difficulty.normal then  
			game.forces.enemy.evolution_factor = .60
		elseif game.difficulty == defines.difficulty.hard then  
		    game.forces.enemy.evolution_factor = .85
        end
      end
    },
	{
      condition = story_elapsed_check(2)
	},
	{
      condition = story_elapsed_check(2),
      action =
      function()
        set_goal("")
		game.show_message_dialog{text = {"msg-base-24"}}
		game.show_message_dialog{text = {"msg-base-25"}}
		game.show_message_dialog{text = {"msg-base-25.1"}}
      end
	},
	{
      condition = story_elapsed_check(1),
	  update = (function()
        local only_update = false
        return function(event)
		  local reactor_chest = game.get_entity_by_tag("reactor1")
          local resources1 = reactor_chest.get_item_count("uranium-fuel-cell") 
          set_goal
          (
            {
              "goal-dune-reactor",
              resources1,
			  1
            },

            only_update
          )
          only_update = true
        end
      end)(),
      condition = function()
	    local reactor_chest = game.get_entity_by_tag("reactor1")
        return 
              reactor_chest.get_item_count("uranium-fuel-cell") >= 1
        end,
      action = function()
        set_goal("")
      end
    },
	{
      action =
      function()
		for index, entity in pairs(global.intro_entities_base3) do
          entity.minable = true
		  entity.destructible = true
        end
      end
    },
	-------------------------------------
	-- /// DUNE BASE - FINAL STAND /// --
	-------------------------------------
	{
      condition = story_elapsed_check(1),
      action =
      function()
        set_goal("")
		--special
		game.players[1].force.technologies["spidertron"].enabled = true
		game.players[1].force.technologies["artillery"].enabled = true      
      end
	},
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
			game.forces.enemy.evolution_factor = .20
		elseif game.difficulty == defines.difficulty.normal then  
			game.forces.enemy.evolution_factor = .72
		elseif game.difficulty == defines.difficulty.hard then  
		    game.forces.enemy.evolution_factor = .95
        end
      end
    },
	{
      condition = story_elapsed_check(2),
      action =
      function()
        set_goal("")
		game.show_message_dialog{text = {"msg-base-26"}}
		game.show_message_dialog{text = {"msg-base-27"}}
      end
	},
	{
      condition = story_elapsed_check(1),
      action =
      function()
        set_goal({"goal-ressearch-spidertron2"})
      end
	},
	{
      condition = story_elapsed_check(15),
      
	},	
	{
      action =
      function()
        set_goal("")
		game.show_message_dialog{text = {"msg-base-28"}}
      end
	},
	{
      condition = story_elapsed_check(1),
      action =
      function()
        set_goal({"goal-ressearch-spidertron"})
      end
	},
	{
	  condition = story_elapsed_check(3),
      action =
      function(event)
        if event.name == defines.events.on_built_entity and event.created_entity.name == "spidertron" then
          event.created_entity.energy = 1 
        end
      end
    },
	{
	  condition = story_elapsed_check(3),
	  condition = function() return game.players[1].force.technologies["spidertron"].researched end,
      action =
      function()
	    set_goal("")
      end
    },	
	{
	  condition = story_elapsed_check(5),
      action =
      function()
	    set_goal("")
      end
    },
	{
      action =
      function()
        set_goal("")
		game.show_message_dialog{text = {"msg-base-29"}}
		game.show_message_dialog{text = {"msg-base-30"}}
		game.show_message_dialog{text = {"msg-base-31"}}
      end
	},
	{
      action =
      function()
        if game.difficulty == defines.difficulty.easy then
			game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-09")}) -- YOU WIN THE GAME
		elseif game.difficulty == defines.difficulty.normal then  
			game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-09")}) -- YOU WIN THE GAME
		elseif game.difficulty == defines.difficulty.hard then  
		    game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-09")}) -- YOU WIN THE GAME
        end
      end
    },		
  }
}

story_init_helpers(story_table)


script.on_init(function()
  --  game.map_settings.enemy_expansion.enabled = true
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
  defines.events.on_rocket_launched,
  defines.events.on_rocket_launch_ordered,
  defines.events.on_player_died,
  defines.events.on_robot_built_entity,
  defines.events.on_player_driving_changed_state
} 
 
 
 -- tahle funkce je k ho***
function check_research_hints()
  if game.players[1] == nil then
    return
  end
  if global.research_hint == nil and game.players[1].force.current_research ~= nil then
    global.research_hint = true
  end
end

local function on_configuration_changed()
	game.reload_script()
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
script.on_event(defines.events.on_player_created, on_player_created)
script.on_event(defines.events.on_unit_group_finished_gathering, on_unit_group_finished_gathering)
script.on_event(defines.events.on_gui_click, intro_screen.on_gui_click)
script.on_init(on_configuration_changed)
script.on_configuration_changed(on_configuration_changed)