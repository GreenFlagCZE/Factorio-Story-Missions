local final = {}

final.create = function(player)
  local frame = player.gui.screen.add
  {
    type = "frame",
    direction = "vertical",
    name = "final",
    caption = { "intro-screen.header" }
  }
  --frame.style.width = 420
  frame.auto_center = true

  local inner = frame.add{type = "flow", direction = "horizontal"}
  local picture_frame = inner.add{type = "frame", style = "inside_deep_frame"}
  local sprite = picture_frame.add{type = "sprite", sprite = "file/planet7.png"}
  --sprite.style.width = 874/2
  --sprite.style.height = 1240/2

  local text_frame = inner.add{type = "frame", style = "inside_deep_frame"}
  text_frame.style.padding = 8

  local scroller = text_frame.add
  {
    type = "scroll-pane",
    direction = "vertical",
    style = "scroll_pane_under_subheader"
  }

  scroller.style.maximal_width = 1074/2

  local caption = {"intro-screen.intro"}

  local text = scroller.add
  {
    type="label",
    caption = caption
  }
  text.style.single_line = false

  local pusher = scroller.add{type = "empty-widget"}
  pusher.style.vertically_stretchable = true

  local text = scroller.add
  {
    type="label",
    caption = {"","\n",{"intro-screen.param"},"\n"}
  }
  text.style.single_line = false

  local button_flow = frame.add{type = "flow"}
  button_flow.style.horizontally_stretchable = true
  button_flow.style.vertical_align = "center"

  --add button 1 here
  --button_flow.add({
  --  type = "button",
  --  name = "end_button",
  --  style = "red_back_button",
  --  caption = {"intro-screen.end"}
  --})

  local pusher = button_flow.add{type = "empty-widget", style = "draggable_space_with_no_left_margin"}
  pusher.drag_target = frame
  pusher.style.horizontally_stretchable = true
  pusher.style.vertically_stretchable = true
  --pusher.drag_target = frame

  --add button 2 here
  button_flow.add
  {
    type = "button",
    name = "continue_button",
    style = "confirm_button",
    caption = {"intro-screen.continue"}
  }

end

final.on_gui_click = function(event)
  local gui = event.element
  if not (gui and gui.valid) then return end

  if gui.name ~= "continue_button" then
    return
  end

  local frame = game.get_player(event.player_index).gui.screen.final
  if frame then frame.destroy() end
  game.tick_paused = false
end

return final
