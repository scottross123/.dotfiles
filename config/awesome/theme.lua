local beautiful = require("beautiful")
local gears = require("gears")

local theme_dir = "/home/scott/.config/awesome/themes"
local wallpaper_dir ="/home/scott/.config/awesome/wallpapers"

beautiful.init(theme_dir .. "/powerarrow-darker/theme.lua")

gears.wallpaper.maximized(wallpaper_dir .. "/wallpaper.jpg", s)
beautiful.font = "BlexMonoMedm Nerd Font"
beautiful.useless_gap = 4
