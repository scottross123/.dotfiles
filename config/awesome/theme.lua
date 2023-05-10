local beautiful = require("beautiful")
local gears = require("gears")

local theme_dir = "/home/scott/.config/awesome/themes"
local wallpaper_dir ="/home/scott/.config/awesome/wallpapers"

beautiful.init(theme_dir .. "/powerarrow-darker/theme.lua")
--powerarrow-darkerbeautiful.wallpaper = wallpaper_dir .. "/deb.webp"
beautiful.useless_gap = 4
gears.wallpaper.set("#0a0a0a")
