local vicious = require("vicious")
local beautiful = require("beautiful")
local wibox = require("wibox")

local bat = wibox.widget.textbox()

-- Register battery widget
-- vicious.register(bat1, vicious.widgets.bat, "BAT1 $2%", 61, "BAT1")
-- idk why the fuck the second battery widget doesnt work
--  TODO figure this out later
vicious.register(bat, vicious.widgets.bat, "bat $2%", 61, "BAT0")

return bat

-- https://vicious.readthedocs.io/en/latest/custom.html
