local wibox = require("wibox")
local vicious = require("vicious")

vol = wibox.widget.textbox()
vicious.register(vol, vicious.widgets.volume, "VOL $1%", 2)

return vol
