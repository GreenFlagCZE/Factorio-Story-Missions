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
	if  event.name == defines.events.on_player_died or 
	    event.name == defines.events.on_entity_died and
        event.entity.name == "locomotive" then
		game.set_game_state({game_finished=true, player_won=false, can_continue=false})
		end
  end
  
  
local function on_configuration_changed()
	game.reload_script()
end

-- MAP REVEAL POINT OF INTEREST DURING THE MISSION
local red_enemy1 = {-726.5, -440.5}
script.on_init(function()
  global.story = story_init()
  game.forces.player.set_spawn_position(red_enemy1, 1)
end)
local chart_areas1 = function()
  local surface = game.surfaces[1]
  local force = game.forces.player
  for k, entity in pairs (surface.find_entities_filtered{force = force, area = {{-500, -250},{500, 250}}}) do
    local position = entity.position
   -- force.chart(surface, {{position.x - 16, position.y - 16}, {position.x + 16, position.y + 16}})
  end
  force.chart(surface, {{red_enemy1[1] - 25, red_enemy1[2] - 25}, {red_enemy1[1] + 25, red_enemy1[2] + 25}})
end
local chart_tag1 = function()
  local surface = game.surfaces[1]
  local force = game.forces.player
  for k, entity in pairs (surface.find_entities_filtered{force = force, area = {{-726.5, -440.5},{-726.5, -440.5}}}) do
    local position = entity.position
   --force.add_chart_tag (surface, {position = {-833.5, 101.5}, icon = {type="item", name="radar"}, text = "control unit"})
   game.print(string.format("[gps=%s, %s]", position.x, position.y))  		
  end
end

