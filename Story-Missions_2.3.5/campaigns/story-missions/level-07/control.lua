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
	if  event.name == defines.events.on_player_died or 
		event.name == defines.events.on_entity_died and
        event.entity.name == "roboport" and
		event.entity.force.name == "base" or 
		event.name == defines.events.on_entity_died and
        event.entity.name == "artillery-turret" and
		event.entity.force.name == "base" then
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

  game.map_settings.enemy_evolution.enabled = true

  
  
  
   ------------
  global.train_1 = game.get_entity_by_tag("vag1")
  global.train_2 = game.get_entity_by_tag("vag2")
  global.train_3 = game.get_entity_by_tag("vag3")
  global.train_4 = game.get_entity_by_tag("vag4")
  local train_entities =
  {
    global.train_1,
	global.train_2,
	global.train_3,
	global.train_4

  }
  for index, entity in pairs(train_entities) do
    entity.minable = false
  end
  global.intro_entities_train = train_entities
  
   ------------
  global.minning_drill_1 = game.get_entity_by_tag("drill-southpass")
  global.minning_drill_2 = game.get_entity_by_tag("drill-desert")
  global.minning_drill_3 = game.get_entity_by_tag("drill-crater")
  global.minning_drill_4 = game.get_entity_by_tag("drill-island")
  global.minning_drill_5 = game.get_entity_by_tag("pump-lakeshore")
  global.minning_drill_6 = game.get_entity_by_tag("drill-sanctuary")
  global.minning_drill_7 = game.get_entity_by_tag("drill-lakeshore")
  local mining_entities =
  {
    global.minning_drill_1,
	global.minning_drill_2,
	global.minning_drill_3,
	global.minning_drill_4,
	global.minning_drill_5,
	global.minning_drill_6,
	global.minning_drill_7
  }
  for index, entity in pairs(mining_entities) do
    entity.minable = false
    entity.destructible = false
  end
  global.intro_entities_mining = mining_entities
     
	 
  ------------
  global.mining_again_1 = game.get_entity_by_tag("drill-grasslands")
  global.mining_again_2 = game.get_entity_by_tag("drill-bridge")
  global.mining_again_3 = game.get_entity_by_tag("drill-facility")
  global.mining_again_4 = game.get_entity_by_tag("pump-hill")
  local mining_again_entities =
  {
    global.mining_again_1,
	global.mining_again_2,
	global.mining_again_3,
	global.mining_again_4

  }
  for index, entity in pairs(mining_again_entities) do
    entity.minable = false
    entity.destructible = false
  end
  global.intro_entities_mining_again = mining_again_entities
  
  
  ------------
  global.enemy_train_1 = game.get_entity_by_tag("second-train") 
  local enemy_train_entities =
  {
    global.enemy_train_1
  }
  for index, entity in pairs(enemy_train_entities) do
    entity.minable = false
    entity.destructible = false
  end
  global.intro_entities_pirate_train = enemy_train_entities
  
  
  ------------
  global.depo_1 = game.get_entity_by_tag("depochest") 
  local chest_entities =
  {
    global.depo_1
  }
  for index, entity in pairs(chest_entities) do
    entity.minable = false
    entity.destructible = false
  end
  global.intro_entities_chest = chest_entities
  
  
  ------------
  global.depo_2 = game.get_entity_by_tag("depochest2") 
  global.depo_3 = game.get_entity_by_tag("depoloader") 
  global.minning_smuggler = game.get_entity_by_tag("drill-smuggler")
  local chest2_entities =
  {
    global.depo_2,
	global.depo_3,
	global.minning_smuggler
  }
  for index, entity in pairs(chest2_entities) do
    entity.minable = false
    entity.destructible = false
  end
  global.intro_entities_chest2 = chest2_entities
  
  
  ------------
  global.pirate_base_stop = game.get_entity_by_tag("pirate_stop_kill") 
  local pirate_stop_entities =
  {
    global.pirate_base_stop
  }
  for index, entity in pairs(pirate_stop_entities) do
    entity.minable = false
    entity.destructible = false
  end
  global.intro_entities_pirate_stop = pirate_stop_entities
   
   
   ------------
  global.behemoth_1 = game.get_entity_by_tag("beh1")
  global.behemoth_2 = game.get_entity_by_tag("beh2")
  global.behemoth_3 = game.get_entity_by_tag("beh3")
  local behemoth_entities =
  {
    global.behemoth_1,
	global.behemoth_2,
	global.behemoth_3
  }
  for index, entity in pairs(behemoth_entities) do
	entity.destructible = false
	entity.minable = false
  end
  global.intro_entities_behemoth = behemoth_entities
 
 
 ------------
  global.base_chest_1 = game.get_entity_by_tag("friendly_base_power")
  global.base_chest_2 = game.get_entity_by_tag("enemy_base_power")
  global.base_chest_3 = game.get_entity_by_tag("enemy_outpost_power")
  local base_chest_entities =
  {
    global.base_chest_1,
	global.base_chest_2,
	global.base_chest_3
  }
  for index, entity in pairs(base_chest_entities) do
	entity.destructible = false
	entity.minable = false
  end
  global.intro_entities_base_chest = base_chest_entities
  
  
  -----------
  global.roboport_2 = game.get_entity_by_tag("main_roboport")
  global.roboport_1 = game.get_entity_by_tag("friendly_roboport")
  global.alt_1 = game.get_entity_by_tag("alt1")
  global.alt_2 = game.get_entity_by_tag("alt2")
  global.alt_3 = game.get_entity_by_tag("alt3")
  global.alt_4 = game.get_entity_by_tag("alt4")
  local base_final_entities =
  {
    global.roboport_2,
    global.roboport_1,
	global.alt_1,
	global.alt_2,
	global.alt_3,
	global.alt_4
  }
  for index, entity in pairs(base_final_entities) do
	entity.destructible = false
	entity.minable = false
  end
  global.intro_entities_base_final = base_final_entities
  
  
  ------------
  global.wall_1 = game.get_entity_by_tag("wall1")
  global.wall_2 = game.get_entity_by_tag("wall2")
  global.wall_3 = game.get_entity_by_tag("wall3")
  global.wall_4 = game.get_entity_by_tag("wall4")
  global.wall_5 = game.get_entity_by_tag("wall5")
  global.wall_6 = game.get_entity_by_tag("wall6")
  global.wall_7 = game.get_entity_by_tag("wall7")
  global.wall_8 = game.get_entity_by_tag("wall8")
  local wall_entities =
  {
    global.wall_1,
	global.wall_2,
    global.wall_3,
	global.wall_4,
	global.wall_5,
	global.wall_6,
	global.wall_7,
	global.wall_8

  }
  for index, entity in pairs(wall_entities) do
    entity.minable = false
    entity.destructible = false
  end
  global.intro_entities_wall = wall_entities
  
  
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


  
  -- enabled
  technology_list["automation"].researched = true
  technology_list["stone-wall"].enabled = true
  technology_list["gun-turret"].researched = true
  technology_list["optics"].enabled = true
  technology_list["logistics"].enabled = true
  technology_list["military"].researched = true
  technology_list["logistic-science-pack"].enabled = true
  technology_list["steel-processing"].researched = true
  technology_list["electronics"].researched = true 
  technology_list["fast-inserter"].enabled = true 
  technology_list["automation-2"].enabled = true
  technology_list["electric-energy-distribution-1"].enabled = true 
  technology_list["electric-energy-distribution-2"].enabled = true 
  technology_list["engine"].researched = true 
  technology_list["fluid-handling"].researched = true 
  technology_list["oil-processing"].researched = true
  technology_list["heavy-armor"].enabled = true
  technology_list["steel-axe"].enabled = true 
  technology_list["military-2"].enabled = true
  technology_list["logistics-2"].enabled = true
  technology_list["advanced-material-processing"].enabled = true
  technology_list["solar-energy"].enabled = true
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
  technology_list["sulfur-processing"].enabled = true
  technology_list["toolbelt"].researched = true
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
  technology_list["automated-rail-transportation"].researched = true
  technology_list["rail-signals"].researched = true
  technology_list["automobilism"].researched = true
  technology_list["gate"].enabled = true
  technology_list["rocketry"].enabled = true
  technology_list["battery"].enabled = true
  technology_list["plastics"].enabled = true
  technology_list["fluid-wagon"].enabled = true
  technology_list["stack-inserter"].enabled = true
  technology_list["explosive-rocketry"].enabled = true 
  technology_list["military-4"].enabled = true
  technology_list["automation-3"].enabled = true  
  technology_list["advanced-material-processing-2"].enabled = true  
  technology_list["advanced-oil-processing"].enabled = true  
  technology_list["uranium-ammo"].enabled = true
  technology_list["lubricant"].enabled = true
  technology_list["rocket-fuel"].enabled = true 
  technology_list["kovarex-enrichment-process"].enabled = true 
  technology_list["electric-engine"].enabled = true  
  technology_list["low-density-structure"].enabled = true  
  technology_list["rocket-control-unit"].enabled = true
  technology_list["concrete"].enabled = true
  technology_list["robotics"].enabled = true
  technology_list["construction-robotics"].enabled = true
  technology_list["logistic-robotics"].enabled = true
  technology_list["nuclear-fuel-reprocessing"].enabled = true
  technology_list["logistics-3"].enabled = true
  technology_list["logistic-system"].enabled = true
  technology_list["atomic-bomb"].enabled = true
  technology_list["nuclear-power"].enabled = true 
  technology_list["uranium-processing"].enabled = true
  technology_list["utility-science-pack"].enabled = true
  technology_list["production-science-pack"].enabled = true
  technology_list["chemical-science-pack"].enabled = true
  technology_list["military-science-pack"].enabled = true
  
  --special
  technology_list["personal-roboport-equipment"].enabled = true
  technology_list["coal-liquefaction"].enabled = true
  technology_list["effect-transmission"].enabled = true
  
  --blocked tech
  technology_list["cliff-explosives"].enabled = false
  technology_list["landfill"].enabled = false
  technology_list["space-science-pack"].enabled = false 
  technology_list["rocket-silo"].enabled = false 
  technology_list["spidertron"].enabled = false
  technology_list["artillery"].enabled = false
  technology_list["fusion-reactor-equipment"].enabled = false
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
  technology_list["physical-projectile-damage-1"].enabled = true
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
  technology_list["mining-productivity-4"].enabled = false -- white science pack
  technology_list["weapon-shooting-speed-1"].enabled = true
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
  technology_list["worker-robots-speed-6"].enabled = false --white science pack
  technology_list["worker-robots-storage-1"].enabled = true
  technology_list["worker-robots-storage-2"].enabled = true
  technology_list["worker-robots-storage-3"].enabled = true
  technology_list["artillery-shell-range-1"].enabled = false -- no artillery
  technology_list["artillery-shell-speed-1"].enabled = false -- no artillery
  technology_list["follower-robot-count-1"].enabled = true
  technology_list["follower-robot-count-2"].enabled = true
  technology_list["follower-robot-count-3"].enabled = true
  technology_list["follower-robot-count-4"].enabled = true
  technology_list["follower-robot-count-5"].enabled = true
  technology_list["follower-robot-count-6"].enabled = true

  local recipe_list = player.force.recipes
  recipe_list["pumpjack"].enabled = false
  recipe_list["electric-mining-drill"].enabled = false
  game.players[1].clear_recipe_notifications()
  

