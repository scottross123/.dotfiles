local beautiful = require("beautiful")
local gears = require("gears")

local dracula = require("themes.dracula.theme")

local wallpaper_dir ="/home/scott/.config/awesome/wallpapers"

beautiful.init(dracula)

gears.wallpaper.maximized(wallpaper_dir .. "/dagobah.jpeg", s)
