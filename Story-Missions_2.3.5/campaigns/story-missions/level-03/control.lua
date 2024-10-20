require "util"
require "story"
local intro_screen = require("intro_screen")
local timer_screen = require("timer_screen")

local think = function(thought)
  game.players[1].print({"","[img=entity/character][color=orange]",{"engineer-title"},": [/color]",{"think-"..thought}})
end

local msg = function(msg)
  game.players[1].print({"","[img=entity/radar][color=red]",{"computer-title"},": [/color]",{"msg-"..msg}})
end

function check_for_player_death(event)
	if  event.name == defines.events.on_player_died or
		event.name == defines.events.on_entity_died and
        event.entity.name == "nuclear-reactor" then
		game.set_game_state({game_finished=true, player_won=false, can_continue=false})
		end
  end
  
local function on_configuration_changed()
	game.reload_script()
end 



local set_arrow = function(arrow_settings)
  if global.arrow then
    global.arrow.destroy()
  end
  if arrow_settings == nil then
    global.arrow = nil
  else
    global.arrow = game.players[1].surface.create_entity(arrow_settings)
  end
end

local on_player_created = function(event)

  local player = game.players[1]

  player.force.enable_research()
  game.forces.player.disable_all_prototypes()
  game.forces.player.reset_technology_effects()
  -- game.forces.player.reset()
  game.forces.player.research_queue_enabled = true
  

  local technology_list = game.forces.player.technologies  
  technology_list["automation"].researched = true
  technology_list["stone-wall"].researched = true
  technology_list["gun-turret"].researched = true
  technology_list["optics"].researched = true
  technology_list["logistics"].researched = true
  technology_list["military"].researched = true
  technology_list["logistic-science-pack"].researched = true
  technology_list["steel-processing"].researched = true
  technology_list["electronics"].researched = true 
  technology_list["automation-2"].researched = true
  technology_list["engine"].researched = true 
  technology_list["railway"].researched = true
  technology_list["automated-rail-transportation"].researched = true
  technology_list["fluid-handling"].researched = true 
  technology_list["automobilism"].researched = true
  
  technology_list["belt-immunity-equipment"].enabled = true
  technology_list["fast-inserter"].enabled = true 
  technology_list["electric-energy-distribution-1"].enabled = true 
  technology_list["oil-processing"].enabled = true
  technology_list["heavy-armor"].enabled = true
  technology_list["steel-axe"].enabled = true 
  technology_list["military-2"].enabled = true
  technology_list["chemical-science-pack"].enabled = true
  technology_list["military-science-pack"].enabled = true 
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
  technology_list["sulfur-processing"].enabled = true
  technology_list["toolbelt"].enabled = true
  technology_list["advanced-electronics"].enabled = true
  technology_list["explosives"].enabled = true
  technology_list["land-mine"].enabled = true
  technology_list["electric-energy-accumulators"].enabled = true
  technology_list["laser-turret"].enabled = true
  technology_list["tank"].enabled = true
  technology_list["circuit-network"].enabled = true
  technology_list["night-vision-equipment"].enabled = true
  technology_list["solar-panel-equipment"].enabled = true
  technology_list["energy-shield-equipment"].enabled = false
  technology_list["battery-equipment"].enabled = true
  technology_list["modular-armor"].enabled = true
  technology_list["military-3"].enabled = true
  technology_list["rail-signals"].enabled = true
  technology_list["gate"].enabled = true
  technology_list["rocketry"].enabled = true
  technology_list["battery"].enabled = true
  technology_list["plastics"].enabled = true
  technology_list["fluid-wagon"].enabled = true
  technology_list["stack-inserter"].enabled = true
  technology_list["explosive-rocketry"].enabled = true --new from mission 2


  --blocked tech
  technology_list["automation-3"].enabled = false
  technology_list["braking-force-2"].enabled = false
  technology_list["cliff-explosives"].enabled = false
  technology_list["construction-robotics"].enabled = false
  technology_list["energy-weapons-damage-3"].enabled = false
  technology_list["exoskeleton-equipment"].enabled = false
  technology_list["landfill"].enabled = false
  technology_list["utility-science-pack"].enabled = false
  technology_list["production-science-pack"].enabled = false
  technology_list["advanced-material-processing-2"].enabled = false
  technology_list["personal-roboport-equipment"].enabled = false
  technology_list["personal-laser-defense-equipment"].enabled = false
  technology_list["nuclear-fuel-reprocessing"].enabled = false
  technology_list["nuclear-power"].enabled = false
  technology_list["military-4"].enabled = false
  technology_list["destroyer"].enabled = false
  technology_list["defender"].enabled = false
  technology_list["discharge-defense-equipment"].enabled = false
  technology_list["distractor"].enabled = false
  technology_list["artillery"].enabled = false
  technology_list["atomic-bomb"].enabled = false
  technology_list["robotics"].enabled = false
  technology_list["automation-3"].enabled = false
  technology_list["rocket-control-unit"].enabled = false
  technology_list["logistic-system"].enabled = false
  technology_list["logistic-robotics"].enabled = false
  technology_list["electric-engine"].enabled = false
  technology_list["uranium-processing"].enabled = false
  technology_list["spidertron"].enabled = false
  technology_list["kovarex-enrichment-process"].enabled = false
  technology_list["lubricant"].enabled = false
  technology_list["low-density-structure"].enabled = false
  technology_list["rocket-fuel"].enabled = false


  
  --blocked tech upgrades
  technology_list["braking-force-1"].enabled = true
  technology_list["energy-weapons-damage-1"].enabled = true
  technology_list["energy-weapons-damage-2"].enabled = true
  technology_list["energy-weapons-damage-3"].enabled = true
  technology_list["inserter-capacity-bonus-1"].enabled = true
  technology_list["inserter-capacity-bonus-2"].enabled = true
  technology_list["inserter-capacity-bonus-3"].enabled = true
  technology_list["laser-shooting-speed-1"].enabled = true
  technology_list["laser-shooting-speed-2"].enabled = true
  technology_list["laser-shooting-speed-3"].enabled = true
  technology_list["stronger-explosives-1"].enabled = true
  technology_list["stronger-explosives-2"].enabled = true
  technology_list["stronger-explosives-3"].enabled = true
  technology_list["physical-projectile-damage-1"].enabled = true
  technology_list["physical-projectile-damage-2"].enabled = true
  technology_list["physical-projectile-damage-3"].enabled = true
  technology_list["physical-projectile-damage-4"].enabled = true
  technology_list["physical-projectile-damage-5"].enabled = true
  technology_list["refined-flammables-1"].enabled = true
  technology_list["refined-flammables-2"].enabled = true
  technology_list["refined-flammables-3"].enabled = true
  technology_list["research-speed-1"].enabled = true
  technology_list["research-speed-2"].enabled = true
  technology_list["research-speed-3"].enabled = true
  technology_list["research-speed-4"].enabled = true
  technology_list["mining-productivity-1"].enabled = true
  technology_list["mining-productivity-2"].enabled = true
  technology_list["weapon-shooting-speed-1"].enabled = true
  technology_list["weapon-shooting-speed-2"].enabled = true
  technology_list["weapon-shooting-speed-3"].enabled = true
  technology_list["weapon-shooting-speed-4"].enabled = true
  technology_list["worker-robots-speed-1"].enabled = false
  technology_list["worker-robots-speed-2"].enabled = false
  technology_list["worker-robots-storage-1"].enabled = false
  technology_list["worker-robots-storage-2"].enabled = false
  technology_list["artillery-shell-range-1"].enabled = false
  technology_list["artillery-shell-speed-1"].enabled = false
  technology_list["follower-robot-count-1"].enabled = false
  technology_list["follower-robot-count-2"].enabled = false


