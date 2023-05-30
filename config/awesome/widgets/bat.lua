local vicious = require("vicious")
local beautiful = require("beautiful")
local wibox = require("wibox")

bat0 = wibox.widget.textbox()
bat1 = wibox.widget.textbox()

-- Create wibox with batwidget
batbox = wibox.layout.margin(
    wibox.widget { {
        max_value = 1,
        widget = wibox.widget.textbox(),
        border_width = 0.5,
        border_color = "#000000",
    },
        forced_height = 10, forced_width = 8,
        direction = 'east', color = beautiful.fg_widget,
        layout = wibox.container.rotate },
    1, 1, 3, 3)

-- Register battery widget
vicious.register(bat0, vicious.widgets.bat, "BAT0 $2%", 61, "BAT0")
--vicious.register(bat1, vicious.widgets.bat, "BAT1 $2%", 61, "BAT1")

return bat0, bat1

-- https://vicious.readthedocs.io/en/latest/custom.html