local on_player_created = function(event)

  local player = game.players[1]

  player.force.enable_research()
  game.forces.player.disable_all_prototypes()
  game.map_settings.enemy_expansion.enabled = false
  --game.forces.player.reset_technology_effects()
  --game.forces.player.reset()
  game.forces.player.research_queue_enabled = true
  
  global.centrifuges1 = game.get_entity_by_tag("centrifuge1")
  global.centrifuges2 = game.get_entity_by_tag("centrifuge2")
  global.centrifuges3 = game.get_entity_by_tag("centrifuge3")
  global.centrifuges4 = game.get_entity_by_tag("centrifuge4")
  global.centrifuges5 = game.get_entity_by_tag("centrifuge5")
  global.centrifuges6 = game.get_entity_by_tag("centrifuge6")
  global.centrifuges7 = game.get_entity_by_tag("centrifuge7")
  global.centrifuges8 = game.get_entity_by_tag("centrifuge8")
  global.centrifuges9 = game.get_entity_by_tag("centrifuge9")
  local entities =
  {
    global.centrifuges1,
	global.centrifuges2,
	global.centrifuges3,
	global.centrifuges4,
	global.centrifuges5,
	global.centrifuges6,
	global.centrifuges7,
	global.centrifuges8,
	global.centrifuges9
  }
  for index, entity in pairs(entities) do
    entity.destructible = false
  end
  global.intro_entities = entities
  
  local recipe_list = player.force.recipes
  recipe_list["pistol"].enabled = true
  recipe_list["light-armor"].enabled = true
  recipe_list["heavy-armor"].enabled = true
  recipe_list["iron-plate"].enabled = true
  recipe_list["copper-plate"].enabled = true
  recipe_list["steel-plate"].enabled = true
  recipe_list["repair-pack"].enabled = true
  recipe_list["solar-panel-equipment"].enabled = false
  recipe_list["rocket"].enabled = false
  game.players[1].clear_recipe_notifications()
  
  
  local technology_list = game.forces.player.technologies  
  
    -- enabled
  technology_list["night-vision-equipment"].enabled = true
  technology_list["personal-laser-defense-equipment"].enabled = true
  technology_list["exoskeleton-equipment"].enabled = true
  technology_list["solar-panel-equipment"].researched = true
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
  
  
  -- researched
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
  technology_list["engine"].researched = true 
  technology_list["fluid-handling"].researched = true 
  technology_list["oil-processing"].researched = true
  technology_list["logistics"].researched = true
  technology_list["heavy-armor"].researched = true
  technology_list["steel-axe"].researched = true 
  technology_list["military-2"].researched = true
  technology_list["chemical-science-pack"].researched = true
  technology_list["military-science-pack"].researched = true 
  technology_list["logistics-2"].researched = true
  technology_list["advanced-material-processing"].researched = true
  technology_list["solar-energy"].researched = true
  technology_list["laser"].researched = true
  technology_list["flamethrower"].researched = true
  technology_list["flammables"].researched = true
  technology_list["modules"].researched = true
  technology_list["speed-module"].researched = true
  technology_list["effectivity-module"].researched = true
  technology_list["productivity-module"].researched = true
  technology_list["speed-module-2"].researched = true
  technology_list["effectivity-module-2"].researched = true
  technology_list["productivity-module-2"].researched = true
  technology_list["speed-module-3"].researched = true
  technology_list["effectivity-module-3"].researched = true
  technology_list["productivity-module-3"].researched = true
  technology_list["sulfur-processing"].researched = true
  technology_list["toolbelt"].researched = true
  technology_list["advanced-electronics"].researched = true
  technology_list["advanced-electronics-2"].researched = true
  technology_list["explosives"].researched = true
  technology_list["land-mine"].researched = true
  technology_list["electric-energy-accumulators"].researched = true
  technology_list["laser-turret"].researched = true
  technology_list["tank"].researched = true
  technology_list["circuit-network"].researched = true
  technology_list["military-3"].researched = true
  technology_list["railway"].researched = true
  technology_list["automated-rail-transportation"].researched = true
  technology_list["rail-signals"].researched = true
  technology_list["automobilism"].researched = true
  technology_list["gate"].researched = true
  technology_list["rocketry"].researched = true
  technology_list["battery"].researched = true
  technology_list["plastics"].researched = true
  technology_list["fluid-wagon"].researched = true
  technology_list["stack-inserter"].researched = true
  technology_list["explosive-rocketry"].researched = true 
  technology_list["utility-science-pack"].researched = true
  technology_list["military-4"].researched = true
  technology_list["production-science-pack"].researched = true
  technology_list["automation-3"].researched = true  
  technology_list["advanced-material-processing-2"].researched = true  
  technology_list["advanced-oil-processing"].researched = true  
  technology_list["uranium-processing"].researched = true
  technology_list["lubricant"].researched = true
  technology_list["rocket-fuel"].researched = true 
  technology_list["kovarex-enrichment-process"].researched = true 
  technology_list["electric-engine"].researched = true  
  technology_list["robotics"].researched = true 
  technology_list["low-density-structure"].researched = true  

  --blocked tech
  technology_list["cliff-explosives"].enabled = false
  technology_list["construction-robotics"].enabled = false
  technology_list["landfill"].enabled = false
  technology_list["personal-roboport-equipment"].enabled = false
  technology_list["nuclear-fuel-reprocessing"].enabled = false
  technology_list["nuclear-power"].enabled = false
  technology_list["artillery"].enabled = false
  technology_list["atomic-bomb"].enabled = false

  technology_list["rocket-control-unit"].enabled = false
  technology_list["logistic-system"].enabled = false
  technology_list["logistic-robotics"].enabled = false

  technology_list["spidertron"].enabled = false




  
  -- tech upgrades
  technology_list["braking-force-1"].researched = true
  technology_list["braking-force-2"].enabled = false
  technology_list["energy-weapons-damage-1"].researched = true
  technology_list["energy-weapons-damage-2"].researched = true
  technology_list["energy-weapons-damage-3"].enabled = true
  technology_list["energy-weapons-damage-4"].enabled = false
  technology_list["inserter-capacity-bonus-1"].researched = true
  technology_list["inserter-capacity-bonus-2"].enabled = false
  technology_list["inserter-capacity-bonus-3"].enabled = false
  technology_list["laser-shooting-speed-1"].researched = true
  technology_list["laser-shooting-speed-2"].enabled = true
  technology_list["laser-shooting-speed-3"].enabled = true
  technology_list["stronger-explosives-1"].researched = true
  technology_list["stronger-explosives-2"].enabled = true
  technology_list["stronger-explosives-3"].enabled = true
  technology_list["physical-projectile-damage-1"].researched = true
  technology_list["physical-projectile-damage-2"].enabled = true
  technology_list["physical-projectile-damage-3"].enabled = true
  technology_list["physical-projectile-damage-4"].enabled = true
  technology_list["physical-projectile-damage-5"].enabled = true
  technology_list["refined-flammables-1"].researched = true
  technology_list["refined-flammables-2"].enabled = true
  technology_list["refined-flammables-3"].enabled = true
  technology_list["research-speed-1"].researched = true
  technology_list["research-speed-2"].researched = true
  technology_list["research-speed-3"].researched = true
  technology_list["research-speed-4"].researched = true
  technology_list["research-speed-5"].researched = true
  technology_list["research-speed-6"].researched = true
  technology_list["mining-productivity-1"].enabled = false
  technology_list["mining-productivity-2"].enabled = false
  technology_list["weapon-shooting-speed-1"].researched = true
  technology_list["weapon-shooting-speed-2"].enabled = true
  technology_list["weapon-shooting-speed-3"].enabled = true
  technology_list["weapon-shooting-speed-4"].enabled = true
  technology_list["worker-robots-speed-1"].enabled = false
  technology_list["worker-robots-speed-2"].enabled = false
  technology_list["worker-robots-storage-1"].enabled = false
  technology_list["worker-robots-storage-2"].enabled = false
  technology_list["artillery-shell-range-1"].enabled = false
  technology_list["artillery-shell-speed-1"].enabled = false
  technology_list["follower-robot-count-1"].enabled = true
  technology_list["follower-robot-count-2"].enabled = true


