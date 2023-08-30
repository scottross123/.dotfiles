local wibox = require("wibox")
local vicious = require("vicious")

cpu = wibox.widget.textbox()
vicious.register(cpu, vicious.widgets.cpu, "cpu $1%", 3)

return cpu

