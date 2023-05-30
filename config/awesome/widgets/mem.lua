local wibox = require("wibox")
local vicious = require("vicious")

mem = wibox.widget.textbox()
vicious.cache(vicious.widgets.mem)
vicious.register(mem, vicious.widgets.mem, "MEM $1%", 13)

return mem
