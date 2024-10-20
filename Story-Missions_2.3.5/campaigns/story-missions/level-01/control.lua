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
  game.map_settings.enemy_expansion.enabled = false
  game.forces.enemy.evolution_factor = 0
  game.map_settings.enemy_evolution.enabled = false
  --game.disable_tips_and_tricks()
  -- game.players[1].force.disable_all_prototypes()
  global.storage_tank = game.get_entity_by_tag("storage-tank")
  local entities =
  {
    global.storage_tank
  }
  for index, entity in pairs(entities) do
    entity.minable = false
    entity.destructible = false
  end
  global.intro_entities = entities
  

  global.car1 = game.get_entity_by_tag("car1")
  local entities2 =
  {
	global.car1
  }
  for index, entity in pairs(entities2) do
    entity.minable = false
  end
  global.intro_entities2 = entities2

  
  local recipe_list = player.force.recipes
  -- game.players[1].clear_recipe_notifications()
  recipe_list["chemical-plant"].enabled = false

  local technology_list = game.forces.player.technologies  
  technology_list["automation"].researched = true
  technology_list["stone-wall"].researched = true
  
  technology_list["optics"].enabled = true
  technology_list["gun-turret"].researched = true
  technology_list["logistics"].enabled = true
  technology_list["military"].enabled = true
  technology_list["logistic-science-pack"].researched = true
  technology_list["steel-processing"].enabled = true
  technology_list["electronics"].researched = true 
  technology_list["fast-inserter"].enabled = true 
  technology_list["automation-2"].enabled = true
  technology_list["electric-energy-distribution-1"].enabled = true 
  technology_list["engine"].enabled = true 
  technology_list["fluid-handling"].enabled = true 
  technology_list["oil-processing"].researched = true
  technology_list["logistics"].enabled = true
  technology_list["heavy-armor"].enabled = true
  technology_list["steel-axe"].enabled = true 
  technology_list["military-2"].enabled = true
  technology_list["chemical-science-pack"].enabled = true
  technology_list["military-science-pack"].enabled = true 
  technology_list["logistics-2"].enabled = true
  technology_list["advanced-material-processing"].enabled = true
  technology_list["solar-energy"].enabled = true
  technology_list["laser"].enabled = false
  technology_list["flamethrower"].enabled = true
  technology_list["flammables"].researched = true
  technology_list["modules"].enabled = false
  technology_list["speed-module"].enabled = false
  technology_list["effectivity-module"].enabled = false
  technology_list["productivity-module"].enabled = false
  technology_list["sulfur-processing"].researched = true
  technology_list["toolbelt"].enabled = true
  technology_list["advanced-electronics"].researched = true
  technology_list["explosives"].enabled = true
  technology_list["land-mine"].enabled = true
  technology_list["electric-energy-accumulators"].enabled = true
  technology_list["laser-turret"].enabled = false
  technology_list["tank"].enabled = false
  technology_list["circuit-network"].enabled = true
  technology_list["night-vision-equipment"].enabled = false
  technology_list["solar-panel-equipment"].enabled = false
  technology_list["energy-shield-equipment"].enabled = false
  technology_list["battery-equipment"].enabled = false
  technology_list["modular-armor"].enabled = false
  technology_list["military-3"].enabled = true
  technology_list["railway"].enabled = true
  technology_list["automated-rail-transportation"].enabled = false
  technology_list["rail-signals"].enabled = true
  technology_list["gate"].enabled = true
  technology_list["rocketry"].enabled = false
  technology_list["battery"].researched = true
  technology_list["plastics"].researched = true
  technology_list["fluid-wagon"].enabled = true
  technology_list["stack-inserter"].enabled = true


  --blocked tech
  technology_list["automation-3"].enabled = false
  technology_list["automobilism"].enabled = false -- only from start
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
  technology_list["stronger-explosives-2"].enabled = false
  technology_list["stronger-explosives-3"].enabled = false
  technology_list["physical-projectile-damage-1"].enabled = true
  technology_list["physical-projectile-damage-2"].enabled = true
  technology_list["physical-projectile-damage-3"].enabled = true
  technology_list["physical-projectile-damage-4"].enabled = true
  technology_list["physical-projectile-damage-5"].enabled = false
  technology_list["refined-flammables-1"].enabled = true
  technology_list["refined-flammables-2"].enabled = true
  technology_list["refined-flammables-3"].enabled = false
  technology_list["research-speed-1"].enabled = true
  technology_list["research-speed-2"].enabled = true
  technology_list["research-speed-3"].enabled = true
  technology_list["research-speed-4"].enabled = false
  technology_list["mining-productivity-1"].enabled = true
  technology_list["mining-productivity-2"].enabled = false
  technology_list["weapon-shooting-speed-1"].enabled = true
  technology_list["weapon-shooting-speed-2"].enabled = true
  technology_list["weapon-shooting-speed-3"].enabled = true
  technology_list["weapon-shooting-speed-4"].enabled = false
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
	  global.radar = game.surfaces[1].find_entities_filtered{name = "crash-site-spaceship-wreck-small-3", limit = 1}[1]
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
                  zoom = 4 
				},
			  },
              start_position = global.radar.position,
              start_zoom = 4
            }
        end
        -- game.play_sound({path = "utility/game_won"})
      end
    }, 
	{
      init = function()
        global.radar = game.surfaces[1].find_entities_filtered{name = "crash-site-spaceship-wreck-medium-1", limit = 1}[1]
		global.radar2 = game.surfaces[1].find_entities_filtered{name = "crash-site-spaceship", limit = 1}[1]
        if global.radar and global.radar2 then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
				{
                  target = global.radar2,
                  transition_time = 200,
                  time_to_wait = 200,
                  zoom = 3
                },
				{
                  target = player.character,
                  transition_time = 100,
                  time_to_wait = 0,
                  zoom = 1
                },
              },
              start_position = global.radar.position,
              start_zoom = 4
            }
          end
        end
      end,
      condition = story_elapsed_check(0),
      action =
      function()
		--story_show_message_dialog{text={"description"}, point_to={type="position", position={x=-10,y=10}}}
		--story_show_message_dialog{text={"description"}, image = "planet1.png", point_to={type="position", position={x=3,y=15}}}
      end
	  
    },
	{  
      action = function()
      local character = game.players[1]
        character.insert{name = "iron-gear-wheel", count = 47}
        character.insert{name = "pistol", count = 1}
        character.insert{name = "firearm-magazine", count = 1}
        character.insert{name = "electronic-circuit", count = 90}
		character.insert{name = "copper-cable", count = 38}
		set_info()
      end
    },
	{
      action =
      function()
      local character = game.players[1]
        if game.difficulty == defines.difficulty.easy then
		  character.insert{name = "firearm-magazine", count = 30}
		elseif game.difficulty == defines.difficulty.normal then  
		    game.forces.enemy.evolution_factor = .15
		elseif game.difficulty == defines.difficulty.hard then  
		    game.forces.enemy.evolution_factor = .50
        end
      end
    },
    {
      condition = story_elapsed_check(2),
      action =
      function()
         think("fall-ship")
      end
    },
    {
      init = function()
		game.play_sound({path = "fall-ship"})
      end
    },
	{
      condition = story_elapsed_check(4),
      action =
      function()
         think("ship-members")

      end
    },
	-----------------------------------
	-- /// OUTER BASE & OIL TASK /// --
	-----------------------------------
    {
      condition = story_elapsed_check(4),
      action =
      function()
        game.show_message_dialog{text = {"msg-base-1"}}
        game.show_message_dialog{text = {"msg-base-2"}}
        game.show_message_dialog{text = {"msg-base-3"}}
      end
    },
    {
      condition = story_elapsed_check(3),
      action =
      function()
	    set_goal({"goal-base"})
        think("find-base")
      end
    },
	{
      condition = function(event) 
	  local cardead = game.surfaces[1].find_entities_filtered{name = "car", limit = 1}[1]
        if not cardead then game.set_game_state({game_finished=true, player_won=false, can_continue=false}) end 
		return game.players[1].vehicle ~= nil and game.players[1].vehicle.energy == 0 end,
      action =
      function()
        set_goal("")
      end
    },
    {
      action =
      function()
        game.show_message_dialog{text = {"msg-base-4"}}
        game.show_message_dialog{text = {"msg-base-5"}}
        game.show_message_dialog{text = {"msg-base-6"}}
		for index, entity in pairs(global.intro_entities2) do
          entity.minable = true
        end
      end
    },
	{
	  condition = story_elapsed_check(0.5),
	  action =
      function()
	    game.players[1].force.technologies["automobilism"].enabled = true
      end
    },
	{
      init = function()
		game.players[1].character.destructible = false
      end
    },
    {
      init = function()
        global.radar3 = game.surfaces[1].find_entities_filtered{name = "1x2-remnants", limit = 1}[1]
        if global.radar then
          for k, player in pairs (game.players) do
            player.set_controller
            {
              type = defines.controllers.cutscene,
              waypoints =
              {
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
            }
          end
        end
      end,
	  condition = story_elapsed_check(3),
    },
	{
      action =
      function()
		think("assist")
      end
	}, 
	{
      init = function()
		game.players[1].character.destructible = true
      end
    },
    {
      condition = story_elapsed_check(5),
      action =
      function()
		think("assist2")
      end
	}, 
	{
      condition = story_elapsed_check(2),

	}, 
	{
      init = function()
        set_goal({"goal-restore-oil",0,3})
        global.pumpjacks = 0
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and event.entity.name == 'pumpjack' then
          global.pumpjacks = global.pumpjacks - 1
          set_goal({"goal-restore-oil",global.pumpjacks,3},true)
        elseif event.name == defines.events.on_built_entity and event.created_entity.name == 'pumpjack' then
          global.pumpjacks = global.pumpjacks + 1
          set_goal({"goal-restore-oil",global.pumpjacks,3})
        elseif event.name == defines.events.on_player_mined_entity and event.entity.name =='pumpjack' then
          global.pumpjacks = global.pumpjacks - 1
          set_goal({"goal-restore-oil",global.pumpjacks,3},true)
        end
      end,
      condition = function(event)
        return global.pumpjacks >= 3
      end
    },
	{
      action = function()
          set_goal({"goal-connect-oil"})
      end
    },
    {
      condition = function() return
        global.storage_tank.fluidbox[1] and
        global.storage_tank.fluidbox[1].amount > 0 end,
      action = function()
          set_goal("")
      end
    },
	-------------------------------
	-- /// MILLITARY RESEARCH /// --
	-------------------------------
	{
      condition = story_elapsed_check(2),
      action =
      function()
	    set_goal("")
        game.show_message_dialog{text = {"msg-base-7"}}
		game.show_message_dialog{text = {"msg-base-8"}}
		game.show_message_dialog{text = {"msg-base-9"}}
		for index, entity in pairs(global.intro_entities) do
          entity.minable = true
          entity.destructible = true
        end
      end
    },
	{
      condition = story_elapsed_check(1),
      action =
      function()
        set_goal({"goal-ressearch-military"})
      end
	}, 
	{
      condition = story_elapsed_check(3),
      action =
      function()
		think("base")
      end
    },
	{
	  condition = story_elapsed_check(4),
      action =
      function(event)
		think("base2")
        if event.name == defines.events.on_built_entity and event.created_entity.name == "military" then
          event.created_entity.energy = 1 
        end
      end
    },
	{
	  condition = story_elapsed_check(3),
	  condition = function() return game.players[1].force.technologies["military"].researched end,
      action =
      function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-10"}}
		game.show_message_dialog{text = {"msg-base-11"}}
      end
    },
	---------------------------
	-- /// KILL SPAWNERS /// --
	---------------------------
	{
      condition = story_elapsed_check(2),
      action = function()
	    set_goal({"goal-destroy-spawners",0,5})
        global.units_killed = 0
      end
    },
	{
	  condition = story_elapsed_check(4),
      action =
      function()
		think("car")
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
           event.entity.name == "biter-spawner" or
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "spitter-spawner" then
          global.units_killed = global.units_killed + 1
		  set_goal({"goal-destroy-spawners",global.units_killed,5})
        end
      end,
      condition = function() return global.units_killed >= 5 end,
      action = function()
        set_goal("")
      end
    },
	-------------------------------
	-- /// MORE GRENADES TASK /// --
	-------------------------------
	{
	  condition = story_elapsed_check(3),
      action =
      function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-12"}}
      end
    },
	{
      update = (function()
        local only_update = false
        return function(event)
          local grenade = game.players[1].character.get_item_count("grenade")
          set_goal
          (
            {
              "goal-grenades",
              grenade,
              20
            },
            only_update
          )
          only_update = true
        end
      end)(),
      condition = function()
        return 
               game.players[1].character.get_item_count("grenade") >= 20
      end,
      action = function()
	    think("grenade")
        set_goal("")
      end
    },
	-------------------------------
	-- /// BUILD CHEMICAL PLANT /// --
	-------------------------------
	{
	  condition = story_elapsed_check(4),
      action =
      function()
	  	local recipe_list = game.players[1].force.recipes
	    recipe_list["chemical-plant"].enabled = true
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-12.1"}}
		game.show_message_dialog{text = {"msg-base-12.2"}}
		
      end
    },
	{
	  condition = story_elapsed_check(2),
    },
	{
      init = function()
        set_goal({"goal-chemical",0,1})
        global.chems = 0
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and event.entity.name == 'chemical-plant' then
          global.chems = global.chems - 1
          set_goal({"goal-chemical",global.chems,1},true)
        elseif event.name == defines.events.on_built_entity and event.created_entity.name == 'chemical-plant' then
          global.chems = global.chems + 1
          set_goal({"goal-chemical",global.chems,1})
        -- elseif event.name == defines.events.on_player_mined_entity and event.entity.name =='chemical-plant' then
          -- global.chems = global.chems - 1
          -- set_goal({"goal-chemical",global.chems,1},true)
        end
      end,
      condition = function(event)
        return global.chems >= 1
      end
    },
	{
      action =
      function()
	    set_goal("")
      end
    },
	-------------------------------------
	-- /// COPPER AND RAILWAY TASK /// --
	-------------------------------------
	{
	  condition = story_elapsed_check(4),
      action =
      function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-13"}}
		game.show_message_dialog{text = {"msg-base-14"}}
		game.show_message_dialog{text = {"msg-base-15"}}
      end
    },
	{
	  condition = story_elapsed_check(2),
      action =
      function()
		think("weapon")
      end
    },
	{
	  condition = story_elapsed_check(3),
	  action =
      function()
	    game.players[1].force.technologies["automated-rail-transportation"].enabled = true
      end
    },
	{
      init = function()
        set_goal({"goal-train-station",0,2})
        global.stations = 0
      end,
      update = function(event)
        if event.name == defines.events.on_entity_died and event.entity.name == 'train-stop' then
          global.stations = global.stations - 1
          set_goal({"goal-train-station",global.stations,2},true)
        elseif event.name == defines.events.on_built_entity and event.created_entity.name == 'train-stop' then
          global.stations = global.stations + 1
          set_goal({"goal-train-station",global.stations,2})
        elseif event.name == defines.events.on_player_mined_entity and event.entity.name =='train-stop' then
          global.stations = global.stations - 1
          set_goal({"goal-train-station",global.stations,2},true)
        end
      end,
      condition = function(event)
        return global.stations >= 2
      end
    },
	---------------------------
	-- /// RESEARCH TANK /// --
	---------------------------
	{
      action =
      function()
	    game.players[1].force.technologies["tank"].enabled = true
      end
    },
	{
	  condition = story_elapsed_check(1),
      action =
      function()
        set_goal("")
		think("done")
      end
    },
	{
	  condition = story_elapsed_check(3),
      action =
      function(event)
        set_goal({"goal-ressearch-tank"})
		
        if event.name == defines.events.on_built_entity and event.created_entity.name == "tank" then
          event.created_entity.energy = 1 
        end
      end
    },
    {	
     condition = story_elapsed_check(3),
	 condition = function() return game.players[1].force.technologies["tank"].researched end,
      action =
      function()
        set_goal({"goal-build-tank"})
    	game.show_message_dialog{text = {"msg-base-16"}}
      end
    },
    {
	  condition = story_elapsed_check(1),
      condition = function() return game.players[1].get_item_count("tank") > 0 end,
      action =
      function()
        set_goal({"goal-construct-tank"})
      end
    },
	{
      condition =
      function(event)
        return (event.name == defines.events.on_built_entity and event.created_entity.name == "tank")
          or game.players[1].force.get_entity_count("tank") > 0
      end
    },
	{
      condition = story_elapsed_check(1),
      action =
      function()
	    set_goal("")
        think("tank")
      end
    },
	-------------------------------
	-- /// ROADKILL SPAWNERS /// --
	-------------------------------
	{
	  condition = story_elapsed_check(4),
      action =
      function()
		game.show_message_dialog{text = {"msg-base-17"}}
      end
    },
	{
      condition = story_elapsed_check(1),
      action = function()
	    set_goal({"goal-destroy-spawners2",0,10})
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
           event.entity.name == "biter-spawner" or
		   event.name == defines.events.on_entity_died and
		   event.entity.name == "spitter-spawner" then
          global.units_killed = global.units_killed + 1
		  set_goal({"goal-destroy-spawners2",global.units_killed,10})
        end
      end,
      condition = function() return global.units_killed >= 10 end,
      action = function()
        set_goal("")
      end
    },
	{
	  condition = story_elapsed_check(4),
      action =
      function()
		game.show_message_dialog{text = {"msg-base-18"}}
      end
    },
	{
      action =
      function()
        if game.difficulty == defines.difficulty.easy then
			game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-02")}) -- YOU WIN THE GAME
		elseif game.difficulty == defines.difficulty.normal then  
			game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-02")}) -- YOU WIN THE GAME
		elseif game.difficulty == defines.difficulty.hard then  
		    game.set_game_state({game_finished=true, player_won=true, can_continue=false, next_level=("level-02")}) -- YOU WIN THE GAME
        end
      end
    },	
  }
}

story_init_helpers(story_table)


local init = function()
  global.story = story_init()

  game.map_settings.enemy_expansion.enabled = false
  game.forces.enemy.evolution_factor = 0
  game.map_settings.enemy_evolution.enabled = false
  --game.disable_tips_and_tricks()
  -- game.players[1].force.disable_all_prototypes()
end


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

-- I must delete this 
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
script.on_event(defines.events.on_player_created, on_player_created)
script.on_event(defines.events.on_unit_group_finished_gathering, on_unit_group_finished_gathering)
script.on_event(defines.events.on_gui_click, intro_screen.on_gui_click)
script.on_init(on_configuration_changed)
script.on_configuration_changed(on_configuration_changed)



