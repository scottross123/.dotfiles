local awful = require("awful")
local wibox = require("wibox")
local tasklist_buttons = require("tasklist_buttons")

local tasklist = {
    init = function(s)
        local buttons = tasklist_buttons

        local widget = awful.widget.tasklist {
            screen          = s,
            filter          = awful.widget.tasklist.filter.currenttags,
            buttons         = buttons,
        }

        return wibox.widget {
            widget,
            widget = wibox.container.background
        }
    end
}

return tasklist