end





local story_table =
{
  {
	------------------
	------------------
	-- {
      -- name = "start_timer",
      -- action = function(player)
        -- local timer_tick = timer_screen.create_timer(player)
        -- global.timers = global.timers or {}
        -- global.timers.start_timer = {
          -- tick = timer_tick,
          -- running = true,
          -- elapsed_ticks = 0,
          -- duration = 60, -- duration in seconds
          -- callback = function() -- do something when the timer ends
            
          -- end
        -- }
      -- end
    -- },
	----------------
	----------------
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
	{
	  
      action = function()
      local character = game.players[1]
        character.insert{name = "steel-plate", count = 120}
		character.insert{name = "copper-plate", count = 50}
		character.insert{name = "steel-plate", count = 60}
        character.insert{name = "inserter", count = 8}
		character.insert{name = "transport-belt", count = 75}
		character.insert{name = "pistol", count = 1}
		character.insert{name = "firearm-magazine", count = 8}
        character.insert{name = "gun-turret", count = 3}
		character.insert{name = "grenade", count = 2}
        character.insert{name = "light-armor", count = 1}
		character.insert{name = "repair-pack", count = 5}
		character.insert{name = "small-lamp", count = 2}
		character.insert{name = "assembling-machine-2", count = 3}
		character.insert{name = "electric-mining-drill", count = 4}
		character.insert{name = "wooden-chest", count = 6}
		character.insert{name = "small-electric-pole", count = 10}

      end
    },
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
		    character.insert{name = "submachine-gun", count = 1}
		    character.insert{name = "firearm-magazine", count = 142}
			character.insert{name = "piercing-rounds-magazine", count = 30}
			character.insert{name = "gun-turret", count = 4}
			character.insert{name = "laser-turret", count = 2}
			game.forces.enemy.evolution_factor = .00
			
		elseif game.difficulty == defines.difficulty.normal then  
		    character.insert{name = "firearm-magazine", count = 10}
			game.forces.enemy.evolution_factor = .10
			
		elseif game.difficulty == defines.difficulty.hard then  
		    game.forces.enemy.evolution_factor = .50
        end
      end
    },

    {
      condition = story_elapsed_check(1),
      action =
      function()
        game.show_message_dialog{text = {"msg-base-1"}}
      end
    },
	{
      condition = story_elapsed_check(1),
      action =
      function()
        set_goal({"goal-protect-drone"})
      end
	},
	-- {
	  -- condition = story_elapsed_check(2),
      -- action =
      -- function()
         -- think("msg1")
      -- end
    -- },
	{
      condition = story_elapsed_check(4),
      action =
      function()
	    game.show_message_dialog{text = {"msg-base-1.1"}}
        game.show_message_dialog{text = {"msg-base-2"}}
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
      init = function()
		game.players[1].character.destructible = false
      end
    },
    {
      init = function()
        global.radar = game.surfaces[1].find_entities_filtered{name = "1x2-remnants", limit = 1}[1]
		global.radar2 = game.surfaces[1].find_entities_filtered{name = "small-remnants", limit = 1}[1]
        if global.radar and global.radar2 then
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
                  transition_time = 1750,
                  time_to_wait = 150,
                  zoom = 1
                },
              },
              start_position = player.character.position,
              --start_zoom = 4
            }
          end
        end
      end,
	  condition = story_elapsed_check(0),
    },
	{

      init = function()
        global.radar3 = game.surfaces[1].find_entities_filtered{name = "small-remnants", limit = 1}[1]
		global.radar4 = game.surfaces[1].find_entities_filtered{name = "nuclear-reactor", limit = 1}[1]
        if global.radar3 and global.radar4 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
                {
                  target = global.radar3,
                  transition_time = 0,
                  time_to_wait = 50,
				  zoom = 1
                },
				{
                  target = global.radar4,
                  transition_time = 225,
                  time_to_wait = 200,
                  zoom = 1
                },
              },
              --start_position = player.character.position,
              --start_zoom = 4
            }
          end
        end
      end,
      condition = story_elapsed_check(0),
      action =
      function()
		game.show_message_dialog{text = {"msg-base-3"}, point_to={type="position", position={x=325.5,y=298.5}}}
		game.show_message_dialog{text = {"msg-base-4"}, point_to={type="position", position={x=325.5,y=298.5}}}
      end
    },
	{

      init = function()
		global.radar4 = game.surfaces[1].find_entities_filtered{name = "nuclear-reactor", limit = 1}[1]
        if global.radar4 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
				{
                  target = global.radar4,
                  transition_time = 0,
                  time_to_wait = 100,
                  zoom = 1
                },
				{
                  target = player.character,
                  transition_time = 125,
                  time_to_wait = 0,
                  zoom = 1
                },
              },
              --start_position = player.character.position,
              --start_zoom = 4
            }
          end
        end
      end,
      condition = story_elapsed_check(0),
      action =
      function()
		game.show_message_dialog{text = {"msg-base-5"}, point_to={type="position", position={x=417.5,y=420.5}}}

      end
    },
	{
      condition = story_elapsed_check(1),
      action =
      function()
		set_goal({"goal-destroy-drone2"})
      end
    },
	{
      init = function()
		game.players[1].character.destructible = true
      end
    },
	{
      condition = story_elapsed_check(6),
      action =
      function()

		game.show_message_dialog{text = {"msg-base-6"}}	
      end
    },
	{
      action =
      function()
        game.show_message_dialog{text = {"msg-base-7"}}
        global.arrow = game.players[1].surface.create_entity{name="orange-arrow-with-circle", position={x=24.9,y=37.4}}
      end
    },
	{
	  condition = story_elapsed_check(8),
      action =
      function()
        if global.arrow then global.arrow.destroy() end
      end
    },
	{
      action =
      function()
	    game.show_message_dialog{text = {"msg-base-8.1"}}
		set_goal("")
      end
    },
	{
      condition = story_elapsed_check(2),
      action =
      function()
        set_goal({"goal-destroy-drone3"})
      end
    },
    {
      condition = story_elapsed_check(18),
      action =
      function()
        game.show_message_dialog{text = {"msg-base-8"}}
		set_goal("")
      end
    },
    -------------------------------
	-- /// PIRATE GUN TURRETS /// --
	-------------------------------
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
        global.radar5 = game.surfaces[1].find_entities_filtered{name = "small-scorchmark-tintable", limit = 1}[1]
        if global.radar5 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
				{
                  target = global.radar5,
                  transition_time = 100,
                  time_to_wait = 300,
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
      condition = story_elapsed_check(1),
    },
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
			game.forces.enemy.evolution_factor = 0
			game.map_settings.enemy_expansion.enabled = false
			game.map_settings.enemy_evolution.enabled = false
			
		elseif game.difficulty == defines.difficulty.normal then  
			game.forces.enemy.evolution_factor = .10
			game.map_settings.enemy_expansion.enabled = true
			game.map_settings.enemy_evolution.enabled = true
			
		elseif game.difficulty == defines.difficulty.hard then  
		    game.forces.enemy.evolution_factor = .50
			game.map_settings.enemy_expansion.enabled = true
			game.map_settings.enemy_evolution.enabled = true
        end
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
      action = function()
	    set_goal({"goal-destroy-blockade",0,4})
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
        if event.name == defines.events.on_combat_robot_expired then 
		  global.units_killed = global.units_killed + 4
		  set_goal({"goal-destroy-blockade",global.units_killed,4})
		  game.surfaces[1].create_entity({name='artillery-projectile', target={566,-78}, speed=1, position = {600,-200}, force = "enemy"})	  
	      game.surfaces[1].create_entity({name='artillery-projectile', target={566,-81}, speed=1, position = {600,-250}, force = "enemy"})
          game.surfaces[1].create_entity({name='artillery-projectile', target={566,-84}, speed=1, position = {600,-150}, force = "enemy"})		
		  game.surfaces[1].create_entity({name='big-biter',position={x=235,y=5}})	
		  game.surfaces[1].create_entity({name='big-biter',position={x=236,y=6}})	
		  game.surfaces[1].create_entity({name='big-biter',position={x=237,y=-7}})	
		  game.surfaces[1].create_entity({name='big-biter',position={x=238,y=11}})	
		  game.surfaces[1].create_entity({name='big-biter',position={x=235,y=11}})	
		  game.surfaces[1].create_entity({name='big-biter',position={x=234,y=5}})	
          game.surfaces[1].create_entity({name='big-biter',position={x=237,y=7}})	
		  game.surfaces[1].create_entity({name='big-biter',position={x=238,y=8}})	
		  game.surfaces[1].create_entity({name='big-biter',position={x=237,y=9}})	
		  game.surfaces[1].create_entity({name='big-biter',position={x=238,y=10}})	
		  game.surfaces[1].create_entity({name='big-biter',position={x=438,y=509}})	
		  game.surfaces[1].create_entity({name='big-biter',position={x=438,y=508}})	
		  game.surfaces[1].create_entity({name='big-biter',position={x=440,y=510}})
		  game.surfaces[1].create_entity({name='big-biter',position={x=439,y=510}})
		  game.surfaces[1].create_entity({name='big-biter',position={x=441,y=510}})
		  game.surfaces[1].create_entity({name='big-biter',position={x=438,y=510}})
		  game.surfaces[1].create_entity({name='big-biter',position={x=438,y=511}})
		  game.surfaces[1].create_entity({name='big-biter',position={x=438,y=512}})
		  game.surfaces[1].create_entity({name='big-biter',position={x=438,y=513}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=231,y=6}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=231,y=6},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=228,y=12}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=228,y=12},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=246,y=14}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=246,y=14},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=243,y=6}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=243,y=6},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=198,y=103}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=198,y=103},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=207,y=115}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=207,y=115},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=224,y=119}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=224,y=119},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=417,y=515}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=417,y=515},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=425,y=509}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=425,y=509},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=433,y=503}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=433,y=503},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=465,y=459}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=465,y=459},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=466,y=453}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=466,y=453},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=331,y=554}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=331,y=554},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=417,y=341}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=417,y=341},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=427,y=337}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=427,y=337},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=422,y=347}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=422,y=347},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=428,y=552}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=428,y=552},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=441,y=556}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=441,y=556},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=430,y=554}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=430,y=554},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=414,y=561}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=414,y=561},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=610,y=-5}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=610,y=-5},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=630,y=-95}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=630,y=-95},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=64,y=-142}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=64,y=-142},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=27,y=-155}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=27,y=-155},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=175,y=224}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=175,y=224},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=185,y=231}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=185,y=231},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=175,y=-224}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=175,y=-224},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=185,y=-231}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=185,y=-231},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=547,y=-155}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=547,y=-155},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=607,y=357}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=607,y=357},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=622,y=358}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=622,y=358},name = "enemy-decal",}}})
		  game.map_settings.enemy_expansion.enabled = true	
		  game.show_message_dialog{text = {"msg-base-angry"}}
		elseif event.name == defines.events.on_entity_died and
           event.entity.name == "gun-turret" and
		   event.entity.force.name == "enemy" then
          global.units_killed = global.units_killed + 1
		  set_goal({"goal-destroy-blockade",global.units_killed,4})
        end
      end,
      condition = function() return global.units_killed >= 4 end,
      action = function()
        set_goal("")
      end
    },
	-------------------------------
	-- /// ENEMY HACKED LASER /// --
	-------------------------------
	{
      condition = story_elapsed_check(1),
      action =
      function()
        game.show_message_dialog{text = {"msg-base-9"}}
		game.show_message_dialog{text = {"msg-base-10"}}

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
		    game.forces.enemy.evolution_factor = .60
        end
      end
    },	
	{
      condition = story_elapsed_check(1),
      action = function()
	    set_goal({"goal-destroy-laser",0,15})
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
          unit_count = 5
        }
      end,
      update = function(event)
        if event.name == defines.events.on_combat_robot_expired then 
		  global.units_killed = global.units_killed + 15
		  set_goal({"goal-destroy-laser",global.units_killed,15})
		  game.surfaces[1].create_entity({name='big-biter',position={x=235,y=5}})	
		  game.surfaces[1].create_entity({name='big-biter',position={x=236,y=6}})	
		  game.surfaces[1].create_entity({name='big-biter',position={x=237,y=-7}})	
		  game.surfaces[1].create_entity({name='big-biter',position={x=238,y=11}})	
		  game.surfaces[1].create_entity({name='big-biter',position={x=235,y=11}})	
		  game.surfaces[1].create_entity({name='big-biter',position={x=234,y=5}})	
          game.surfaces[1].create_entity({name='big-biter',position={x=237,y=7}})	
		  game.surfaces[1].create_entity({name='big-biter',position={x=238,y=8}})	
		  game.surfaces[1].create_entity({name='big-biter',position={x=237,y=9}})	
		  game.surfaces[1].create_entity({name='big-biter',position={x=238,y=10}})	
		  game.surfaces[1].create_entity({name='big-biter',position={x=438,y=509}})	
		  game.surfaces[1].create_entity({name='big-biter',position={x=438,y=508}})	
		  game.surfaces[1].create_entity({name='big-biter',position={x=440,y=510}})
		  game.surfaces[1].create_entity({name='big-biter',position={x=439,y=510}})
		  game.surfaces[1].create_entity({name='big-biter',position={x=441,y=510}})
		  game.surfaces[1].create_entity({name='big-biter',position={x=438,y=510}})
		  game.surfaces[1].create_entity({name='big-biter',position={x=438,y=511}})
		  game.surfaces[1].create_entity({name='big-biter',position={x=438,y=512}})
		  game.surfaces[1].create_entity({name='big-biter',position={x=438,y=513}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=231,y=6}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=231,y=6},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=228,y=12}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=228,y=12},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=246,y=14}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=246,y=14},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=243,y=6}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=243,y=6},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=198,y=103}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=198,y=103},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=207,y=115}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=207,y=115},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=224,y=119}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=224,y=119},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=417,y=515}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=417,y=515},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=425,y=509}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=425,y=509},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=433,y=503}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=433,y=503},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=465,y=459}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=465,y=459},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=466,y=453}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=466,y=453},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=331,y=554}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=331,y=554},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=417,y=341}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=417,y=341},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=427,y=337}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=427,y=337},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=422,y=347}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=422,y=347},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=428,y=552}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=428,y=552},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=441,y=556}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=441,y=556},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=430,y=554}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=430,y=554},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=414,y=561}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=414,y=561},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=610,y=-5}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=610,y=-5},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=630,y=-95}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=630,y=-95},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=64,y=-142}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=64,y=-142},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=27,y=-155}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=27,y=-155},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=175,y=224}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=175,y=224},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=185,y=231}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=185,y=231},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='spitter-spawner',position={x=175,y=-224}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=175,y=-224},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=185,y=-231}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=185,y=-231},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=547,y=-155}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=547,y=-155},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=607,y=357}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=607,y=357},name = "enemy-decal",}}})
		  game.surfaces[1].create_entity({name='biter-spawner',position={x=622,y=358}})	
		  game.surfaces[1].create_decoratives({check_collision = false, decoratives = {{position = {x=622,y=358},name = "enemy-decal",}}})
		  game.map_settings.enemy_expansion.enabled = true
          game.show_message_dialog{text = {"msg-base-angry"}}		  
		elseif
 		event.name == defines.events.on_entity_died and
           event.entity.name == "laser-turret" and
		   event.entity.force.name == "enemy" then
          global.units_killed = global.units_killed + 1
		  set_goal({"goal-destroy-laser",global.units_killed,15})
        end
      end,
      condition = function() return global.units_killed >= 15 end,
      action = function()
        set_goal("")
      end
    },
	{
      condition = story_elapsed_check(1),
      action =
      function()
        game.show_message_dialog{text = {"msg-base-11"}}
		game.show_message_dialog{text = {"msg-base-12"}}
		story_show_message_dialog{text={"msg-base-12.1"},
                                 image = "targeting.png"}
      end
    },
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
			game.forces.enemy.evolution_factor = .10
		elseif game.difficulty == defines.difficulty.normal then  
			game.forces.enemy.evolution_factor = .30
		elseif game.difficulty == defines.difficulty.hard then  
		    game.forces.enemy.evolution_factor = .70
        end
      end
    },
	-------------------------------
	-- /// ENEMY STEAM TURBINES /// --
	-------------------------------
	{
      init = function()
        game.surfaces[1].create_entity({name='steam-turbine',position={x=341.5,y=215.5},force="enemy",direction=defines.direction.east})  
		game.surfaces[1].create_entity({name='steam-turbine',position={x=341.5,y=212.5},force="enemy",direction=defines.direction.east})  
 		game.surfaces[1].create_entity({name='steam-turbine',position={x=418.5,y=305.5},force="enemy",direction=defines.direction.east})  
		game.surfaces[1].create_entity({name='steam-turbine',position={x=441.5,y=276.5},force="enemy",direction=defines.direction.east})  	
		game.surfaces[1].create_entity({name='steam-turbine',position={x=464.5,y=288.5},force="enemy",direction=defines.direction.east}) 
		game.surfaces[1].create_entity({name='steam-turbine',position={x=464.5,y=285.5},force="enemy",direction=defines.direction.east}) 
      end 
    },
	{
      condition = story_elapsed_check(1),
      action = function()
	    set_goal({"goal-destroy-turbine",0,6})
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
          unit_count = 1
        }
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "steam-turbine" and
		   event.entity.force.name == "enemy" then
          global.units_killed = global.units_killed + 1
		  set_goal({"goal-destroy-turbine",global.units_killed,6})
        end
      end,
      condition = function() return global.units_killed >= 6 end,
      action = function()
        set_goal("")
      end
    },
	{
      condition = story_elapsed_check(2),
      action =
      function()
        set_goal("")
      end
	},
	{
      condition = story_elapsed_check(3),
      action =
      function()
        game.show_message_dialog{text = {"msg-base-13"}}
		game.show_message_dialog{text = {"msg-base-14"}}
		game.show_message_dialog{text = {"msg-base-15"}}
      end
    },
		{
      action =
      function()
        if game.difficulty == defines.difficulty.easy then
			game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-04")}) -- YOU WIN THE GAME
		elseif game.difficulty == defines.difficulty.normal then  
			game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-04")}) -- YOU WIN THE GAME
		elseif game.difficulty == defines.difficulty.hard then  
		    game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-04")}) -- YOU WIN THE GAME
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
  defines.events.on_combat_robot_expired,
  defines.events.on_player_died,
  defines.events.on_gui_click,
} 


local function on_configuration_changed()
	game.reload_script()
end 
 
 script.on_event(story_events, function(event)
   if game.players[1].character then
     check_for_player_death(event)
     story_update(global.story, event)
   end
end)

-- script.on_event(story_events, function(event)
  -- if event.name == defines.events.on_tick then -- separate for on_tick because of timers
    -- if game.players[1].character then
      -- check_for_player_death(event)
      -- story_update(global.story, event)
    -- end
    -- if global.timers then
      -- for _, timer in pairs(global.timers) do
        -- if timer.running then
          -- timer.tick(timer, event)
        -- end
      -- end
    -- else
      -- global.timers = {}
    -- end
  -- else
    -- story_dispatch_event(global.story, event)
  -- end
-- end)

 

script.on_event(defines.events.on_player_created, function(event)
  on_player_created(event)
end)


script.on_event(defines.events.on_player_crafted_item, check_automate_science_packs_advice)
script.on_event(defines.events.on_gui_click, intro_screen.on_gui_click)
script.on_init(on_configuration_changed)
script.on_configuration_changed(on_configuration_changed)


