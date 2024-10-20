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
	if  event.name == defines.events.on_player_died or event.name == defines.events.on_entity_died and
           event.entity.name == "steam-turbine" and
		   event.entity.force.name == "base" then
		game.set_game_state({game_finished=true, player_won=false, can_continue=false})
		end
  end

local function on_configuration_changed()
	game.reload_script()
end

local init = function()
  global.cars = global.cars or {}
end


local on_player_created = function(event)

  local player = game.players[1]

  player.force.enable_research()
  game.forces.player.disable_all_prototypes()
  game.forces.player.reset_technology_effects()
  --game.forces.player.reset()
  game.forces.player.research_queue_enabled = true
  
  
  global.art1 = game.get_entity_by_tag("art1")
  global.art2 = game.get_entity_by_tag("art2")
  global.art3 = game.get_entity_by_tag("art3")
  global.art4 = game.get_entity_by_tag("art4")
  global.art5 = game.get_entity_by_tag("art5")

  local entities =
  {
    global.art1,
	global.art2,
	global.art3,
	global.art4,
	global.art5
  }
  for index, entity in pairs(entities) do
    entity.destructible = false
  end
  global.intro_entities = entities
  
  local recipe_list = player.force.recipes
  game.players[1].clear_recipe_notifications()
  
  
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
  technology_list["heavy-armor"].researched = true
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
  technology_list["sulfur-processing"].enabled = true
  technology_list["toolbelt"].enabled = true
  technology_list["advanced-electronics"].researched = true
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
  technology_list["plastics"].enabled = true
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
  technology_list["low-density-structure"].enabled = true  
  technology_list["rocket-control-unit"].enabled = true
  technology_list["concrete"].enabled = true
  technology_list["robotics"].enabled = true
  --special
  technology_list["logistics-3"].enabled = true
  technology_list["atomic-bomb"].enabled = true
  
  --blocked tech
  technology_list["cliff-explosives"].enabled = false
  technology_list["construction-robotics"].enabled = false
  technology_list["landfill"].enabled = false
  technology_list["personal-roboport-equipment"].enabled = false
  technology_list["nuclear-fuel-reprocessing"].enabled = false
  technology_list["nuclear-power"].enabled = false
  technology_list["artillery"].enabled = false
  technology_list["logistic-system"].enabled = false
  technology_list["logistic-robotics"].enabled = false
  technology_list["spidertron"].enabled = false
   
  
  --tech upgrades
  technology_list["braking-force-1"].enabled = true
  technology_list["braking-force-2"].enabled = true
  technology_list["braking-force-3"].enabled = true
  technology_list["energy-weapons-damage-1"].researched = true
  technology_list["energy-weapons-damage-2"].enabled = true
  technology_list["energy-weapons-damage-3"].enabled = true
  technology_list["energy-weapons-damage-4"].enabled = true
  technology_list["energy-weapons-damage-5"].enabled = true
  technology_list["energy-weapons-damage-6"].enabled = true
  technology_list["inserter-capacity-bonus-1"].researched = true
  technology_list["inserter-capacity-bonus-2"].enabled = true
  technology_list["inserter-capacity-bonus-3"].enabled = true
  technology_list["inserter-capacity-bonus-4"].enabled = true
  technology_list["laser-shooting-speed-1"].researched = true
  technology_list["laser-shooting-speed-2"].enabled = true
  technology_list["laser-shooting-speed-3"].enabled = true
  technology_list["laser-shooting-speed-4"].enabled = true
  technology_list["laser-shooting-speed-5"].enabled = true
  technology_list["laser-shooting-speed-6"].enabled = true
  technology_list["stronger-explosives-1"].enabled = true
  technology_list["stronger-explosives-2"].enabled = true
  technology_list["stronger-explosives-3"].enabled = true
  technology_list["stronger-explosives-4"].enabled = true
  technology_list["stronger-explosives-5"].enabled = true
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
  technology_list["mining-productivity-4"].enabled = true
  technology_list["weapon-shooting-speed-1"].researched = true
  technology_list["weapon-shooting-speed-2"].enabled = true
  technology_list["weapon-shooting-speed-3"].enabled = true
  technology_list["weapon-shooting-speed-4"].enabled = true
  technology_list["weapon-shooting-speed-5"].enabled = true
  technology_list["worker-robots-speed-1"].enabled = false
  technology_list["worker-robots-speed-2"].enabled = false
  technology_list["worker-robots-storage-1"].enabled = false
  technology_list["worker-robots-storage-2"].enabled = false
  technology_list["artillery-shell-range-1"].enabled = false
  technology_list["artillery-shell-speed-1"].enabled = false
  technology_list["follower-robot-count-1"].enabled = true
  technology_list["follower-robot-count-2"].enabled = true
  technology_list["follower-robot-count-3"].enabled = true
  technology_list["follower-robot-count-4"].enabled = true
  technology_list["follower-robot-count-5"].enabled = true