end

local story_table =
{
  {
    {
      init = function()
	  global.radar = game.surfaces[1].find_entities_filtered{name = "locomotive", limit = 1}[1]
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

      end
    },
	{
	  
      action = function()
      local character = game.players[1]
	  	character.insert{name = "rocket-launcher", count = 1}
		character.insert{name = "rocket", count = 3}
		character.insert{name = "submachine-gun", count = 1}
		character.insert{name = "piercing-rounds-magazine", count = 33}
		character.insert{name = "copper-plate", count = 32}
		character.insert{name = "iron-gear-wheel", count = 99} 
		character.insert{name = "steel-plate", count = 63} 
		character.insert{name = "coal", count = 50} 
		character.insert{name = "raw-fish", count = 12} 
		character.insert{name = "pipe", count = 20}
      end
    },
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
			character.insert{name = "piercing-rounds-magazine", count = 367}
			character.insert{name = "rocket", count = 72}
			character.insert{name = "laser-turret", count = 12}
			character.insert{name = "gun-turret", count = 4}
			character.insert{name = "steel-plate", count = 172} 
            character.insert{name = "explosive-cannon-shell", count = 65}
			character.insert{name = "land-mine", count = 45}
			character.insert{name = "modular-armor", count = 1} 
			character.insert{name = "energy-shield-equipment", count = 1}
			character.insert{name = "battery-mk2-equipment", count = 1}	
            character.insert{name = "solar-panel-equipment", count = 4}
			
			game.surfaces[1].create_entity({name='car', force = "neutral", position={x=87,y=641}})
			game.map_settings.enemy_expansion.enabled = false
            game.forces.enemy.evolution_factor = 0
			game.difficulty_settings.recipe_difficulty = 0
			
		elseif game.difficulty == defines.difficulty.normal then  
		    character.insert{name = "piercing-rounds-magazine", count = 57}
			character.insert{name = "rocket", count = 12}
			
			game.map_settings.enemy_expansion.enabled = false
            game.forces.enemy.evolution_factor = .30
			game.difficulty_settings.recipe_difficulty = 1
			
		elseif game.difficulty == defines.difficulty.hard then  
		    game.map_settings.enemy_expansion.enabled = true
            game.forces.enemy.evolution_factor = .47
			game.difficulty_settings.recipe_difficulty = 1
        end
      end
    },

	
	--MISSION FASE 1	
	{ 
	  condition = story_elapsed_check(1),	  
    },
	---------------------------------------
	-- /// PIRATE TRAIN FIRST HIJACK /// --
	---------------------------------------
	{
      condition = story_elapsed_check(0.1),
      action = function()
	  	game.show_message_dialog{text = {"msg-base-1"}}
		game.show_message_dialog{text = {"msg-base-2"}}
		game.show_message_dialog{text = {"msg-base-3"}}
		game.show_message_dialog{text = {"msg-base-3.1"}}
		story_show_message_dialog{text={"msg-base-4"},
                                 image = "targeting.png"}
		game.show_message_dialog{text = {"msg-base-5"}}
      end
    },
	{ 
	  condition = story_elapsed_check(2),	  
    },
	{
      action = function()

	    set_goal({"goal-hijack-enemy-train",0,1})
        global.units_killed = 0
      end
    },
	{ 
	  condition = story_elapsed_check(5),
      action = function()
	    think("msg1")
      end	  
    },
    {
      init = function()
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "locomotive" and
		   event.entity.force.name == "enemy" then
          global.units_killed = global.units_killed + 1
		  set_goal({"goal-hijack-enemy-train",global.units_killed,1})
		elseif event.name == defines.events.on_entity_died and
           event.entity.name == "car" and
		   event.entity.force.name == "enemy" then
           game.set_game_state({game_finished=true, player_won=false, can_continue=false}) 
        end
      end,
      condition = function() return global.units_killed >= 1 end,
      action = function()
        set_goal("")
		local character = game.players[1]
		character.insert{name = "locomotive", count = 1}
      end
    },
	{
	  action = function()
	  for index, entity in pairs(global.intro_entities_pirate_stop) do
        entity.minable = true
		entity.destructible = true
        end
      end
    },
	{ 
      init = function()
	   local pirate_stop = game.get_entity_by_tag("pirate_stop_kill")
	   global.pirate_stop = pirate_stop
	  end 
	},
	{ 
      init = function()  
	   if global.pirate_stop and global.pirate_stop.valid
           then global.pirate_stop.die()
        end
      end
    },
	{ 
	  condition = story_elapsed_check(3),
      action = function()
	    think("msg2")
      end	  
    },
	{ 
	  condition = story_elapsed_check(4.5),
      action = function()
	    think("msg3")
      end	  
    },
	{ 
	  condition = story_elapsed_check(7.5),	
	},
	{
      condition = story_elapsed_check(0.1),
      action = function()
		story_show_message_dialog{text={"msg-base-4.1"},
                                 image = "connecttrain.png"}
      end
    },	  
	{ 
	  condition = story_elapsed_check(1),	
	},
	{
      condition = story_elapsed_check(1),
	  update = (function()
        local only_update = false
        return function(event)
		  local depochest = game.get_entity_by_tag("depochest")
          local resources1 = depochest.get_item_count("copper-ore") 
          set_goal
          (
            {
              "goal-get-train-to-base",
              resources1,
			  1
            },

            only_update
          )
          only_update = true
        end
      end)(),
      condition = function()
	    local depochest = game.get_entity_by_tag("depochest")
        return 
              depochest.get_item_count("copper-ore") >= 1
        end		
    },
	{
      action = function()
        set_goal("")
		for index, entity in pairs(global.intro_entities_chest) do
        entity.minable = true
		entity.destructible = true
        end
	  end
    },
	{
	  action = function()
		for index, entity in pairs(global.intro_entities_train) do
        entity.minable = true
        end
      end
    },
	-----------------------------
	-- /// SOUTHPASS MINE /// --
	----------------------------
	{
      condition = story_elapsed_check(4),
    },
	{
      action = function()
	    set_goal("")
	    game.show_message_dialog{text = {"msg-base-6"}}
      end
    },
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
        global.radar = game.surfaces[1].find_entities_filtered{area = {{323.5, 1925.5}, {323.5, 1925.5}},name = "electric-mining-drill", limit = 1}[1]
        if global.radar then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {

				{
                  target = global.radar,
                  transition_time = 200,
                  time_to_wait = 50,
                  zoom = 1.2
                },
				{
                  target = global.radar,
                  transition_time = 150,
                  time_to_wait = 200,
                  zoom = 0.9
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
      condition = story_elapsed_check(0),
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
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-7"}}
      end
    },
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
			game.forces.enemy.evolution_factor = .05
		elseif game.difficulty == defines.difficulty.normal then  
			game.show_message_dialog{text = {"msg-base-8"}}
		elseif game.difficulty == defines.difficulty.hard then  
		    game.show_message_dialog{text = {"msg-base-8"}}
        end
      end
    },
	{
      action = function()
		game.show_message_dialog{text = {"msg-base-9"}}
      end
    },
	{
      action = function()
	    set_goal({"goal-drill-southpass"})
      end
    },
	{
      condition = function() return global.minning_drill_1.energy > 0 end,
      action = function()
        set_goal("")
      end
    },
	{
      condition = story_elapsed_check(4),
    },
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-10"}}
		game.show_message_dialog{text = {"msg-base-11"}}
      end
    },
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
        global.radar_beacon = game.surfaces[1].find_entities_filtered{area = {{332.5, 1930.5}, {332.5, 1930.5}}, name = "beacon", limit = 1}[1]
        if global.radar_beacon then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
				{
                  target = global.radar_beacon,
                  transition_time = 100,
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
              start_position = player.character.position,
              --start_zoom = 1
            }
          end
        end
      end,
      condition = story_elapsed_check(0),
    },
	{
      condition = story_elapsed_check(1),
    },
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-12"}}
      end
    },
	{
      init = function()
	    global.radar_desert = game.surfaces[1].find_entities_filtered{area = {{-79.5, 1324.5}, {-79.5, 1324.5}}, name = "electric-mining-drill", limit = 1}[1]
        global.radar_desert2 = game.surfaces[1].find_entities_filtered{area = {{-59.5, 1359.5}, {-59.5, 1359.5}}, name = "train-stop", limit = 1}[1]
		if global.radar_desert and global.radar_desert2 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
                {
                  target = global.radar_desert,
                  transition_time = 0,
                  time_to_wait = 50,
				  zoom = 1
                },
				{
                  target = global.radar_desert2,
                  transition_time = 250,
                  time_to_wait = 100,
                  zoom = 0.8
                },
              },
              --start_position = global.radar_desert,
              --start_zoom = 1
            }
          end
        end
      end,
      condition = story_elapsed_check(0),
    },
	{

      init = function()
		global.radar_crater = game.surfaces[1].find_entities_filtered{area = {{-59.5, 1359.5}, {-59.5, 1359.5}}, name = "train-stop", limit = 1}[1]
		global.radar_crater2 = game.surfaces[1].find_entities_filtered{area = {{327.5, 1093.5}, {329.5, 1103.5}}, name = "electric-mining-drill", limit = 1}[1]
        if global.radar_crater and global.radar_crater2 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
				{
                  target = global.radar_crater,
                  transition_time = 0,
                  time_to_wait = 50,
                  zoom = 0.8
                },
				{
                  target = global.radar_crater2,
                  transition_time = 300,
                  time_to_wait = 250,
                  zoom = 0.9
                },
              },
              start_position = global.radar_crater.position,
              start_zoom = 0.8
            }
          end
        end
      end,
      condition = story_elapsed_check(0),
      action =
      function()
		game.show_message_dialog{text = {"msg-base-13"}, point_to={type="position", position={x=-59.5,y=1359.5}}}
      end
    },
	---------------------------------------------------------
	-- /// DESERT (COAL) MINE AND CRATER (COPPER) MINE /// --
	---------------------------------------------------------
	{
      condition = story_elapsed_check(3),
    },
	{
      init = function()
		game.players[1].character.destructible = true
      end
    },
	{
      action = function()
	    set_goal({"goal-drill-desert"})
      end
    },
	{
      condition = function() return global.minning_drill_2.energy > 0 end,
      action = function()
        set_goal("")
      end
    },
	{
      action = function()
	    set_goal({"goal-drill-crater"})
      end
    },
	{
      condition = function() return global.minning_drill_3.energy > 0 end,
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
		game.show_message_dialog{text = {"msg-base-wait"}}
      end
    },
	-- bug attack wave
	{
      init = function()
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=382,y=1080}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=382,y=1081}})
        game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=382,y=1082}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=382,y=1083}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=382,y=1084}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=382,y=1085}})
        game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=382,y=1086}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=382,y=1087}})

      end
	},
	{
      init = function()
        game.players[1].surface.set_multi_command

        {
          command =
          {
            type=defines.command.attack,
            target=game.players[1].character,
            distraction=defines.distraction.by_enemy
          },
          unit_count = 20
        }
      end
	},
	-- bug attack wave ended
	{
	  condition = story_elapsed_check(2),
      action = function()
	    set_goal({"goal-wait"})
      end
    },
	{
      condition = story_elapsed_check(20),
    },
	----------------------------------------
	-- /// PIRATE TRAIN SECOND HIJACK /// --
	----------------------------------------
	{
	  init = function()
        game.surfaces[1].create_entity({name='straight-rail', force = "player", position={x=-337,y=387}})
      end
	},
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-14"}}
		game.show_message_dialog{text = {"msg-base-15"}}
      end
    },
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
        global.radar_speaker = game.surfaces[1].find_entities_filtered{area = {{84.5, 641.5}, {84.5, 641.5}}, name = "straight-rail", limit = 1}[1]
        if global.radar_speaker then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
				{
                  target = global.radar_speaker,
                  transition_time = 200,
                  time_to_wait = 300,
                  zoom = 0.8
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
      condition = story_elapsed_check(1),
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
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-16"}}
      end
    },
	{
      condition = story_elapsed_check(3),
    },
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-17"}}
      end
    },
	{
	  action = function()
	  for index, entity in pairs(global.intro_entities_pirate_train) do
        entity.minable = true
		entity.destructible = true
        end
      end
    },
	{
      condition = story_elapsed_check(2),
      action = function()
	    set_goal({"goal-hijack-enemy-again",0,1})
        global.units_killed = 0
      end
    },
    {
      init = function()
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "locomotive" and
		   event.entity.force.name == "enemy" then
          global.units_killed = global.units_killed + 1
		  set_goal({"goal-hijack-enemy-again",global.units_killed,1})
        end
      end,
      condition = function() return global.units_killed >= 1 end,
      action = function()
        set_goal("")
      end
    },
	{
      condition = story_elapsed_check(3),
    },
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-18"}}
		game.show_message_dialog{text = {"msg-base-19"}}
		game.show_message_dialog{text = {"msg-base-20"}}
		game.show_message_dialog{text = {"msg-base-21"}}
		game.show_message_dialog{text = {"msg-base-22"}}
      end
    },
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
        global.radar_market = game.surfaces[1].find_entities_filtered{name = "market", limit = 1}[1]
        if global.radar_market then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {

				{
                  target = global.radar_market,
                  transition_time = 250,
                  time_to_wait = 50,
                  zoom = 1.3
                },
				{
                  target = global.radar_market,
                  transition_time = 150,
                  time_to_wait = 200,
                  zoom = 1
                },
              },
              start_position = player.character.position,
              --start_zoom = 1
            }
          end
        end
      end,
      condition = story_elapsed_check(1),
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
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-23"}}
      end
    },
		-- bug attack wave
	{
      init = function()
        game.players[1].surface.set_multi_command

        {
          command =
          {
            type=defines.command.attack,
            target=game.players[1].character,
            distraction=defines.distraction.by_enemy
          },
          unit_count = 20
        }
      end
	},
	-- bug attack wave ended
	{
      action = function()
	    set_goal({"goal-get-train-to-smuggler"})
      end
    },
	{
      condition = function() return global.minning_smuggler.energy > 0 end,
      action = function()
        set_goal("")
      end
    },
	{
      condition = story_elapsed_check(1),
    },
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-24"}}
      end
    },
	{
      condition = story_elapsed_check(1),
    },
	{
      condition = story_elapsed_check(1),
	  update = (function()
        local only_update = false
        return function(event)
		  local depochest = game.get_entity_by_tag("depochest2")
          local resources1 = depochest.get_item_count("copper-ore") 
          set_goal
          (
            {
              "goal-get-train-to-smuggler2",
              resources1,
			  25
            },

            only_update
          )
          only_update = true
        end
      end)(),
      condition = function()
	    local depochest = game.get_entity_by_tag("depochest2")
        return 
              depochest.get_item_count("copper-ore") >= 25
        end,
      action = function()
        set_goal("")
		for index, entity in pairs(global.intro_entities_chest2) do
		entity.destructible = true
        end
      end
    },
	{
      condition = story_elapsed_check(1),
    },
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-25"}}
		game.show_message_dialog{text = {"msg-base-26"}}
      end
    },
	-------------------
	--/// ISLAND /// --
	-------------------
	{
      condition = story_elapsed_check(3),
    },
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-27"}}
		game.show_message_dialog{text = {"msg-base-28"}}
      end
    },
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
        global.radar_island = game.surfaces[1].find_entities_filtered{area = {{-309.5, 774.5}, {-309.5, 774.5}}, name = "big-electric-pole", limit = 1}[1]
        if global.radar_island then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {

				{
                  target = global.radar_island,
                  transition_time = 200,
                  time_to_wait = 75,
                  zoom = 1
                },
				{
                  target = global.radar_island,
                  transition_time = 150,
                  time_to_wait = 200,
                  zoom = 0.7
                },
              },
              start_position = player.character.position,
              --start_zoom = 1
            }
          end
        end
      end,
      condition = story_elapsed_check(1),
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
      action = function()
	    set_goal({"goal-drill-island"})
      end
    },
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
			game.forces.enemy.evolution_factor = .12
		elseif game.difficulty == defines.difficulty.normal then  
			game.forces.enemy.evolution_factor = .40
		elseif game.difficulty == defines.difficulty.hard then  
		    game.forces.enemy.evolution_factor = .69
        end
      end
    },
	{
      condition = function() return global.minning_drill_4.energy > 0 end,
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
		game.show_message_dialog{text = {"msg-base-29"}}
      end
    },
	{
      condition = story_elapsed_check(4),
    },
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-30"}}
      end
    },
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
        global.radar_lakeshore_pump = game.surfaces[1].find_entities_filtered{area = {{-101.5, 393.5}, {-101.5, 393.5}}, name = "straight-rail", limit = 1}[1]
		global.radar_lakeshore_pump2 = game.surfaces[1].find_entities_filtered{area = {{-85.5, 412.5}, {-85.5, 412.5}}, name = "straight-rail", limit = 1}[1]
        if global.radar_lakeshore_pump and global.radar_lakeshore_pump2 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {

				{
                  target = global.radar_lakeshore_pump,
                  transition_time = 175,
                  time_to_wait = 100,
                  zoom = 0.9
                },
				{
                  target = global.radar_lakeshore_pump2,
                  transition_time = 175,
                  time_to_wait = 200,
                  zoom = 0.6
                },
              },
              start_position = player.character.position,
              --start_zoom = 1
            }
          end
        end
      end,
      condition = story_elapsed_check(1),
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
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-31"}}
      end
    },

	-- bug attack wave
	{
      init = function()
        game.players[1].surface.set_multi_command

        {
          command =
          {
            type=defines.command.attack,
            target=game.players[1].character,
            distraction=defines.distraction.by_enemy
          },
          unit_count = 20
        }
      end
	},
	-- bug attack wave ended	
	
	
	------------------------------------
	--/// LAKESHORE OIL PUMPJACKS /// --
	------------------------------------

	{
      condition = story_elapsed_check(2),
    },
	{
      action = function()
	    set_goal({"goal-pumpjack-lakeshore"})
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
			game.forces.enemy.evolution_factor = .45
			game.map_settings.enemy_expansion.enabled = true
		elseif game.difficulty == defines.difficulty.hard then  
		    game.forces.enemy.evolution_factor = .75
			game.map_settings.enemy_expansion.enabled = true
        end
      end
    },
	{
      condition = function() return global.minning_drill_5.energy > 0 end,
      action = function()
        set_goal("")
      end
    },
	{
      condition = story_elapsed_check(3),
    },
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-wait"}}
      end
    },
	{
      action = function()
	    set_goal({"goal-wait"})
       end
    },
	-- bug attack wave
	{
      init = function()
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=0,y=400}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=0,y=401}})
        game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=0,y=402}})
		game.surfaces[1].create_entity({name='small-biter', force = "enemy", position={x=0,y=403}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=1,y=401}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=1,y=402}})
        game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=1,y=403}})
		game.surfaces[1].create_entity({name='medium-biter', force = "enemy", position={x=1,y=400}})

      end
	},
	{
      init = function()
        game.players[1].surface.set_multi_command

        {
          command =
          {
            type=defines.command.attack,
            target=game.players[1].character,
            distraction=defines.distraction.by_enemy
          },
          unit_count = 100
        }
      end
	},
	-- bug attack wave ended
	{
      condition = story_elapsed_check(40),
    },
	------------------------------------
	--/// BATTLE FOR SANCTUARY /// --
	------------------------------------
	{
      -- You will get access to another part of the map
	  init = function()
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-25.5,y=361.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-24.5,y=361.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-25.5,y=360.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-24.5,y=360.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-23.5,y=361.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-22.5,y=361.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-23.5,y=360.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-22.5,y=360.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-21.5,y=361.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-20.5,y=361.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-21.5,y=360.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-20.5,y=360.5}}})
		game.surfaces[1].create_entity({name='straight-rail', force = "player", position={x=-25,y=361}})
        game.surfaces[1].create_entity({name='straight-rail', force = "player", position={x=-21,y=361}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=197.5,y=461.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=200.5,y=460.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=200.5,y=461.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=201.5,y=460.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=201.5,y=461.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=202.5,y=460.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=202.5,y=461.5}}})
		game.surfaces[1].set_tiles({tiles={name='sand-1',position={x=282.5,y=411.5}}})
		game.surfaces[1].set_tiles({tiles={name='sand-1',position={x=282.5,y=412.5}}})
		game.surfaces[1].set_tiles({tiles={name='sand-1',position={x=283.5,y=411.5}}})
		game.surfaces[1].set_tiles({tiles={name='sand-1',position={x=283.5,y=412.5}}})
		game.surfaces[1].set_tiles({tiles={name='sand-1',position={x=284.5,y=411.5}}})
		game.surfaces[1].set_tiles({tiles={name='sand-1',position={x=284.5,y=412.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-314.5,y=280.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-314.5,y=281.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-314.5,y=288.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-314.5,y=289.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-313.5,y=280.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-313.5,y=281.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-313.5,y=288.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-313.5,y=289.5}}})
      end
	},
	{
      init = function()
        game.surfaces[1].create_entity({name='crash-site-fire-flame',position={x=92.5,y=131.5}})  
		game.surfaces[1].create_entity({name='crash-site-fire-flame',position={x=79.5,y=132.5}})   
		game.surfaces[1].create_entity({name='crash-site-explosion-smoke',position={x=92.5,y=131.5}})  
		game.surfaces[1].create_entity({name='crash-site-explosion-smoke',position={x=79.5,y=132.5}})  
		game.surfaces[1].create_entity({name='crash-site-fire-smoke',position={x=92.5,y=131.5}})  
		game.surfaces[1].create_entity({name='crash-site-fire-smoke',position={x=79.5,y=132.5}})  
      end 
    },
	{
      init = function()
        game.surfaces[1].create_entity({name='crash-site-fire-flame',position={x=116.5,y=123.5}})  
		game.surfaces[1].create_entity({name='crash-site-fire-flame',position={x=95.5,y=128.5}})  
		game.surfaces[1].create_entity({name='crash-site-explosion-smoke',position={x=116.5,y=123.5}})  
		game.surfaces[1].create_entity({name='crash-site-explosion-smoke',position={x=95.5,y=128.5}})  
		game.surfaces[1].create_entity({name='crash-site-fire-smoke',position={x=116.5,y=123.5}})  
		game.surfaces[1].create_entity({name='crash-site-fire-smoke',position={x=95.5,y=128.5}})  

      end 
    },
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-32"}}
		game.show_message_dialog{text = {"msg-base-33"}}
		
      end
    },
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
        global.radar_deadpole = game.surfaces[1].find_entities_filtered{area = {{-21.5, 358.5}, {-21.5, 358.5}}, name = "straight-rail", limit = 1}[1]
		global.radar_woodchest = game.surfaces[1].find_entities_filtered{area = {{-12.5, 326.5}, {-12.5, 326.5}}, name = "wooden-chest", limit = 1}[1]
		global.radar_biterspawn = game.surfaces[1].find_entities_filtered{area = {{80.5, 245.5}, {80.5, 245.5}}, name = "biter-spawner", limit = 1}[1]
		global.radar_railbase = game.surfaces[1].find_entities_filtered{area = {{99.5, 126.5}, {99.5, 126.5}}, name = "straight-rail", limit = 1}[1]
        if global.radar_deadpole and global.radar_woodchest and global.radar_biterspawn and global.radar_railbase then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {

				{
                  target = global.radar_deadpole,
                  transition_time = 150,
                  time_to_wait = 65,
                  zoom = 0.8
                },
				{
                  target = global.radar_woodchest,
                  transition_time = 180,
                  time_to_wait = 90,
                  zoom = 1
                },
				{
                  target = global.radar_biterspawn,
                  transition_time = 200,
                  time_to_wait = 140,
                  zoom = 0.5
                },
								{
                  target = global.radar_railbase,
                  transition_time = 180,
                  time_to_wait = 250,
                  zoom = 0.7
                },
              },
              start_position = player.character.position,
              --start_zoom = 1
            }
          end
        end
      end,
      condition = story_elapsed_check(1),
    },
	{
      condition = story_elapsed_check(3),
    },
	{
      init = function()
		game.players[1].character.destructible = true
      end
    },
	{
      condition = story_elapsed_check(1),
      action = function()
	    set_goal({"goal-destroy-spawners",0,22})
        global.units_killed = 0
      end
    },
	-- attack wave
	{
      init = function()
        game.players[1].surface.set_multi_command

        {
          command =
          {
            type=defines.command.attack,
            target=game.players[1].character,
            distraction=defines.distraction.by_enemy
          },
          unit_count = 20
        }
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "biter-spawner" or
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "spitter-spawner" then
          global.units_killed = global.units_killed + 1
		  set_goal({"goal-destroy-spawners",global.units_killed,22})
        end
      end,
      condition = function() return global.units_killed >= 22 end,
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
		game.show_message_dialog{text = {"msg-base-34"}}
		game.show_message_dialog{text = {"msg-base-35"}}
      end
    },
	{
      action = function()
	    set_goal({"goal-drill-sanctuary"})
      end
    },
	{
      condition = function() return global.minning_drill_6.energy > 0 end,
      action = function()
        set_goal("")
      end
    },
	------------------------------------
	--/// LAKESHORE POWER PLANT /// --
	------------------------------------
	{
	  action = function()
	  for index, entity in pairs(global.intro_entities_behemoth) do
		entity.destructible = true
        end
      end
    },
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-36"}}
		game.show_message_dialog{text = {"msg-base-37"}}
      end
    },
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
        global.radar_reactor = game.surfaces[1].find_entities_filtered{area = {{148.5, 354.5}, {148.5, 354.5}}, name = "behemoth-worm-turret", limit = 1}[1]
		global.radar_reactor2 = game.surfaces[1].find_entities_filtered{area = {{173.5, 411.5}, {173.5, 411.5}}, name = "behemoth-worm-turret", limit = 1}[1]
        if global.radar_reactor and global.radar_reactor2 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
				{
                  target = global.radar_reactor,
                  transition_time = 150,
                  time_to_wait = 100,
                  zoom = 0.7
                },
				{
                  target = global.radar_reactor2,
                  transition_time = 200,
                  time_to_wait = 150,
                  zoom = 0.8
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
      condition = story_elapsed_check(1),
    },
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-38"}}
		game.show_message_dialog{text = {"msg-base-39"}}
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
      condition = story_elapsed_check(2),
      action = function()
	    set_goal({"goal-destroy-behemoth",0,3})
        global.units_killed = 0
      end
    },

	-- bug attack wave
	{
      init = function()
        game.players[1].surface.set_multi_command

        {
          command =
          {
            type=defines.command.attack,
            target=game.players[1].character,
            distraction=defines.distraction.by_enemy
          },
          unit_count = 20
        }
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "behemoth-worm-turret" then
          global.units_killed = global.units_killed + 1
		  set_goal({"goal-destroy-behemoth",global.units_killed,3})
        end
      end,
      condition = function() return global.units_killed >= 3 end,
      action = function()
        set_goal("")
      end
    },
	{
      condition = story_elapsed_check(2),
    },
	{
      action = function()
	    set_goal({"goal-drill-lakeshore"})
      end
    },
	{
      condition = function() return global.minning_drill_7.energy > 0 end, -- I dont know why isnt working
      action = function()
        set_goal("")
      end
    },
	{
	  action = function()
        set_goal("")
		for index, entity in pairs(global.intro_entities_mining) do
		entity.destructible = true
        end
	  end
	},
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-40"}}
      end
    },
	{
      action = function()
	    set_goal({"goal-wait"})
      end
    },
	{
      condition = story_elapsed_check(35),
    },
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-41"}}
      end
    },


	------------------------------------
	--/// 3 MINES & BATTLE /// --
	------------------------------------
	
	-- Enemy trains start moving
	{
      condition = story_elapsed_check(1),
    },
	{
	  action = function()
        local outpost_chest = game.get_entity_by_tag("enemy_outpost_power")
        outpost_chest.insert{name = "coal", count = 100}
      end
    },
	{
      init = function()
	    game.surfaces[1].create_entity({name='straight-rail', force = "enemy", position={x=-361,y=-1311}})
      end
	},
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
	    global.radar_grass = game.surfaces[1].find_entities_filtered{area = {{285.5, -186.5}, {285.5, -186.5}}, name = "electric-mining-drill", limit = 1}[1]
        global.radar_grass2 = game.surfaces[1].find_entities_filtered{area = {{249.5, -188.5}, {249.5, -188.5}}, name = "electric-mining-drill", limit = 1}[1]
		if global.radar_grass and global.radar_grass2 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
                {
                  target = global.radar_grass,
                  transition_time = 200,
                  time_to_wait = 100,
				  zoom = 0.8
                },
				{
                  target = global.radar_grass2,
                  transition_time = 150,
                  time_to_wait = 100,
                  zoom = 0.8
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
      init = function()
		global.radar_bridge = game.surfaces[1].find_entities_filtered{area = {{249.5, -188.5}, {249.5, -188.5}}, name = "electric-mining-drill", limit = 1}[1]
		global.radar_bridge2 = game.surfaces[1].find_entities_filtered{area = {{-164.5, -280.5}, {-164.5, -280.5}}, name = "straight-rail", limit = 1}[1]
		global.radar_bridge3 = game.surfaces[1].find_entities_filtered{area = {{-207.5, -361.5}, {-207.5, -361.5}}, name = "electric-mining-drill", limit = 1}[1]
        if global.radar_bridge and global.radar_bridge2 and global.radar_bridge3 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
				{
                  target = global.radar_bridge,
                  transition_time = 0,
                  time_to_wait = 100,
                  zoom = 0.8
                },
				{
                  target = global.radar_bridge2,
                  transition_time = 200,
                  time_to_wait = 100,
                  zoom = 1
                },
				{
                  target = global.radar_bridge3,
                  transition_time = 150,
                  time_to_wait = 100,
                  zoom = 0.8
                },
              },
              start_position = global.radar_bridge.position,
              start_zoom = 0.8
            }
          end
        end
      end,
      condition = story_elapsed_check(0),
      action =
      function()
		game.show_message_dialog{text = {"msg-base-42"}, point_to={type="position", position={x=249.5,y=-188.5}}}
      end
    },
	{
      init = function()
		global.radar_facilitybor = game.surfaces[1].find_entities_filtered{area = {{-207.5, -361.5}, {-207.5, -361.5}}, name = "electric-mining-drill", limit = 1}[1]
		global.radar_facilitybor2 = game.surfaces[1].find_entities_filtered{area = {{299.5, -409.5}, {299.5, -409.5}}, name = "electric-mining-drill", limit = 1}[1]
		global.radar_facilitybor3 = game.surfaces[1].find_entities_filtered{area = {{353.5, -410.5}, {353.5, -410.5}}, name = "roboport", limit = 1}[1]
        if global.radar_facilitybor and global.radar_facilitybor2 and global.radar_facilitybor3 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
				{
                  target = global.radar_facilitybor,
                  transition_time = 0,
                  time_to_wait = 100,
                  zoom = 0.8
                },
				{
                  target = global.radar_facilitybor2,
                  transition_time = 200,
                  time_to_wait = 100,
                  zoom = 0.5
                },
				{
                  target = global.radar_facilitybor3,
                  transition_time = 100,
                  time_to_wait = 100,
                  zoom = 1
                },
              },
              start_position = global.radar_facilitybor.position,
              start_zoom = 0.8
            }
          end
        end
      end,
      condition = story_elapsed_check(0),
      action =
      function()
		game.show_message_dialog{text = {"msg-base-43"}, point_to={type="position", position={x=-207.5,y=-361.5}}}
      end
    },
	{
      init = function()
		global.radar_facilityend = game.surfaces[1].find_entities_filtered{area = {{353.5, -410.5}, {353.5, -410.5}}, name = "roboport", limit = 1}[1]
        if global.radar_facilityend then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
				{
                  target = global.radar_facilityend,
                  transition_time = 0,
                  time_to_wait = 100,
                  zoom = 1
                },
				{
                  target = player.character,
                  transition_time = 150,
                  time_to_wait = 0,
                  zoom = 1
                },
              },
              start_position = global.radar_facilityend.position,
              start_zoom = 1
            }
          end
        end
      end,
      condition = story_elapsed_check(0),
      action =
      function()
		game.show_message_dialog{text = {"msg-base-44"}, point_to={type="position", position={x=353.5,y=-410.5}}}
      end
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
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-44.1"}}
      end
    },
	-- This script I need to change in the future
	{
      action = function()
	    set_goal({"goal-drills-all"})
      end
    },
	{
      condition = function() return global.mining_again_1.energy > 0 end,
	  action = function()
        set_goal({"goal-drills-2"})
      end
	},
	{
	  condition = function() return global.mining_again_2.energy > 0 and global.mining_again_1.energy > 0 end,
	  action = function()
        set_goal({"goal-drills-3"})
      end
	},
	{
	  condition = function() return global.mining_again_2.energy > 0 and global.mining_again_1.energy > 0 and global.mining_again_3.energy > 0 end,
      action = function()
        set_goal("")
      end
    },
	-- Very bad script above
	{
      condition = story_elapsed_check(2),
    },
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-45"}}
      end
    },
	{
      -- You will get access to another part of the map
	  init = function()
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=70.5,y=-456.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=71.5,y=-456.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=72.5,y=-456.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=73.5,y=-456.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=74.5,y=-456.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=75.5,y=-456.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=76.5,y=-456.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=70.5,y=-455.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=71.5,y=-455.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=72.5,y=-455.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=73.5,y=-455.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=74.5,y=-455.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=75.5,y=-455.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=76.5,y=-455.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=70.5,y=-454.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=71.5,y=-454.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=72.5,y=-454.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=73.5,y=-454.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=74.5,y=-454.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=75.5,y=-454.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=76.5,y=-454.5}}})
		
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-64.5,y=-460.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-63.5,y=-460.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-62.5,y=-460.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-61.5,y=-460.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-60.5,y=-460.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-64.5,y=-459.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-63.5,y=-459.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-62.5,y=-459.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-61.5,y=-459.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-60.5,y=-459.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-64.5,y=-458.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-63.5,y=-458.5}}})
        game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-62.5,y=-458.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-61.5,y=-458.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-60.5,y=-458.5}}})
		
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=330.5,y=-485.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=331.5,y=-485.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=332.5,y=-485.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=333.5,y=-485.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=334.5,y=-485.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=335.5,y=-485.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=336.5,y=-485.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=330.5,y=-484.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=331.5,y=-484.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=332.5,y=-484.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=333.5,y=-484.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=334.5,y=-484.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=335.5,y=-484.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=336.5,y=-484.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=330.5,y=-483.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=331.5,y=-483.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=332.5,y=-483.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=333.5,y=-483.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=334.5,y=-483.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=335.5,y=-483.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=336.5,y=-483.5}}})
		
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-182.5,y=-442.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-181.5,y=-442.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-180.5,y=-442.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-179.5,y=-442.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-178.5,y=-442.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-177.5,y=-442.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-182.5,y=-441.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-181.5,y=-441.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-180.5,y=-441.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-179.5,y=-441.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-178.5,y=-441.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-177.5,y=-441.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-182.5,y=-440.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-181.5,y=-440.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-180.5,y=-440.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-179.5,y=-440.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-178.5,y=-440.5}}})
				
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-329.5,y=-483.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-328.5,y=-483.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-327.5,y=-483.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-326.5,y=-483.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-325.5,y=-483.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-329.5,y=-482.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-328.5,y=-482.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-327.5,y=-482.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-326.5,y=-482.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-325.5,y=-482.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-329.5,y=-481.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-328.5,y=-481.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-327.5,y=-481.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-326.5,y=-481.5}}})
		game.surfaces[1].set_tiles({tiles={name='grass-4',position={x=-325.5,y=-481.5}}})
      end
	},
	{
      action = function()
        set_goal("")
		for index, entity in pairs(global.intro_entities_wall) do
        entity.minable = true
		entity.destructible = true
        end
	  end
    },
	{
      action = function()
		set_goal({"goal-wait"})
      end
    },
	{
      condition = story_elapsed_check(35),
    },

	
	----------------------------------------------
	--/// PINEHILL PUMPJACKS, COAL & PRISON /// --
	----------------------------------------------
	
	
	
	-- This will activate enemy/friendly bases

	{
	  action = function()
        local base_chest = game.get_entity_by_tag("enemy_base_power")
        base_chest.insert{name = "rocket-fuel", count = 150}
      end
    },
	{
	  action = function()
        local friendly_chest = game.get_entity_by_tag("friendly_base_power")
        friendly_chest.insert{name = "uranium-fuel-cell", count = 30}
      end
    },
	{
	  action = function()
        set_goal("")
		for index, entity in pairs(global.intro_entities_base_chest) do
		entity.destructible = true
        end
	  end
	},
	-- this will destroy fuel chest for trains, because its not longer needed (I'm worry for exploits)
	{ 
      init = function()
	   local fuelchest = game.get_entity_by_tag("unlimited-fuel")
	   global.fuelchest = fuelchest
	  end 
	},
	{ 
      init = function()  
	   if global.fuelchest and global.fuelchest.valid
           then global.fuelchest.die()
        end
      end
    },
	-- All enemy/friendly bases are now active and producing (not fighting each other yet)
	-- If you destroy all bitters nest and also nests in the pirate fortress, you will no longer have the problem with bitters on the map
	{
      condition = story_elapsed_check(2),
    },
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-46"}}
      end
    },
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
        global.radar_pinehill = game.surfaces[1].find_entities_filtered{area = {{45.5, -475.5}, {45.5, -475.5}}, name = "straight-rail", limit = 1}[1]
		global.radar_pinehill2 = game.surfaces[1].find_entities_filtered{area = {{0.5, -573.5}, {0.5, -573.5}}, name = "straight-rail", limit = 1}[1]
		global.radar_pinehill3 = game.surfaces[1].find_entities_filtered{area = {{110.5, -623.5}, {110.5, -623.5}}, name = "straight-rail", limit = 1}[1]
        if global.radar_pinehill and global.radar_pinehill2 and global.radar_pinehill3 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {

				{
                  target = global.radar_pinehill,
                  transition_time = 200,
                  time_to_wait = 150,
                  zoom = 0.7
                },
				{
                  target = global.radar_pinehill2,
                  transition_time = 150,
                  time_to_wait = 150,
                  zoom = 0.5
                },
				{
                  target = global.radar_pinehill3,
                  transition_time = 150,
                  time_to_wait = 200,
                  zoom = 0.7
                },
              },
              start_position = player.character.position,
              --start_zoom = 1
            }
          end
        end
      end,
      condition = story_elapsed_check(1),
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
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-47"}}
      end
    },
	{
      action = function()
	    set_goal({"goal-pump-hill"})
      end
    },
	-- bug attack wave
	{
      init = function()
        game.players[1].surface.set_multi_command

        {
          command =
          {
            type=defines.command.attack,
            target=game.players[1].character,
            distraction=defines.distraction.by_enemy
          },
          unit_count = 100
        }
      end
	},
	-- bug attack wave ended
	{
      condition = function() return global.mining_again_4.energy > 0 end,
      action = function()
        set_goal("")
      end
    },
    {
	  action = function()
        set_goal("")
		for index, entity in pairs(global.intro_entities_mining_again) do
		entity.destructible = true
        end
	  end
	},
	{
      condition = story_elapsed_check(2),
    },
	-- enemy and friendly base start fighting each other
	
	{
      init = function()
		game.surfaces[1].create_entity({name='big-electric-pole', force = "enemy", position={x=-291,y=-1232}})
		game.surfaces[1].create_entity({name='big-electric-pole', force = "enemy", position={x=-245,y=-1262}})
        game.surfaces[1].create_entity({name='big-electric-pole', force = "enemy", position={x=-114,y=-1397}})
		game.surfaces[1].create_entity({name='big-electric-pole', force = "base", position={x=55,y=-1484}})
		game.surfaces[1].create_entity({name='big-electric-pole', force = "base", position={x=38,y=-1413}})
		game.surfaces[1].create_entity({name='substation', force = "base", position={x=31,y=-1445}})
		game.surfaces[1].create_entity({name='pipe', force = "base", position={x=26.5,y=-1470.5}})
		game.surfaces[1].create_entity({name='pipe', force = "base", position={x=45.5,y=-1351.5}})
		game.surfaces[1].create_entity({name='radar', force = "player", position={x=49.5,y=-1408.5}})
      end
	},
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-48"}}
		game.show_message_dialog{text = {"msg-base-49"}}
      end
    },
	-------------------------------------------
	--/// FINAL BATTLE FOR CROSSROADS HQ /// --
	-------------------------------------------
	{
      condition = story_elapsed_check(2),
    },
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-50"}}
		game.show_message_dialog{text = {"msg-base-51"}}
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
        global.radar_allybase1 = game.surfaces[1].find_entities_filtered{name = "artillery-turret", limit = 1}[1]
        if global.radar_allybase1 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {

				{
                  target = global.radar_allybase1,
                  transition_time = 300,
                  time_to_wait = 50,
                  zoom = 0.9
                },
				{
                  target = global.radar_allybase1,
                  transition_time = 200,
                  time_to_wait = 300,
                  zoom = 0.6
                },
              },
              start_position = player.character.position
              --start_zoom = 1
            }
          end
        end
      end,
      condition = story_elapsed_check(0),
    },
	{
      init = function()
        global.radar_roboport = game.surfaces[1].find_entities_filtered{name = "artillery-turret", limit = 1}[1]
		global.radar_roboport2 = game.surfaces[1].find_entities_filtered{area = {{174.5, -1278.5}, {174.5, -1278}}, name = "roboport", limit = 1}[1]
        if global.radar_roboport and global.radar_roboport2 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
				{
                  target = global.radar_roboport,
                  transition_time = 10,
                  time_to_wait = 10,
                  zoom = 0.6
                },
				{
                  target = global.radar_roboport2,
                  transition_time = 200,
                  time_to_wait = 100,
                  zoom = 1
                },
              },
              start_position = global.radar_roboport.position,
              start_zoom = 0.6
            }
          end
        end
      end,
      condition = story_elapsed_check(0),
    },
	{
      init = function()
		global.radar_stillwater = game.surfaces[1].find_entities_filtered{area = {{174.5, -1278.5}, {174.5, -1278.5}}, name = "roboport", limit = 1}[1]
		global.radar_stillwater2 = game.surfaces[1].find_entities_filtered{area = {{58.5, -1062.5}, {58.5, -1062.5}}, name = "straight-rail", limit = 1}[1]
        if global.radar_stillwater and global.radar_stillwater2 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
				{
                  target = global.radar_stillwater,
                  transition_time = 0,
                  time_to_wait = 100,
                  zoom = 1
                },
				{
                  target = global.radar_stillwater2,
                  transition_time = 200,
                  time_to_wait = 200,
                  zoom = 0.5
                },
			    {
                  target = player.character,
                  transition_time = 150,
                  time_to_wait = 0,
                  zoom = 1
                },
              },
              start_position = global.radar_stillwater.position,
              start_zoom = 1
            }
          end
        end
      end,
      condition = story_elapsed_check(0),
	  	  action =
      function()
		game.show_message_dialog{text = {"msg-base-52"}, point_to={type="position", position={x=174.5,y=-1278.5}}}
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
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-53"}}
		game.show_message_dialog{text = {"msg-base-54"}}
      end
    },
	{
      condition = story_elapsed_check(3),
    },
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-55"}}
		game.show_message_dialog{text = {"msg-base-56"}}
      end
    },
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
		global.radar_fortress = game.surfaces[1].find_entities_filtered{area = {{-178.5, -780.5}, {-178.5, -780.5}}, name = "biter-spawner", limit = 1}[1]
        if global.radar_fortress then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {

				{
                  target = global.radar_fortress,
                  transition_time = 150,
                  time_to_wait = 50,
                  zoom = 1
                },
				{
                  target = global.radar_fortress,
                  transition_time = 150,
                  time_to_wait = 200,
                  zoom = 0.7
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
      condition = story_elapsed_check(0),
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
      action = function()
	    set_goal({"goal-roboport"})
      end
    },
	{
      condition = story_elapsed_check(7),
    },
	-- bug attack wave
	{
      init = function()
        game.players[1].surface.set_multi_command

        {
          command =
          {
            type=defines.command.attack,
            target=game.players[1].character,
            distraction=defines.distraction.by_enemy
          },
          unit_count = 150
        }
      end
	},
	-- bug attack wave ended
	{
      condition = function() return global.roboport_1.energy > 0 end,
      action = function()
        set_goal("")
      end
    },
	{
	  action = function()
        set_goal("")
		for index, entity in pairs(global.intro_entities_base_final) do
		entity.destructible = true
        end
	  end
	},	
	{
	  condition = story_elapsed_check(3),
      action =
      function()
	    set_goal("")
      end
    },
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-56.1"}}
      end
    },
	{
      condition = story_elapsed_check(3),
    },
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-57"}}
		game.show_message_dialog{text = {"msg-base-58"}}
      end
    },
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
		global.radar_piratebase = game.surfaces[1].find_entities_filtered{area = {{-243.5, -1190.5}, {-243.5, -1190.5}}, name = "straight-rail", limit = 1}[1]
        if global.radar_piratebase then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {

				{
                  target = global.radar_piratebase,
                  transition_time = 200,
                  time_to_wait = 100,
                  zoom = 0.8
                },
				{
                  target = global.radar_piratebase,
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
      condition = story_elapsed_check(0),
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
      action = function()
	    think("msg4")
      end	  
    },
    {
      condition = story_elapsed_check(2),
    },
	-- bug attack wave
	{
      init = function()
        game.players[1].surface.set_multi_command

        {
          command =
          {
            type=defines.command.attack,
            target=game.players[1].character,
            distraction=defines.distraction.by_enemy
          },
          unit_count = 150
        }
      end
	},
	-- bug attack wave ended
	{
      update = (function()
        local only_update = false
        return function(event)
          local shells = game.players[1].character.get_item_count("artillery-shell")
          set_goal
          (
            {
              "goal-steal-shells",
              shells,
              20
            },
            only_update
          )
          only_update = true
        end
      end)(),
      condition = function()
        return 
               game.players[1].character.get_item_count("artillery-shell") >= 20
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
		game.show_message_dialog{text = {"msg-base-59"}}
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
		  local dockchest = game.get_entity_by_tag("shell_storage")
          local resources1 = dockchest.get_item_count("artillery-shell") 
          set_goal
          (
            {
              "goal-load-shells",
              resources1,
			  1
            },

            only_update
          )
          only_update = true
        end
      end)(),
      condition = function()
	    local dockchest = game.get_entity_by_tag("shell_storage")
        return 
              dockchest.get_item_count("artillery-shell") >= 1
        end
    },
	-------------------
	--/// ENDING /// --
	-------------------
	{
      condition = story_elapsed_check(5),
    },
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-60"}}
		game.show_message_dialog{text = {"msg-base-61"}}
      end
    },
	{
      condition = story_elapsed_check(1),
	  update = (function()
        local only_update = false
        return function(event)
		  local artchest = game.get_entity_by_tag("art-insert-chest")
          local resources1 = artchest.get_item_count("artillery-shell") 
          set_goal
          (
            {
              "goal-wait2",
              resources1,
			  1
            },

            only_update
          )
          only_update = true
        end
      end)(),
      condition = function()
	    local artchest = game.get_entity_by_tag("art-insert-chest")
        return 
              artchest.get_item_count("artillery-shell") >= 1
        end		
    },
	{
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
        global.radar_final = game.surfaces[1].find_entities_filtered{name = "artillery-turret", limit = 1}[1]
		global.radar_final2 = game.surfaces[1].find_entities_filtered{name = "medium-small-remnants", limit = 1}[1]
        if global.radar_final and global.radar_final2 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {

				{
                  target = global.radar_final,
                  transition_time = 200,
                  time_to_wait = 200,
                  zoom = 0.9
                },
				{
                  target = global.radar_final2,
                  transition_time = 800,
                  time_to_wait = 400,
                  zoom = 0.3
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
      condition = story_elapsed_check(1),
    },	
	{
      condition = story_elapsed_check(3),
    },
	{
      init = function()
		game.players[1].character.destructible = true
      end
    },
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-62"}}
      end
    },
	{
      action =
      function()
        if game.difficulty == defines.difficulty.easy then
			game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-08")}) -- YOU WIN THE GAME
		elseif game.difficulty == defines.difficulty.normal then  
			game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-08")}) -- YOU WIN THE GAME
		elseif game.difficulty == defines.difficulty.hard then  
		    game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-08")}) -- YOU WIN THE GAME
        end
      end
    },	
  }
}

story_init_helpers(story_table)


script.on_init(function()
  -- game.map_settings.enemy_expansion.enabled = false
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
  defines.events.on_gui_click,
  defines.events.on_player_died
  

} 
 
 
 -- tahle funkce je k ho***
-- function check_research_hints()
  -- if game.players[1] == nil then
    -- return
  -- end
  -- if global.research_hint == nil and game.players[1].force.current_research ~= nil then
    -- global.research_hint = true
  -- end
-- end

  
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

