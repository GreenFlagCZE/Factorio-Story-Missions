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
	if  event.name == defines.events.on_player_died then
		game.set_game_state({game_finished=true, player_won=false, can_continue=false})
	end
  end



local on_player_created = function(event)

  local player = game.players[1]

  player.force.enable_research()
  --game.forces.player.disable_all_prototypes()
  game.forces.player.reset_technology_effects()
  game.forces.player.reset()
  game.forces.player.research_queue_enabled = true

  game.map_settings.enemy_expansion.enabled = true
  game.map_settings.enemy_evolution.enabled = true
  game.forces.enemy.evolution_factor = .10
  
  
  

  
  local technology_list = game.forces.player.technologies  


  local recipe_list = player.force.recipes
  game.players[1].clear_recipe_notifications()
  

end

local story_table =
{
  {
	{
      init = function()
	  global.radar = game.surfaces[1].find_entities_filtered{name = "car-remnants", limit = 1}[1]
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
        if global.radar then
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
        character.insert{name = "iron-plate", count = 50}
        character.insert{name = "wood", count = 20}
        character.insert{name = "copper-plate", count = 20}
        character.insert{name = "boiler", count = 1}
		set_info()
      end
    },
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-2"}}
		game.show_message_dialog{text = {"msg-base-3"}}
		game.show_message_dialog{text = {"msg-base-4"}}
		game.show_message_dialog{text = {"msg-base-5"}}
		game.show_message_dialog{text = {"msg-base-6"}}
		game.show_message_dialog{text = {"msg-base-7"}}
      end
    },
	{
      condition = story_elapsed_check(2),
    },
	{
      action = function()
	    set_goal("")
		game.show_message_dialog{text = {"msg-base-1"}}
      end
    },
	{
      condition = story_elapsed_check(2),
    },
	{
      condition = story_elapsed_check(1),
      action =
      function()
		think("msg1")
      end
    },
	{
      condition = story_elapsed_check(2),
    },
	{
      init = function()
        set_goal({"goal-listen",0,1})
        global.silos = 0
      end,
      update = function(event)
        if event.name == defines.events.on_built_entity and event.created_entity.name == 'rocket-silo' then
          global.silos = global.silos + 1
          set_goal({"goal-listen",global.silos,1})
        end
      end,
      condition = function(event)
        return global.silos >= 1
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