end


local spawn_position = {-109, 150}

local player_item_list =
{
  ["submachine-gun"] = 1,
  ["shotgun"] = 1,
  ["shotgun-shell"] = 32,
  ["heavy-armor"] = 1,
  ["iron-gear-wheel"] = 50,
  ["iron-plate"] = 200,
  ["transport-belt"] = 50,
  ["grenade"] = 8,
}

local car_item_list =
{
  ["coal"] = 25
}


local story_table =
{
  {
    {
      init = function()
	  global.radar = game.surfaces[1].find_entities_filtered{name = "rail-chain-signal-remnants", limit = 1}[1]
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
	---------------------------------
	-- /// LOCO MOTO RAMMING  /// --
	---------------------------------
	{
      init = function()
       
        -- for k, player in pairs (game.players) do
          -- if player.character then player.character.destroy() end
        -- end
        local driving_car = game.surfaces[1].create_entity{name = "locomotive", position={x=-109.5,y=150.5}, force = "player"}
        global.cars =
        {
         [driving_car.unit_number] = driving_car
        }
        local dude = game.surfaces[1].create_entity{name = "character", force = "player", position={x=-109.5,y=150.5}}
        driving_car.set_driver(dude)
        global.dude = dude
        global.car = driving_car
		util.insert_safe(global.car, car_item_list)
        global.car.train.speed = 0.65
        global.car.color = { r = 0.869, g = 0.5  , b = 0.130, a = 0.5 }
        for k, player in pairs (game.players) do
          player.set_controller
          {
            type = defines.controllers.cutscene,
            waypoints =
            {
              {
                target = global.car,
                transition_time = 0,
                time_to_wait = 650,
                zoom = 1
              }
            },
            start_position = global.car.position,
            start_zoom = 1
          }
        end
      end
	 },
     {
      init = function()
        --chart_areas()
        if global.dude and global.dude.valid then
          global.dude.destroy()
        end
        for k, player in pairs (game.players) do
          if player.controller_type == defines.controllers.cutscene then
            player.exit_cutscene()
          end
          if player.character then player.character.destroy() end
          player.teleport({x = global.car.position.x - 2, y = global.car.position.y + 2})
          player.create_character()
          util.insert_safe(player, player_item_list)
          player.zoom = 1.5
          player.set_controller
          {
            type = defines.controllers.cutscene,
            waypoints =
            {
              {
                target = player.character,
                transition_time = 150,
                time_to_wait = 30,
                zoom = 1.5
              }
            },
            start_position = global.car.position,
            start_zoom = 1
          }
        end
      end,
      condition = story_elapsed_check(3)
    },
    {
	  
      action = function()
      local character = game.players[1]
      end
    },
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
		    character.insert{name = "piercing-rounds-magazine", count = 175}
			character.insert{name = "firearm-magazine", count = 333}
			character.insert{name = "laser-turret", count = 8}
			character.insert{name = "gun-turret", count = 8}
			character.insert{name = "transport-belt", count = 300}
			character.insert{name = "iron-plate", count = 175}
			character.insert{name = "inserter", count = 40}
			character.insert{name = "medium-electric-pole", count = 25}
			character.insert{name = "shotgun-shell", count = 45}
			character.insert{name = "explosive-cannon-shell", count = 55}
			character.insert{name = "raw-fish", count = 8} 
			
			game.forces.enemy.evolution_factor = .00
			game.map_settings.enemy_expansion.enabled = false
			
		elseif game.difficulty == defines.difficulty.normal then  
		    character.insert{name = "firearm-magazine", count = 67}
			game.forces.enemy.evolution_factor = .19
			game.map_settings.enemy_expansion.enabled = true
			
		elseif game.difficulty == defines.difficulty.hard then  
			character.insert{name = "firearm-magazine", count = 33}
		    game.forces.enemy.evolution_factor = .50
			game.map_settings.enemy_expansion.enabled = true
        end
      end
    },
	---------------------------------
	-- /// SECURE THE BASE  /// --
	---------------------------------
	{
      action =
      function()
        set_goal({"goal-destroy-pirate-gun-turrets",0,12})
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
	  condition = story_elapsed_check(4),
      action =
      function()
         think("msg2")
      end
    },	
	{
      condition = story_elapsed_check(1),
      action = function()
	  	--set_goal({"goal-destroy-pirate-gun-turrets",0,9})
        global.units_killed = 0
      end
    },
    {
      init = function()

      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "gun-turret" and
		   event.entity.force.name == "enemy" then
          global.units_killed = global.units_killed + 1
		  set_goal({"goal-destroy-pirate-gun-turrets",global.units_killed,12})
		--elseif event.name == defines.events.on_entity_died and
           --event.entity.name == "crash-site-spaceship"  then
           --game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-06")})
        end
      end,
      condition = function() return global.units_killed >= 12 end,
      action = function()
        set_goal("")
      end
    },
	---------------------------------
	-- /// FIRST ARTILLERY TASK  /// --
	---------------------------------
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
      action =
      function()
		 set_goal({"goal-science-pack"})
      end
	}, 
	{
	  condition = story_elapsed_check(3),
	  action =
      function()
         think("msg3")
      end
    },
	{ 
	  -- init = function()
      -- set_goal({"goal-science-pack"})
      -- global.science = 0
      -- end,
      -- action =
      function(event)
        if event.name == defines.events.on_built_entity and event.created_entity.name == "land-mine" then
          event.created_entity.energy = 1 
		  -- global.science = global.science + 1		  
          -- set_goal({"goal-science-pack",global.science,1})	
		--elseif event.name == defines.events.on_built_entity and event.created_entity.name == "tank" then
          --event.created_entity.energy = 1
		  -- global.science = global.science + 1		  
          --set_goal({"goal-science-pack",global.science,1})	
		elseif event.name == defines.events.on_built_entity and event.created_entity.name == "rocketry" then
          event.created_entity.energy = 1
          -- global.science = global.science + 1		  
          -- set_goal({"goal-science-pack",global.science,1})		  
        end
      end
    },
	{
	  condition = function() return game.players[1].force.technologies["land-mine"].researched and 
									--game.players[1].force.technologies["tank"].researched and 
									game.players[1].force.technologies["rocketry"].researched end,
      action =
      function()
	     set_goal("")
         think("msg5")
          for index, entity in pairs(global.intro_entities) do
          entity.destructible = true
        end
      end
    },
	{
      condition = story_elapsed_check(3),
      action =
      function()
        set_goal({"goal-destroy-pirate-artillery"})
      end
	},	
	{
      init = function()
		game.surfaces[1].create_entity({name='fast-inserter',position={x=127.5,y=-406.5},force="enemy"})  
		game.surfaces[1].create_entity({name='fast-inserter',position={x=-514.5,y=24.5},force="enemy"})  
		game.surfaces[1].create_entity({name='fast-inserter',position={x=-346.5,y=-262.5},force="enemy"})  
		game.surfaces[1].create_entity({name='fast-inserter',position={x=473.5,y=-140.5},force="enemy"})  
		game.surfaces[1].create_entity({name='fast-inserter',position={x=507.5,y=67.5},force="enemy"})  
		game.surfaces[1].create_entity({name='inserter',position={x=421.5,y=-451.5},force="enemy"}) 
		game.surfaces[1].create_entity({name='inserter',position={x=-258.5,y=-597.5},force="enemy"}) 
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
           event.entity.name == "artillery-turret" and
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
        set_goal("")

      end
	},
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
			game.forces.enemy.evolution_factor = .10

		elseif game.difficulty == defines.difficulty.normal then  
			game.forces.enemy.evolution_factor = .20

		elseif game.difficulty == defines.difficulty.hard then  
		    game.forces.enemy.evolution_factor = .52

        end
      end
    },
	---------------------------------
	-- /// SECOND ARTILLERY TASK  /// --
	---------------------------------
	{
      condition = story_elapsed_check(1),
      action =
      function()
	    game.show_message_dialog{text = {"msg-base-3.1"}}
	    game.show_message_dialog{text = {"msg-base-3.2"}}
	    game.show_message_dialog{text = {"msg-base-4"}}
      end
    },
	{
      condition = story_elapsed_check(1),
      action =
      function()
        set_goal({"goal-destroy-pirate-artillery2"})
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
           event.entity.name == "artillery-turret" and
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
        set_goal("")
      end
	},
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
			game.forces.enemy.evolution_factor = .20

		elseif game.difficulty == defines.difficulty.normal then  
			game.forces.enemy.evolution_factor = .50

		elseif game.difficulty == defines.difficulty.hard then  
		    game.forces.enemy.evolution_factor = .85

        end
      end
    },
	---------------------------------
	-- /// THIRD ARTILLERY TASK  /// --
	---------------------------------
	{
      condition = story_elapsed_check(1),
      action =
      function()
	  	game.show_message_dialog{text = {"msg-base-4.1"}}
	    game.show_message_dialog{text = {"msg-base-4.2"}}
	    game.show_message_dialog{text = {"msg-base-5"}}
      end
    },
	{
      condition = story_elapsed_check(1),
      action =
      function()
        set_goal({"goal-destroy-pirate-artillery3"})
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
          unit_count = 30
        }
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "artillery-turret" and
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
        set_goal("")
      end
	},
	---------------------------------
	-- /// FOURTH ARTILLERY TASK  /// --
	---------------------------------
	{
      condition = story_elapsed_check(1),
      action =
      function()
	  	game.show_message_dialog{text = {"msg-base-5.1"}}
	    game.show_message_dialog{text = {"msg-base-5.2"}}
	    game.show_message_dialog{text = {"msg-base-5.3"}}
	    game.show_message_dialog{text = {"msg-base-6"}}
      end
    },
	{
      condition = story_elapsed_check(1),
      action =
      function()
        set_goal({"goal-destroy-pirate-artillery4"})
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
          unit_count = 50
        }
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "artillery-turret" and
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
        set_goal("")
      end
	},
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
			game.forces.enemy.evolution_factor = .25

		elseif game.difficulty == defines.difficulty.normal then  
			game.forces.enemy.evolution_factor = .70

		elseif game.difficulty == defines.difficulty.hard then  
		    game.forces.enemy.evolution_factor = .99

        end
      end
    },
	---------------------------------
	-- /// FIFTH ARTILLERY TASK  /// --
	---------------------------------
	{
      condition = story_elapsed_check(1),
      action =
      function()
	    game.show_message_dialog{text = {"msg-base-7"}}
      end
    },
	{
      condition = story_elapsed_check(1),
      action =
      function()
        set_goal({"goal-destroy-pirate-artillery5"})
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
          unit_count = 100
        }
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "artillery-turret" and
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
        set_goal("")
      end
	},
	{
	  condition = story_elapsed_check(2),
      action =
      function()
		 set_goal("")
         think("msg4")
      end
    },
	{
      condition = story_elapsed_check(4),
      action =
      function()
        game.show_message_dialog{text = {"msg-base-8"}}
      end
	},
	{
      action =
      function()
        if game.difficulty == defines.difficulty.easy then
			game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-06")}) -- YOU WIN THE GAME
		elseif game.difficulty == defines.difficulty.normal then  
			game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-06")}) -- YOU WIN THE GAME
		elseif game.difficulty == defines.difficulty.hard then  
		    game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-06")}) -- YOU WIN THE GAME
        end
      end
    },
	
	-------------------------
	-- /// OLD ENDING  /// --
	-------------------------
	
	-- {
      -- condition = story_elapsed_check(3),
      -- action =
      -- function()
        -- game.show_message_dialog{text = {"msg-base-9"}}
      -- end
	-- },
	--Ending
	-- {
      -- action =
      -- function()
        -- game.set_game_state({game_finished=true, player_won=true, can_continue=true})
      -- end
	-- },	
	-- {
      -- condition = story_elapsed_check(4),
      -- action =
      -- function()
	    -- game.show_message_dialog{text = {"msg-base-10"}}
      -- end
    -- },
	-- {
      -- init = function()
		-- game.surfaces[1].create_entity({name='inserter',position={x=-1852.5,y=-5400.5},force="enemy"})  
		-- game.surfaces[1].create_entity({name='nuclear-reactor',position={x=-1835.5,y=-5406.5},force="enemy"})  
		-- game.surfaces[1].create_entity({name='substation',position={x=-1898.5,y=-5413.5},force="enemy"}) 
		-- game.surfaces[1].create_entity({name='fast-transport-belt',position={x=-1831.5,y=-5403.5},force="enemy"}) 
      -- end 
    -- },
	-- {
      -- init = function()
        -- global.radar = game.surfaces[1].find_entities_filtered{name = "1x2-remnants", limit = 1}[1]
        -- if global.radar then
          -- for k, player in pairs (game.players) do
            -- player.set_controller
            -- {
              -- type = defines.controllers.cutscene,
              -- waypoints =
              -- {
                -- {
                  -- target = global.radar,
                  -- transition_time = 250,
                  -- time_to_wait = 10,
				  -- zoom = 1
                -- },
				                -- {
                  -- target = global.radar,
                  -- transition_time = 100,
                  -- time_to_wait = 200,
				  -- zoom = 2
                -- },
				-- {
                  -- target = player.character,
                  -- transition_time = 0,
                  -- time_to_wait = 0,
                  -- zoom = 1
                -- },
              -- },
              -- start_position = player.character.position,
              -- start_zoom = 4
            -- }
          -- end
        -- end
      -- end,
	  -- condition = story_elapsed_check(2),
    -- },
	-- {
      -- condition = story_elapsed_check(1),
      -- action =
      -- function()
	    -- game.show_message_dialog{text = {"msg-base-11"}}
      -- end
    -- },
	-- {
      -- condition = story_elapsed_check(2),
      -- action =
      -- function()
        -- set_goal({"goal-post-ending"})
      -- end
	-- }, 
	-- {
      -- condition = story_elapsed_check(1),
      -- action = function()
        -- global.units_killed = 0
      -- end
    -- },
    -- {
      -- init = function()
        -- game.players[1].surface.set_multi_command
        -- {
          -- command =
          -- {
            -- type=defines.command.attack,
            -- target=game.players[1].character,
            -- distraction=defines.distraction.none
          -- },
          -- unit_count = 50
        -- }
      -- end,
      -- update = function(event)
        -- if event.name == defines.events.on_entity_died and
           -- event.entity.name == "nuclear-reactor" and
		   -- event.entity.force.name == "enemy" then
          -- global.units_killed = global.units_killed + 1
        -- end
      -- end,
      -- condition = function() return global.units_killed >= 1 end,
      -- action = function()
        -- set_goal("")
      -- end
    -- },
	-- {
      -- condition = story_elapsed_check(1),
      -- action =
      -- function()
	    -- game.show_message_dialog{text = {"msg-base-12"}}
		-- game.show_message_dialog{text = {"msg-base-13"}}
		-- game.show_message_dialog{text = {"msg-base-14"}}
		-- game.show_message_dialog{text = {"msg-base-15"}}
		-- game.show_message_dialog{text = {"msg-base-16"}}
		-- game.show_message_dialog{text = {"msg-base-17"}}
      -- end
    -- },
  }
}



