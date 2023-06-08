local vicious = require("vicious")
local wibox = require("wibox")

local date = wibox.widget.textbox()
vicious.register(date, vicious.widgets.date, "%R")

return date
