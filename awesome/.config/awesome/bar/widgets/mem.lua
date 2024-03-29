local wibox = require("wibox")
local vicious = require("vicious")

local mem = wibox.widget.textbox()
vicious.cache(vicious.widgets.mem)
vicious.register(mem, vicious.widgets.mem, "mem $1%", 13)

return mem
