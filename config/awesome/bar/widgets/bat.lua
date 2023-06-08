local vicious = require("vicious")
local beautiful = require("beautiful")
local wibox = require("wibox")

bat0 = wibox.widget.textbox()

-- Create wibox with batwidget
batbox = wibox.layout.margin(
    wibox.widget { {
        max_value = 1,
        widget = wibox.widget.textbox(),
    },
        direction = 'east', color = beautiful.fg_widget,
        layout = wibox.container.rotate },
    1, 1, 3, 3)

-- Register battery widget
-- vicious.register(bat1, vicious.widgets.bat, "BAT1 $2%", 61, "BAT1")
-- idk why the fuck the second battery widget doesnt work
vicious.register(bat0, vicious.widgets.bat, "bat0 $2%", 61, "BAT1")

return bat0

-- https://vicious.readthedocs.io/en/latest/custom.html
