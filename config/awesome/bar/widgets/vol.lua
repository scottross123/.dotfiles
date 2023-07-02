local wibox = require("wibox")
local vicious = require("vicious")

local vol = wibox.widget.textbox()
vicious.register(vol, vicious.widgets.volume, "vol $1%", .5, "Master")

return vol
