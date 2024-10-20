require "util"
local intro_screen = require("intro_screen")
require "story"

local think = function(thought)
  game.players[1].print({"","[img=entity/character][color=orange]",{"engineer-title"},": [/color]",{"think-"..thought}})
end

function check_for_player_death(event)
  if event.name == defines.events.on_player_died then
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
  -- game.forces.player.reset()
  game.forces.player.research_queue_enabled = true
  
  global.medium_pole = game.get_entity_by_tag("inserter")



  local recipe_list = player.force.recipes
  -- game.players[1].clear_recipe_notifications()

  local technology_list = game.forces.player.technologies
  
  technology_list["automation"].researched = true
  technology_list["stone-wall"].researched = true
  
  technology_list["optics"].enabled = true
  technology_list["gun-turret"].enabled = true
  technology_list["logistics"].enabled = true
  technology_list["military"].enabled = true
  technology_list["logistic-science-pack"].enabled = true
  technology_list["steel-processing"].enabled = true
  technology_list["electronics"].enabled = true 
  technology_list["fast-inserter"].enabled = true 
  technology_list["automation-2"].enabled = true
  technology_list["electric-energy-distribution-1"].enabled = true 
  technology_list["engine"].enabled = true 
  technology_list["fluid-handling"].enabled = true 
  technology_list["oil-processing"].enabled = true
  technology_list["logistics"].enabled = true
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
  technology_list["modules"].enabled = true -- add new
  technology_list["speed-module"].enabled = true -- add new
  technology_list["effectivity-module"].enabled = true -- add new
  technology_list["productivity-module"].enabled = true -- add new
  technology_list["sulfur-processing"].enabled = true
  technology_list["toolbelt"].enabled = true
  technology_list["advanced-electronics"].enabled = true
  technology_list["explosives"].enabled = true
  technology_list["land-mine"].enabled = true
  technology_list["electric-energy-accumulators"].enabled = true
  technology_list["laser-turret"].enabled = false -- add new - late in game
  technology_list["tank"].enabled = true
  technology_list["circuit-network"].enabled = true
  technology_list["night-vision-equipment"].enabled = true --add new
  technology_list["solar-panel-equipment"].enabled = true -- add new
  technology_list["energy-shield-equipment"].enabled = false
  technology_list["belt-immunity-equipment"].enabled = true -- add new
  technology_list["battery-equipment"].enabled = true -- add new
  technology_list["modular-armor"].enabled = true -- add mew
  technology_list["military-3"].enabled = true
  technology_list["railway"].enabled = true
  technology_list["automated-rail-transportation"].enabled = true
  technology_list["rail-signals"].enabled = true
  technology_list["automobilism"].enabled = true
  technology_list["gate"].enabled = true
  technology_list["rocketry"].enabled = false --add new
  technology_list["battery"].enabled = true
  technology_list["plastics"].enabled = true
  technology_list["fluid-wagon"].enabled = true
  technology_list["stack-inserter"].enabled = true


  --blocked tech
  technology_list["automation-3"].enabled = false
  technology_list["explosive-rocketry"].enabled = false
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
  technology_list["energy-weapons-damage-1"].enabled = false
  technology_list["energy-weapons-damage-2"].enabled = false
  technology_list["energy-weapons-damage-3"].enabled = false
  technology_list["inserter-capacity-bonus-1"].enabled = true
  technology_list["inserter-capacity-bonus-2"].enabled = true
  technology_list["inserter-capacity-bonus-3"].enabled = true
  technology_list["laser-shooting-speed-1"].enabled = false
  technology_list["laser-shooting-speed-2"].enabled = false
  technology_list["laser-shooting-speed-3"].enabled = false
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
    {
      init = function()
	  global.radar = game.surfaces[1].find_entities_filtered{name = "rocket-silo", limit = 1}[1]
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
        global.radar = game.surfaces[1].find_entities_filtered{name = "small-remnants", limit = 1}[1]
        if global.radar then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
				{
                  target = global.radar,
                  transition_time = 600,
                  time_to_wait = 25,
                  zoom = 2
                },
				{
                  target = player.character,
                  transition_time = 200,
                  time_to_wait = 100,
                  zoom = 2
                },
              },
              start_position = global.radar.position,
              start_zoom = 4
            }
          end
        end
      end,
	  condition = story_elapsed_check(3),
    },
	{
	  
      action = function()
      local character = game.players[1]
        character.insert{name = "steel-plate", count = 20}
		character.insert{name = "copper-plate", count = 20}
        character.insert{name = "medium-electric-pole", count = 1}
		character.insert{name = "pistol", count = 1}
		character.insert{name = "coal", count = 10}
        character.insert{name = "iron-gear-wheel", count = 50}
      end
    },
    {
      condition = story_elapsed_check(1),
      action =
      function()
        game.show_message_dialog{text = {"msg-base-1"}}
        game.show_message_dialog{text = {"msg-base-2"}}
        game.show_message_dialog{text = {"msg-base-3"}}
		game.show_message_dialog{text = {"msg-base-4"}}
		
      end
    },
    {
      condition = story_elapsed_check(1),
      action =
      function()
	    set_goal({"goal-repair-gate"})
      end
    },
	-------------------------------
	-- /// NORTH MAIN GATE /// --
	-------------------------------
    {
      condition = story_elapsed_check(26),
      action =
      function()
        game.show_message_dialog{text = {"msg-base-5"}}
      end
    },
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
	{
      init = function()
        global.radar2 = game.surfaces[1].find_entities_filtered{name = "1x2-remnants", limit = 1}[1]
        if global.radar2 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
				{
                  target = global.radar2,
                  transition_time = 150,
                  time_to_wait = 300,
                  zoom = 2
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
	  condition = story_elapsed_check(3),
    },
    {
      condition = story_elapsed_check(1),
      action =
      function()
        set_goal({"goal-repair-gate2"})
      end
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
         think("repair")
      end
    },	
    {
      condition = function() return global.medium_pole.energy > 0 end,
      action = function()
        set_goal("")
      end
    },	
	-------------------------------
	-- /// WILDENESS SCOUTING /// --
	-------------------------------
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
			character.insert{name = "firearm-magazine", count = 72}
			game.forces.enemy.evolution_factor = 0
			game.map_settings.enemy_expansion.enabled = false
			game.map_settings.enemy_evolution.enabled = false
			
		elseif game.difficulty == defines.difficulty.normal then  
		    game.forces.enemy.evolution_factor = 0
			game.map_settings.enemy_expansion.enabled = false
			game.map_settings.enemy_evolution.enabled = true
			
		elseif game.difficulty == defines.difficulty.hard then  
		    game.map_settings.enemy_expansion.enabled = true
			game.map_settings.enemy_evolution.enabled = true
			game.forces.enemy.evolution_factor = .50
        end
      end
    },
	{
      condition = story_elapsed_check(1),
      action =
      function()
        game.show_message_dialog{text = {"msg-base-6"}}
      end
    },
	{
      init = function()
        set_goal({"goal-build-base",0,6})
        global.drills = 0
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and event.entity.name == 'electric-mining-drill' then
          global.drills = global.drills - 1
          set_goal({"goal-build-base",global.drills,6},true)
        elseif event.name == defines.events.on_built_entity and event.created_entity.name == 'electric-mining-drill' then
          global.drills = global.drills + 1
          set_goal({"goal-build-base",global.drills,6})
        elseif event.name == defines.events.on_player_mined_entity and event.entity.name =='electric-mining-drill' then
          global.drills = global.drills - 1
          set_goal({"goal-build-base",global.drills,6},true)
        end
      end,
      condition = function(event)
        return global.drills >= 6
      end
    },
	{
      init = function()
        game.surfaces[1].create_entity({name='stone-wall',position={x=169.5,y=-47.5},force="base"})  
		game.surfaces[1].create_entity({name='stone-wall',position={x=170.5,y=-47.5},force="base"})  
		game.surfaces[1].create_entity({name='stone-wall',position={x=171.5,y=-47.5},force="base"}) 
		game.surfaces[1].create_entity({name='stone-wall',position={x=172.5,y=-47.5},force="base"}) 
		game.surfaces[1].create_entity({name='stone-wall',position={x=173.5,y=-47.5},force="base"})
		game.surfaces[1].create_entity({name='stone-wall',position={x=174.5,y=-47.5},force="base"})
		game.surfaces[1].create_entity({name='stone-wall',position={x=175.5,y=-47.5},force="base"})
		game.surfaces[1].create_entity({name='stone-wall',position={x=176.5,y=-47.5},force="base"})
		game.surfaces[1].create_entity({name='laser-turret',position={x=168,y=-44},force="base tower"})
		game.surfaces[1].create_entity({name='laser-turret',position={x=164,y=-44},force="base tower"})
        game.surfaces[1].create_entity({name='laser-turret',position={x=178,y=-44},force="base tower"})
		game.surfaces[1].create_entity({name='laser-turret',position={x=168,y=-42},force="base tower"})
		game.surfaces[1].create_entity({name='laser-turret',position={x=164,y=-42},force="base tower"})
        game.surfaces[1].create_entity({name='laser-turret',position={x=178,y=-42},force="base tower"})	
		game.surfaces[1].create_entity({name='land-mine',position={x=169.5,y=-52.5},force="base tower"})  
		game.surfaces[1].create_entity({name='land-mine',position={x=170.5,y=-52.5},force="base tower"})  
		game.surfaces[1].create_entity({name='land-mine',position={x=171.5,y=-52.5},force="base tower"}) 
		game.surfaces[1].create_entity({name='land-mine',position={x=172.5,y=-52.5},force="base tower"}) 
		game.surfaces[1].create_entity({name='land-mine',position={x=173.5,y=-52.5},force="base tower"})
		game.surfaces[1].create_entity({name='land-mine',position={x=174.5,y=-52.5},force="base tower"})
		game.surfaces[1].create_entity({name='land-mine',position={x=175.5,y=-52.5},force="base tower"})
		game.surfaces[1].create_entity({name='land-mine',position={x=176.5,y=-52.5},force="base tower"})	
		game.surfaces[1].create_entity({name='land-mine',position={x=169.5,y=-55.5},force="base tower"})  
		game.surfaces[1].create_entity({name='land-mine',position={x=170.5,y=-55.5},force="base tower"})  
		game.surfaces[1].create_entity({name='land-mine',position={x=171.5,y=-55.5},force="base tower"}) 
		game.surfaces[1].create_entity({name='land-mine',position={x=172.5,y=-55.5},force="base tower"}) 
		game.surfaces[1].create_entity({name='land-mine',position={x=173.5,y=-55.5},force="base tower"})
		game.surfaces[1].create_entity({name='land-mine',position={x=174.5,y=-55.5},force="base tower"})
		game.surfaces[1].create_entity({name='land-mine',position={x=175.5,y=-55.5},force="base tower"})
		game.surfaces[1].create_entity({name='land-mine',position={x=176.5,y=-55.5},force="base tower"})			
      end 
    },
	-------------------------------
	-- /// BUILD TURRETS /// --
	-------------------------------
	{
      condition = story_elapsed_check(1),
      action =
      function()
         think("secure-base")
      end
    },
	{
      condition = story_elapsed_check(3)
	},
	{
      init = function()
        set_goal({"goal-build-turret",0,5})
        global.turrets = 0
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and event.entity.name == 'gun-turret' then
          global.turrets = global.turrets - 1
          set_goal({"goal-build-turret",global.turrets,5},true)
        elseif event.name == defines.events.on_built_entity and event.created_entity.name == 'gun-turret' then
          global.turrets = global.turrets + 1
          set_goal({"goal-build-turret",global.turrets,5})
        elseif event.name == defines.events.on_player_mined_entity and event.entity.name =='gun-turret' then
          global.turrets = global.turrets - 1
          set_goal({"goal-build-turret",global.turrets,5},true)
        end
      end,
      condition = function(event)
        return global.turrets >= 5
      end
    },
	-----------------------
	-- /// BUILD OIL /// --
	-----------------------
    {
      condition = story_elapsed_check(1),
      action =
      function()
         think("oil")
      end
    },
	{
	  condition = story_elapsed_check(2),
      action =
      function()
        set_goal({"goal-oil"})

      end
    },
	{
      condition =
      function(event)
        return (event.name == defines.events.on_built_entity and event.created_entity.name == "pumpjack")
          or game.players[1].force.get_entity_count("pumpjack") > 0
      end
    },
	{
      condition = story_elapsed_check(2),
      action =
      function()
        game.show_message_dialog{text = {"msg-base-7"}}
      end
    },
	-------------------------------
	-- /// DESTROY BITERS /// --
	-------------------------------
	{
      condition = story_elapsed_check(1),
      action =
      function()
         think("biter1")
      end
    },
	{
	  condition = story_elapsed_check(1),
      action =
      function()
        set_goal({"goal-destroy-biter"})

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
          unit_count = 0
        }
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "small-biter" or
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "small-spitter" or	
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "medium-biter" or
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "medium-spitter" then
          global.units_killed = global.units_killed + 1
        end
      end,
      condition = function() return global.units_killed >= 25 end,
      action = function()
        set_goal({"goal-destroy-biter1.1"})
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
           event.entity.name == "small-biter" or
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "small-spitter" or	
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "medium-biter" or
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "medium-spitter" then
          global.units_killed = global.units_killed + 1
        end
      end,
      condition = function() return global.units_killed >= 15 end,
      action = function()
        set_goal({"goal-destroy-biter1.2"})
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
          unit_count = 10
        }
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "small-biter" or
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "small-spitter" or	
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "medium-biter" or
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "medium-spitter" then
          global.units_killed = global.units_killed + 1
        end
      end,
      condition = function() return global.units_killed >= 10 end,
      action = function()
        set_goal("")
      end
    },
    {
      condition = story_elapsed_check(2),
      action =
      function()
        game.show_message_dialog{text = {"msg-base-8"}}
      end
    },
	------------------------
	-- /// MORE OILS /// --
	------------------------
	{
      condition = story_elapsed_check(3),
      action =
      function()
         think("more-oil")
      end
    },
	{
      condition = story_elapsed_check(2)
    },
	{
	  condition = story_elapsed_check(1),
      action =
      function()
        set_goal({"goal-oil2"})
      end
    },
	-- {
      -- init = function()
        -- set_goal({"goal-oil2",0,10})
        -- global.pumpjacks = 0
      -- end,
      -- update = function(event)
        -- if event.name == defines.events.on_entity_died and event.entity.name == 'pumpjack' then
          -- global.pumpjacks = global.pumpjacks - 1
          -- set_goal({"goal-oil2",global.pumpjacks,10},true)
        -- elseif event.name == defines.events.on_built_entity and event.created_entity.name == 'pumpjack' then
          -- global.pumpjacks = global.pumpjacks + 1
          -- set_goal({"goal-oil2",global.pumpjacks,10})
        -- elseif event.name == defines.events.on_player_mined_entity and event.entity.name =='pumpjack' then
          -- global.pumpjacks = global.pumpjacks - 1
          -- set_goal({"goal-oil2",global.pumpjacks,10},true)
        -- end
      -- end,
      -- condition = function(event)
        -- return global.pumpjacks >= 10
      -- end
    -- },
	{
      condition =
      function(event)
        return (event.name == defines.events.on_built_entity and event.created_entity.name == "pumpjack")
          or game.players[1].force.get_entity_count("pumpjack") > 0
      end
    },
		{
      condition =
      function(event)
        return (event.name == defines.events.on_built_entity and event.created_entity.name == "pumpjack")
          or game.players[1].force.get_entity_count("pumpjack") > 1
      end
    },
		{
      condition =
      function(event)
        return (event.name == defines.events.on_built_entity and event.created_entity.name == "pumpjack")
          or game.players[1].force.get_entity_count("pumpjack") > 2
      end
    },
		{
      condition =
      function(event)
        return (event.name == defines.events.on_built_entity and event.created_entity.name == "pumpjack")
          or game.players[1].force.get_entity_count("pumpjack") > 3
      end
    },
		{
      condition =
      function(event)
        return (event.name == defines.events.on_built_entity and event.created_entity.name == "pumpjack")
          or game.players[1].force.get_entity_count("pumpjack") > 4
      end
    },
		{
      condition =
      function(event)
        return (event.name == defines.events.on_built_entity and event.created_entity.name == "pumpjack")
          or game.players[1].force.get_entity_count("pumpjack") > 5
      end
    },
		{
      condition =
      function(event)
        return (event.name == defines.events.on_built_entity and event.created_entity.name == "pumpjack")
          or game.players[1].force.get_entity_count("pumpjack") > 6
      end
    },
		{
      condition =
      function(event)
        return (event.name == defines.events.on_built_entity and event.created_entity.name == "pumpjack")
          or game.players[1].force.get_entity_count("pumpjack") > 7
      end
    },
		{
      condition =
      function(event)
        return (event.name == defines.events.on_built_entity and event.created_entity.name == "pumpjack")
          or game.players[1].force.get_entity_count("pumpjack") > 8
      end
    },
		{
      condition =
      function(event)
        return (event.name == defines.events.on_built_entity and event.created_entity.name == "pumpjack")
          or game.players[1].force.get_entity_count("pumpjack") > 9
      end
    },
	{
      action =
      function()
	     set_goal("")
      end
    },
	-------------------------------
	-- /// BUILD LASER TURRETS /// --
	-------------------------------
	{
      action =
      function()
	    game.players[1].force.technologies["laser-turret"].enabled = true
      end
    },
    {
      condition = story_elapsed_check(3),
      action =
      function()
         think("secure2-base")
      end
    },
	{
      condition = story_elapsed_check(4)
    },
	{
      init = function()
        set_goal({"goal-laser",0,7})
        global.lasers = 0
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and event.entity.name == 'laser-turret' then
          global.lasers = global.lasers - 1
          set_goal({"goal-laser",global.lasers,7},true)
        elseif event.name == defines.events.on_built_entity and event.created_entity.name == 'laser-turret' then
          global.lasers = global.lasers + 1
          set_goal({"goal-laser",global.lasers,7})
        elseif event.name == defines.events.on_player_mined_entity and event.entity.name =='laser-turret' then
          global.lasers = global.lasers - 1
          set_goal({"goal-laser",global.lasers,7},true)
        end
      end,
      condition = function(event)
        return global.lasers >= 7
      end
    },
	--------------------------
	-- /// FUEL EXPORT /// --
	--------------------------
	{
      condition = story_elapsed_check(2),
      action =
      function()
        game.show_message_dialog{text = {"msg-base-8.1"}}
		game.forces.enemy.evolution_factor = .25
      end
    },
	{
      update = (function()
        local only_update = false
        return function(event)
          local solid_fuel = game.players[1].character.get_item_count("solid-fuel")
          set_goal
          (
            {
              "goal-hard-oil",
              solid_fuel,
              250
            },
            only_update
          )
          only_update = true
        end
      end)(),
      condition = function()
        return 
               game.players[1].character.get_item_count("solid-fuel") >= 250
      end,
      action = function()
        set_goal("")
      end
    },
	---------------------------------------
	-- /// DESTROY AGAIN SOME BITERS /// --
	---------------------------------------
	{
      condition = story_elapsed_check(2),
      action =
      function()
         think("biter2")
      end
    },
    {
	  condition = story_elapsed_check(2),
      action =
      function()
        set_goal({"goal-destroy-biter2"})

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
          unit_count = 0
        }
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "small-biter" or
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "small-spitter" or	
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "medium-biter" or
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "medium-spitter" then
          global.units_killed = global.units_killed + 1
        end
      end,
      condition = function() return global.units_killed >= 50 end,
      action = function()
        set_goal({"goal-destroy-biter2.1"})
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
           event.entity.name == "small-biter" or
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "small-spitter" or	
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "medium-biter" or
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "medium-spitter" then
          global.units_killed = global.units_killed + 1
        end
      end,
      condition = function() return global.units_killed >= 50 end,
      action = function()
        set_goal({"goal-destroy-biter2.2"})
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
           event.entity.name == "small-biter" or
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "small-spitter" or	
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "medium-biter" or
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "medium-spitter" then
          global.units_killed = global.units_killed + 1
        end
      end,
      condition = function() return global.units_killed >= 50 end,
      action = function()
        set_goal({"goal-destroy-biter2.3"})
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
          unit_count = 25
        }
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "small-biter" or
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "small-spitter" or	
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "medium-biter" or
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "medium-spitter" then
          global.units_killed = global.units_killed + 1
        end
      end,
      condition = function() return global.units_killed >= 25 end,
      action = function()
        set_goal({"goal-destroy-biter2.4"})
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
           event.entity.name == "small-biter" or
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "small-spitter" or	
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "medium-biter" or
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "medium-spitter" then
          global.units_killed = global.units_killed + 1
        end
      end,
      condition = function() return global.units_killed >= 15 end,
      action = function()
        set_goal({"goal-destroy-biter2.5"})
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
          unit_count = 10
        }
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and
           event.entity.name == "small-biter" or
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "small-spitter" or	
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "medium-biter" or
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "medium-spitter" then
          global.units_killed = global.units_killed + 1
        end
      end,
      condition = function() return global.units_killed >= 10 end,
      action = function()
        set_goal("")
      end
    },
	{
      condition = story_elapsed_check(2),
      action =
      function()
        game.show_message_dialog{text = {"msg-base-9"}}
      end
    },
	{
      action =
      function()
        if game.difficulty == defines.difficulty.easy then
			game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-03")}) -- YOU WIN THE GAME
		elseif game.difficulty == defines.difficulty.normal then  
			game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-03")}) -- YOU WIN THE GAME
		elseif game.difficulty == defines.difficulty.hard then  
		    game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-03")}) -- YOU WIN THE GAME
        end
      end
    },
  }
}

story_init_helpers(story_table)


script.on_init(function()
  global.story = story_init(story_table)
  --game.map_settings.enemy_expansion.enabled = false
  --game.forces.enemy.evolution_factor = 0
  --game.map_settings.enemy_evolution.enabled = false
  
  
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
  defines.events.on_player_died
} 

local function on_configuration_changed()
	game.reload_script()
end 
 
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