story_init_helpers(story_table)


script.on_init(function()

  --game.map_settings.enemy_expansion.enabled = false
  
 
end)


local story_events =
{
  defines.events.on_tick,
  defines.events.on_entity_died,
  defines.events.on_built_entity,
  defines.events.on_player_mined_item,
  defines.events.on_combat_robot_expired,
  defines.events.on_player_died,
  defines.events.on_train_changed_state,
  defines.events.on_gui_click,

} 
local build_events =
{
  defines.events.on_built_entity,
  defines.events.on_robot_built_entity,
  defines.events.script_raised_built,
  defines.events.script_raised_revive
}

-- local on_built_entity = function(event)

  -- local entity = event.entity or event.created_entity
  -- if not (entity and entity.valid) then return end

  -- if entity.name == "locomotive" then
    -- global.cars[entity.unit_number] = entity
  -- end

-- end

-- local on_player_driving_changed_state = function(event)
  --If they find the car in the ruin, only consider it for the objectives if they get in.
  -- local car = event.entity
  -- if not (car and car.valid) then return end

  -- if car.name ~= "locomotive" then return end

  -- global.cars[car.unit_number] = car

-- end 
 
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
script.on_event(build_events, on_built_entity)
script.on_event(defines.events.on_player_driving_changed_state, on_player_driving_changed_state)
script.on_event(defines.events.on_gui_click, intro_screen.on_gui_click)
script.on_init(on_configuration_changed)
script.on_configuration_changed(on_configuration_changed)

