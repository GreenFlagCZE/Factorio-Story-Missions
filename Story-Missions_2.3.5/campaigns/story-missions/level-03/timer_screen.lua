local final = {}

final.create_timer = function(player, duration, callback)
  local elapsed_ticks = 0
  local timer_seconds = 0
  local timer_gui = game.players[1].gui.top.add{
    type = "label",
    name = "timer_label",
    caption = "Timer: 0s",
  }  -- create the timer label in the player's GUI

  local function tick(self, event)
    if self.running then
      elapsed_ticks = elapsed_ticks + 1
      if elapsed_ticks % 60 == 0 then
        timer_seconds = timer_seconds + 1
        if timer_gui and timer_gui.valid then  -- check if the timer GUI exists and is valid
          timer_gui.caption = "Timer: " .. timer_seconds .. "s"
        end
      end
      if elapsed_ticks >= self.duration then
        self:stop()
        if self.callback then
          self.callback()
        end
      end
    end
  end

  local timer = {
    duration = duration,
    callback = callback,
    running = false,
    elapsed_ticks = 0,
    start = function(self)
      if not self.running then
        script.on_event(defines.events.on_tick, tick, self)
        self.running = true
      end
    end,
    stop = function(self)
      if self.running then
        script.on_event(defines.events.on_tick, nil)
        if timer_gui and timer_gui.valid then  -- check if the timer GUI exists and is valid
          timer_gui.destroy()
        end
        self.running = false
      end
    end,
  }

  return timer
end

return final