end



local story_table =
{
  {
    {
      init = function()
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
			      target = player.character,
                  transition_time = 1,
                  time_to_wait = 1,
                  zoom = 4 
				},
			  },
              start_position = player.character.position,
              start_zoom = 4
            }
        end
        -- game.play_sound({path = "utility/game_won"})
      end
    },
	-------------------------
	-- /// INITIATION  /// --
	-------------------------
    {
	  
      action = function()
      local character = game.players[1]
		character.insert{name = "pistol", count = 1}
		character.insert{name = "firearm-magazine", count = 33}
		character.insert{name = "grenade", count = 2}
        character.insert{name = "light-armor", count = 1}
		character.insert{name = "repair-pack", count = 1} 
		character.insert{name = "solar-panel-equipment", count = 2}
		character.insert{name = "coal", count = 12}
		character.insert{name = "iron-ore", count = 32}
		character.insert{name = "copper-ore", count = 25}
	  local recipe_list = game.players[1].force.recipes
	  recipe_list["shotgun"].enabled = true
      end
    },
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
		    character.insert{name = "submachine-gun", count = 1}
		    character.insert{name = "piercing-rounds-magazine", count = 120}
			character.insert{name = "firearm-magazine", count = 112}
			character.insert{name = "laser-turret", count = 6}
			character.insert{name = "gun-turret", count = 4}
			character.insert{name = "iron-ore", count = 182}
		    character.insert{name = "copper-ore", count = 75}
			character.insert{name = "explosive-rocket", count = 65}
			character.insert{name = "land-mine", count = 35}
			character.insert{name = "raw-fish", count = 32} 
			character.insert{name = "energy-shield-equipment", count = 1}
			character.insert{name = "battery-mk2-equipment", count = 1}	
            character.insert{name = "solar-panel-equipment", count = 4}	
			
			game.map_settings.enemy_evolution.enabled = false
			game.forces.enemy.evolution_factor = .00
			
		elseif game.difficulty == defines.difficulty.normal then  
		    character.insert{name = "piercing-rounds-magazine", count = 20}
			game.map_settings.enemy_evolution.enabled = true
			game.forces.enemy.evolution_factor = .20
			
		elseif game.difficulty == defines.difficulty.hard then  
		    game.map_settings.enemy_evolution.enabled = true
		    game.forces.enemy.evolution_factor = .60
        end
      end
    },
	{
      condition = story_elapsed_check(2),
      action =
      function()
	    game.show_message_dialog{text = {"msg-base-1"}}
        game.show_message_dialog{text = {"msg-base-2"}}
      end
	},
	{
      init = function()
        global.radar = game.surfaces[1].find_entities_filtered{name = "1x2-remnants", limit = 1}[1]
		global.radar2 = game.surfaces[1].find_entities_filtered{name = "small-remnants", limit = 1}[1]
		global.radar3 = game.surfaces[1].find_entities_filtered{name = "medium-remnants", limit = 1}[1]
        if global.radar and global.radar2 and global.radar3 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
                {
                  target = global.radar,
                  transition_time = 100,
                  time_to_wait = 200,
				  zoom = 1
                },
				{
                  target = global.radar2,
                  transition_time = 100,
                  time_to_wait = 200,
                  zoom = 1
                },
				{
                  target = global.radar3,
                  transition_time = 100,
                  time_to_wait = 200,
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
              --start_zoom = 4
            }
          end
        end
      end,
	  condition = story_elapsed_check(2),
    },
	{
      condition = story_elapsed_check(1),
      action =
      function()
	    game.show_message_dialog{text = {"msg-base-3"}}
        game.show_message_dialog{text = {"msg-base-4"}}
          story_show_message_dialog{text={"msg-base-5"},
                                 image = "targeting.png"}
      end
    },
	--------------------------------------------
	-- /// DESTROY 3 ASSEMBLING MACHINES  /// --
	--------------------------------------------
	-- MISSION FASE 1
	{
      condition = story_elapsed_check(1),
      action =
      function()
        set_goal({"goal-destroy-pirate-bases"})
      end
	},
	{
      condition = story_elapsed_check(1),
      action = function()
        global.units_killed = 0
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
            distraction=defines.distraction.none
          },
          unit_count = 8
        }
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "assembling-machine-3" and
		   event.entity.force.name == "enemy" then
          global.units_killed = global.units_killed + 1
        end
      end,
      condition = function() return global.units_killed >= 1 end,
      action = function()
        set_goal("")
      end
    },
	{
      condition = story_elapsed_check(1),
      action =
      function()
	    game.show_message_dialog{text = {"msg-base-6"}}
        game.show_message_dialog{text = {"msg-base-7"}}
      end
	},
	{
      condition = story_elapsed_check(2),
	},
	{
      condition = story_elapsed_check(1),
      action =
      function()
	  	local recipe_list = game.players[1].force.recipes
		recipe_list["submachine-gun"].enabled = true
        set_goal({"goal-destroy-pirate-bases2"})
      end
	},
	{
      condition = story_elapsed_check(1),
      action = function()
        global.units_killed = 0
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
            distraction=defines.distraction.none
          },
          unit_count = 15
        }
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "assembling-machine-3" and
		   event.entity.force.name == "enemy" then
          global.units_killed = global.units_killed + 1
        end
      end,
      condition = function() return global.units_killed >= 1 end,
      action = function()
        set_goal("")
      end
    },
	{
      condition = story_elapsed_check(2),
      action =
      function()
	    game.show_message_dialog{text = {"msg-base-8"}}
        game.show_message_dialog{text = {"msg-base-9"}}
      end
	},
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
			game.forces.enemy.evolution_factor = .12
		elseif game.difficulty == defines.difficulty.normal then  
			game.forces.enemy.evolution_factor = .25
		elseif game.difficulty == defines.difficulty.hard then  
		    game.forces.enemy.evolution_factor = .65
        end
      end
    },
	{
      condition = story_elapsed_check(2),
	},
	{
      condition = story_elapsed_check(1),
      action =
      function()
	  	local recipe_list = game.players[1].force.recipes
		recipe_list["combat-shotgun"].enabled = true
        set_goal({"goal-destroy-pirate-bases3"})
      end
	},
	{
      condition = story_elapsed_check(1),
      action = function()
        global.units_killed = 0
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
            distraction=defines.distraction.none
          },
          unit_count = 20
        }
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "assembling-machine-3" and
		   event.entity.force.name == "enemy" then
          global.units_killed = global.units_killed + 1
        end
      end,
      condition = function() return global.units_killed >= 1 end,
      action = function()
        set_goal("")
      end
    },	
	{
      condition = story_elapsed_check(2),
      action =
      function()
	    game.show_message_dialog{text = {"msg-base-10"}}
        game.show_message_dialog{text = {"msg-base-11"}}
      end
	},
	------------------------------------------
	-- /// ATTACK THE MAIN PIRATE BASE  /// --
	------------------------------------------
	-- MISSION FASE 2
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
        global.radar5 = game.surfaces[1].find_entities_filtered{name = "big-remnants", limit = 1}[1]
        if global.radar then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
                {
                  target = global.radar5,
                  transition_time = 200,
                  time_to_wait = 200,
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
              --start_zoom = 4
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
      condition = story_elapsed_check(2),
      action =
      function()
	    game.show_message_dialog{text = {"msg-base-12"}}
        game.show_message_dialog{text = {"msg-base-13"}}
      	for index, entity in pairs(global.intro_entities) do
          entity.destructible = true
        end
      end
	},
	{
      condition = story_elapsed_check(1),
      action =
      function()
	  	local recipe_list = game.players[1].force.recipes
	    recipe_list["flamethrower"].enabled = true
		recipe_list["cluster-grenade"].enabled = true
		recipe_list["poison-capsule"].enabled = true
		recipe_list["slowdown-capsule"].enabled = true
        set_goal("")
      end
	}, 
	{
      init = function()
		chart_areas1()
		chart_tag1()
      end
    },
	{
	  condition = story_elapsed_check(1),
      action =
      function()
         think("msg1")
      end
    },
	{
      condition = story_elapsed_check(3),
      action = function()
	    set_goal({"goal-destroy-pirate-main-base",0,9})
        global.units_killed = 0
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
            distraction=defines.distraction.none
          },
          unit_count = 10
        }
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "centrifuge" and
		   event.entity.force.name == "enemy" then
          global.units_killed = global.units_killed + 1
		  set_goal({"goal-destroy-pirate-main-base",global.units_killed,9})
        end
      end,
      condition = function() return global.units_killed >= 9 end,
      action = function()
        set_goal("")
      end
    },
	-----------------------------
	-- /// RETURN TO BASE  /// --
	-----------------------------
	-- MISSION FASE 3
	{
      condition = story_elapsed_check(3),
      action =
      function()
	    game.show_message_dialog{text = {"msg-base-14"}}
        game.show_message_dialog{text = {"msg-base-15"}}
      end
	},
	{
	  condition = story_elapsed_check(2),
      action =
      function()
         think("msg2")
      end
    },
	{
	  condition = story_elapsed_check(2),
      action =
      function()
         think("msg3")
      end
    },

	{
      condition = story_elapsed_check(3),
      action =
      function()
        set_goal({"goal-return-base"})
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
			game.forces.enemy.evolution_factor = .40
			game.map_settings.enemy_expansion.enabled = true
		elseif game.difficulty == defines.difficulty.hard then  
		    game.forces.enemy.evolution_factor = .69
			game.map_settings.enemy_expansion.enabled = true
        end
      end
    },
	{
	  condition = story_elapsed_check(4),
      action =
      function()
         think("msg4")
      end
    },
	{
	--condition = story_elapsed_check(10), --debug
      condition = story_elapsed_check(180),
      action =
      function()
	    game.show_message_dialog{text = {"msg-base-16"}}
      end
	},
	-------------------------------
	-- /// WAVE BASE DEFENCE /// --
	-------------------------------
	{

      condition = story_elapsed_check(3),
      action =
      function()
        set_goal({"goal-defend-base"})
      end
	},
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
			game.forces.enemy.evolution_factor = .18

		elseif game.difficulty == defines.difficulty.normal then  
			game.forces.enemy.evolution_factor = .50

		elseif game.difficulty == defines.difficulty.hard then  
		    game.forces.enemy.evolution_factor = .79

        end
      end
    },
	{
      init = function()
		game.surfaces[1].create_entity({name='inserter',position={x=307.5,y=-298.5},force="base"})  
		game.surfaces[1].create_entity({name='pipe',position={x=246.5,y=-220.5},force="base"})  
      end 
    },
	{
	  condition = story_elapsed_check(3),
      action =
      function()
         think("msg5")
      end
    },
	{
      condition = story_elapsed_check(3),
      action = function()
        global.biters_killed = 0
      end
    },
    {
      init = function()
        game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-250}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-250}})
		game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-251}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-251}})
		game.surfaces[1].create_entity({name='big-biter',position={x=102,y=-250}})
        game.surfaces[1].create_entity({name='big-biter',position={x=102,y=-251}})
	    game.surfaces[1].create_entity({name='big-biter',position={x=103,y=-252}})
        game.surfaces[1].create_entity({name='big-biter',position={x=103,y=-250}})
		game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-253}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-254}})

        game.players[1].surface.set_multi_command
        {
          command =
          {
            type=defines.command.attack,
            target=game.players[1].character,
            distraction=defines.distraction.by_enemy
          },
          unit_count = 10
        }
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "big-biter" then
          global.biters_killed = global.biters_killed + 1
        end
      end
      --condition = function() return global.biters_killed >= 3 end
	},
	{
      condition = story_elapsed_check(35)
	},
    {
      init = function()
        game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-250}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-250}})
		game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-251}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-251}})
		game.surfaces[1].create_entity({name='big-biter',position={x=102,y=-250}})
        game.surfaces[1].create_entity({name='big-biter',position={x=102,y=-251}})
	    game.surfaces[1].create_entity({name='big-biter',position={x=103,y=-252}})
        game.surfaces[1].create_entity({name='big-biter',position={x=103,y=-250}})
		game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-253}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-254}})

        game.players[1].surface.set_multi_command
        {
          command =
          {
            type=defines.command.attack,
            target=game.players[1].character,
            distraction=defines.distraction.by_enemy
          },
          unit_count = 15
        }
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "big-biter" then
          global.biters_killed = global.biters_killed + 1
        end
      end
      --condition = function() return global.biters_killed >= 3 end
	},
	{
      condition = story_elapsed_check(30)
	}, 
    {
      init = function()
        game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-250}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-250}})
		game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-251}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-251}})
		game.surfaces[1].create_entity({name='big-biter',position={x=102,y=-250}})
        game.surfaces[1].create_entity({name='big-biter',position={x=102,y=-251}})
	    game.surfaces[1].create_entity({name='big-biter',position={x=103,y=-252}})
        game.surfaces[1].create_entity({name='big-biter',position={x=103,y=-250}})
		game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-253}})
        game.surfaces[1].create_entity({name='behemoth-biter',position={x=101,y=-254}})

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
           event.entity.name == "big-biter" then
          global.biters_killed = global.biters_killed + 1
        end
      end
      --condition = function() return global.biters_killed >= 4 end
	},
	{
      condition = story_elapsed_check(15)
	}, 	
	{
      init = function()
        game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-250}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-250}})
		game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-251}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-251}})
		game.surfaces[1].create_entity({name='big-biter',position={x=102,y=-250}})
        game.surfaces[1].create_entity({name='big-biter',position={x=102,y=-251}})
	    game.surfaces[1].create_entity({name='big-biter',position={x=103,y=-252}})
        game.surfaces[1].create_entity({name='big-biter',position={x=103,y=-250}})
		--game.surfaces[1].create_entity({name='behemoth-biter',position={x=100,y=-253}})
        game.surfaces[1].create_entity({name='behemoth-biter',position={x=101,y=-254}})

        game.players[1].surface.set_multi_command
        {
          command =
          {
            type=defines.command.attack,
            target=game.players[1].character,
            distraction=defines.distraction.by_enemy
          },
          unit_count = 30
        }
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "big-biter" then
          global.biters_killed = global.biters_killed + 1
        end
      end
      --condition = function() return global.biters_killed >= 6 end
	},
	{
      condition = story_elapsed_check(10)
	},
    {
      init = function()
        game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-250}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-250}})
		game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-251}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-251}})
		game.surfaces[1].create_entity({name='big-biter',position={x=102,y=-250}})
        game.surfaces[1].create_entity({name='big-biter',position={x=102,y=-251}})
	    --game.surfaces[1].create_entity({name='behemoth-biter',position={x=103,y=-252}})
        game.surfaces[1].create_entity({name='behemoth-biter',position={x=103,y=-250}})
		game.surfaces[1].create_entity({name='behemoth-biter',position={x=100,y=-253}})
        game.surfaces[1].create_entity({name='behemoth-biter',position={x=101,y=-254}})

        game.players[1].surface.set_multi_command
        {
          command =
          {
            type=defines.command.attack,
            target=game.players[1].character,
            distraction=defines.distraction.by_enemy
          },
          unit_count = 30
        }
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "big-biter" then
          global.biters_killed = global.biters_killed + 1
        end
      end
      --condition = function() return global.biters_killed >= 2 end
	}, 
	{
      condition = story_elapsed_check(5),
      action =
      function()
	    game.show_message_dialog{text = {"msg-base-17"}}
      end
	},
	-------------------------------------
	-- /// 5 MINUTES REMAIN TO EVAC /// --
	--------------------------------------
	{
      condition = story_elapsed_check(2),
      action =
      function()
        set_goal({"goal-defend-base2"})

      end
	},
	{
	condition = story_elapsed_check(30),
	},
	{
      init = function()
	    game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-250}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-250}})
		game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-251}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-251}})
		game.surfaces[1].create_entity({name='big-biter',position={x=102,y=-250}})
        game.surfaces[1].create_entity({name='big-biter',position={x=102,y=-251}})
        game.players[1].surface.set_multi_command

        {
          command =
          {
            type=defines.command.attack,
            target=game.players[1].character,
            distraction=defines.distraction.by_enemy
          },
          unit_count = 10
        }
      end
	},	
	{
	condition = story_elapsed_check(30),
	},
	{
      init = function()
	    game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-250}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-250}})
		game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-251}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-251}})
		game.surfaces[1].create_entity({name='big-biter',position={x=102,y=-250}})
        game.surfaces[1].create_entity({name='big-biter',position={x=102,y=-251}})
        game.players[1].surface.set_multi_command

        {
          command =
          {
            type=defines.command.attack,
            target=game.players[1].character,
            distraction=defines.distraction.by_enemy
          },
          unit_count = 15
        }
      end
	},
	{
	condition = story_elapsed_check(30),
	},
	{
      init = function()
	    game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-250}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-250}})
		game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-251}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-251}})
		game.surfaces[1].create_entity({name='big-biter',position={x=102,y=-250}})
        game.surfaces[1].create_entity({name='big-biter',position={x=102,y=-251}})
        game.players[1].surface.set_multi_command

        {
          command =
          {
            type=defines.command.attack,
            target=game.players[1].character,
            distraction=defines.distraction.by_enemy
          },
          unit_count = 15
        }
      end
	},
	{
	condition = story_elapsed_check(30),
	},
	{
      init = function()
	    game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-250}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-250}})
		game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-251}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-251}})
		game.surfaces[1].create_entity({name='big-biter',position={x=102,y=-250}})
        --game.surfaces[1].create_entity({name='behemoth-biter',position={x=102,y=-251}})
        game.players[1].surface.set_multi_command

        {
          command =
          {
            type=defines.command.attack,
            target=game.players[1].character,
            distraction=defines.distraction.by_enemy
          },
          unit_count = 15
        }
      end
	},
	{
	condition = story_elapsed_check(30),
	},
	{
      init = function()
	    game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-250}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-250}})
		game.surfaces[1].create_entity({name='big-spitter',position={x=100,y=-251}})
        game.surfaces[1].create_entity({name='big-spitter',position={x=101,y=-251}})
		game.surfaces[1].create_entity({name='big-spitter',position={x=102,y=-250}})
        --game.surfaces[1].create_entity({name='behemoth-biter',position={x=102,y=-251}})
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
	-------------------------------------
	-- /// 2 MINUTES REMAIN TO EVAC /// --
	--------------------------------------
	{
      condition = story_elapsed_check(30),
      action =
      function()
        set_goal({"goal-defend-base3"})

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
		    game.forces.enemy.evolution_factor = .89

        end
      end
    },
	{
      init = function()
	    game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-250}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-250}})
		game.surfaces[1].create_entity({name='big-spitter',position={x=100,y=-251}})
        game.surfaces[1].create_entity({name='big-spitter',position={x=101,y=-251}})
		game.surfaces[1].create_entity({name='big-spitter',position={x=102,y=-250}})
        game.surfaces[1].create_entity({name='behemoth-biter',position={x=102,y=-251}})
        game.players[1].surface.set_multi_command

        {
          command =
          {
            type=defines.command.attack,
            target=game.players[1].character,
            distraction=defines.distraction.by_enemy
          },
          unit_count = 15
        }
      end
	},
	{
	condition = story_elapsed_check(30),
	},
	{
      init = function()
	    game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-250}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-250}})
		game.surfaces[1].create_entity({name='big-spitter',position={x=100,y=-251}})
        game.surfaces[1].create_entity({name='big-spitter',position={x=101,y=-251}})
		game.surfaces[1].create_entity({name='big-spitter',position={x=102,y=-250}})
        game.surfaces[1].create_entity({name='behemoth-biter',position={x=102,y=-251}})
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
	-------------------------------------
	-- /// 1 MINUTE REMAIN TO EVAC /// --
	--------------------------------------
	{
      condition = story_elapsed_check(30),
      action =
      function()
        set_goal({"goal-defend-base4"})
      end
	},
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
			game.forces.enemy.evolution_factor = .20

		elseif game.difficulty == defines.difficulty.normal then  
			game.forces.enemy.evolution_factor = .75

		elseif game.difficulty == defines.difficulty.hard then  
		    game.forces.enemy.evolution_factor = .99

        end
      end
    },
	{
      init = function()
	    game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-250}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-250}})
		game.surfaces[1].create_entity({name='big-spitter',position={x=100,y=-251}})
        game.surfaces[1].create_entity({name='big-spitter',position={x=101,y=-251}})
		game.surfaces[1].create_entity({name='big-spitter',position={x=102,y=-250}})
        game.surfaces[1].create_entity({name='behemoth-biter',position={x=102,y=-251}})
        game.players[1].surface.set_multi_command

        {
          command =
          {
            type=defines.command.attack,
            target=game.players[1].character,
            distraction=defines.distraction.by_enemy
          },
          unit_count = 15
        }
      end
	},	
	{
	condition = story_elapsed_check(30),
	},
	{
      init = function()
	    game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-250}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-250}})
		game.surfaces[1].create_entity({name='big-spitter',position={x=100,y=-251}})
        game.surfaces[1].create_entity({name='big-spitter',position={x=101,y=-251}})
		game.surfaces[1].create_entity({name='big-spitter',position={x=102,y=-250}})
        game.surfaces[1].create_entity({name='behemoth-biter',position={x=102,y=-251}})
        game.players[1].surface.set_multi_command

        {
          command =
          {
            type=defines.command.attack,
            target=game.players[1].character,
            distraction=defines.distraction.by_anything
          },
          unit_count = 30
        }
      end
	},
	{

      condition = story_elapsed_check(30),
      action =
      function()
	    game.show_message_dialog{text = {"msg-base-18"}}
      end
	},
	-------------------------------
	-- /// GO TO EVAC TRAIN /// --
	------------------------------
	{
      condition = story_elapsed_check(2),
      action =
      function()
        set_goal({"goal-train-refuel"})
      end
	},
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
			game.forces.enemy.evolution_factor = .22

		elseif game.difficulty == defines.difficulty.normal then  
			game.forces.enemy.evolution_factor = .82

		elseif game.difficulty == defines.difficulty.hard then  
		    game.forces.enemy.evolution_factor = .99

        end
      end
    },
	{
      init = function()
	    game.surfaces[1].create_entity({name='big-biter',position={x=100,y=-250}})
        game.surfaces[1].create_entity({name='big-biter',position={x=101,y=-250}})
		game.surfaces[1].create_entity({name='big-spitter',position={x=100,y=-251}})
        game.surfaces[1].create_entity({name='big-spitter',position={x=101,y=-251}})
		game.surfaces[1].create_entity({name='big-spitter',position={x=102,y=-250}})
        game.players[1].surface.set_multi_command

        {
          command =
          {
            type=defines.command.attack,
            target=game.players[1].character,
            distraction=defines.distraction.by_anything
          },
          unit_count = 250
        }
      end
	},	
	{
      init = function()
        game.surfaces[1].create_entity({name='pipe',position={x=299.5,y=-232.5},force="base"})  
		game.surfaces[1].create_entity({name='inserter',position={x=307.5,y=-298.5},force="base"})  
 		game.surfaces[1].create_entity({name='biter-spawner',position={x=400.5,y=-130.5}})  
		game.surfaces[1].create_entity({name='biter-spawner',position={x=407.5,y=-136.5}})  	
		game.surfaces[1].create_entity({name='biter-spawner',position={x=418.5,y=-143.5}}) 
		game.surfaces[1].create_entity({name='biter-spawner',position={x=429.5,y=-154.5}}) 
      end 
    },	
	{
      init = function()
        global.distance_travelled = 0
      end,
      condition = function(event)
        if event.tick % 60 ~= 0 then return end
        local car = game.surfaces[1].find_entities_filtered{name = "locomotive", limit = 1}[1]
        if not car then return end
        if car.energy == 0 then return end
        global.car = car
        global.last_car_position = car.position
        return true
      end
    },
	{
      action =
      function()
        set_goal({"goal-evac-train"})
		game.forces.enemy.evolution_factor = .99
      end
	},
	{
	  condition = story_elapsed_check(1),
      action =
      function()
         think("msg6")
      end
    },
	{
      init = function()
		game.surfaces[1].create_entity({name='biter-spawner',position={x=333.5,y=-345.5}})  
		game.surfaces[1].create_entity({name='biter-spawner',position={x=338.5,y=-346.5}})  
		game.surfaces[1].create_entity({name='biter-spawner',position={x=339.5,y=-341.5}}) 
		game.surfaces[1].create_entity({name='biter-spawner',position={x=400.5,y=-130.5}})  
		game.surfaces[1].create_entity({name='biter-spawner',position={x=407.5,y=-136.5}})  	
		game.surfaces[1].create_entity({name='biter-spawner',position={x=418.5,y=-143.5}}) 
		game.surfaces[1].create_entity({name='biter-spawner',position={x=429.5,y=-154.5}})  
		
      end
    },
    {
      action = function()
        global.biters_killed = 0
      end
    },
    {
      init = function()
		game.surfaces[1].create_entity({name='big-biter',position={x=335,y=-335}})	
		game.surfaces[1].create_entity({name='big-biter',position={x=336,y=-335}})	
		game.surfaces[1].create_entity({name='big-biter',position={x=337,y=-335}})	
		game.surfaces[1].create_entity({name='big-biter',position={x=338,y=-336}})	
		game.surfaces[1].create_entity({name='big-biter',position={x=335,y=-337}})	
		game.surfaces[1].create_entity({name='big-biter',position={x=334,y=-338}})	
        game.surfaces[1].create_entity({name='big-biter',position={x=337,y=-335}})	
		game.surfaces[1].create_entity({name='big-biter',position={x=338,y=-339}})	
		game.surfaces[1].create_entity({name='big-biter',position={x=337,y=-337}})	
		game.surfaces[1].create_entity({name='big-biter',position={x=338,y=-338}})	

        game.players[1].surface.set_multi_command
        {
          command =
          {
            type=defines.command.attack,
            target=game.players[1].character,
            distraction=defines.distraction.by_anything
          },
          unit_count = 250
        }
      end
	},
	{
      condition = story_elapsed_check(5),
	},	
	{
      init = function()
        global.distance_travelled = 0
      end,
      condition = function(event)
        if event.tick % 60 ~= 0 then return end
        local car = game.surfaces[1].find_entities_filtered{name = "locomotive", limit = 1}[1]
        if not car then return end
        if car.energy == 0 then return end
        global.car = car
        global.last_car_position = car.position
        return true
      end
    },
	{
      condition = story_elapsed_check(5),
	},	
	{
      init = function()
        global.distance_travelled = 0
      end,
      condition = function(event)
        if event.tick % 60 ~= 0 then return end
        local car = game.surfaces[1].find_entities_filtered{name = "locomotive", limit = 1}[1]
        if not car then return end
        if car.energy == 0 then return end
        global.car = car
        global.last_car_position = car.position
        return true
      end
    },
	{
      condition = story_elapsed_check(10),
      action =
      function()
        set_goal("")
      end
	},
	{
      condition = story_elapsed_check(2),
      action =
      function()
	    game.show_message_dialog{text = {"msg-base-19"}}
      end
	},	
	{
      action =
      function()
        if game.difficulty == defines.difficulty.easy then
			game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-05")}) -- YOU WIN THE GAME
		elseif game.difficulty == defines.difficulty.normal then  
			game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-05")}) -- YOU WIN THE GAME
		elseif game.difficulty == defines.difficulty.hard then  
		    game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-05")}) -- YOU WIN THE GAME
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
  defines.events.on_combat_robot_expired,
  defines.events.on_player_died,
  defines.events.on_gui_click,

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