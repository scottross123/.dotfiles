local beautiful = require("beautiful")
local gears = require("gears")

local wallpaper_dir ="/home/scott/.config/awesome/wallpapers"

local theme = {}

-- ibm dev color palette
local blue60 = "#0F62FE"
local black100 = "#000000"
local white0 = "#FFFFFF"
local cyan10 = "#E5F6FF"
local coolgray10 = "#F2F4F8"
local coolgray30 = "#C1C7CD"
local coolgray100 ="#121619"
local cyan30 = "#82CFFF"
local purple40 = "#BE95FF"
local magenta40 = "#FF7EB6"
local teal30 = "#3DDBD9"

local alert60 = "#DA1E28"
local alert50 = "#24A148"
local alert40 = "#FF832B"
local alert30 = "#F1C21B"

theme.tasklist_disable_task_name = false
theme.tasklist_disable_icon = true

theme.font = "BlexMonoMedm Nerd Font"

theme.useless_gap = 4
-- theme.font                          = "IBM Plex Mono"
theme.fg_normal                     = white0
theme.fg_focus                      = "#F0DFAF"
theme.fg_urgent                     = "#CC9393"
theme.bg_normal                     = black100
theme.bg_focus                      = "#313131"
theme.bg_urgent                     = "#1A1A1A"
theme.border_width                  = "1"
theme.border_normal                 = "#3F3F3F"

theme.wibar_bg = black100 .. "FF"

theme.border_focus                  = purple40
theme.border_marked                 = "#CC9393"

-- i dont use titlebars
-- theme.titlebar_bg_focus             = "#FFFFFF"
-- theme.titlebar_bg_normal            = "#FFFFFF"
--
theme.taglist_fg_focus              = magenta40
theme.taglist_bg_focus             = coolgray100
theme.tasklist_fg_focus             = magenta40
theme.tasklist_bg_focus             = coolgray100



theme.textbox_widget_margin_top     = 1
theme.notify_fg                     = theme.fg_normal
theme.notify_bg                     = theme.bg_normal
theme.notify_border                 = theme.border_focus
theme.awful_widget_height           = 14
theme.awful_widget_margin_top       = 2
theme.mouse_finder_color            = "#CC9393"
theme.menu_height                   = "16"
theme.menu_width                    = "140"

beautiful.init(theme)

gears.wallpaper.maximized(wallpaper_dir .. "/wallpaper.jpg", s)

