local beautiful = require("beautiful")
local gears = require("gears")

local theme = {}

theme.tasklist_disable_task_name = false
theme.tasklist_disable_icon = true

theme.font = "BlexMonoMedm Nerd Font"

local background = "#282a36"
local current_line = "#44475a"
local foreground = "#f8f8f2"
local comment = "#6272a4"
local cyan = "#8be9fd"
local green = "#50fa7b"
local orange = "#ffb86c"
local pink = "#ff79c6"
local purple = "#bd93f9"
local red = "#ff5555"
local yellow = "#f1fa8c"

-- theme.useless_gap = 4
-- theme.font                          = "IBM Plex Mono"
theme.fg_normal                     = foreground
theme.fg_focus                      = foreground
theme.fg_urgent                     = red
theme.bg_normal                     = background
theme.bg_focus                      = current_line
theme.bg_urgent                     = background
theme.border_width                  = "1"
theme.border_normal                 = current_line

theme.wibar_bg = background

theme.border_focus                  = comment
theme.border_marked                 = cyan

-- i dont use titlebars
-- theme.titlebar_bg_focus             = "#FFFFFF"
-- theme.titlebar_bg_normal            = "#FFFFFF"
--[[
theme.taglist_fg_focus              = 
theme.taglist_bg_focus             = coolgray100
theme.tasklist_fg_focus             = magenta40
theme.tasklist_bg_focus             = coolgray100
]]--

theme.textbox_widget_margin_top     = 1
theme.notify_fg                     = theme.fg_normal
theme.notify_bg                     = theme.bg_normal
theme.notify_border                 = theme.border_focus
theme.awful_widget_height           = 14
theme.awful_widget_margin_top       = 2
theme.mouse_finder_color            = current_line
theme.menu_height                   = "16"
theme.menu_width                    = "140"

-- TODO fix this
local icons_dir = "/home/scott/.dotfiles/config/awesome"

theme.layout_tile                   = icons_dir .. "/icons/layouts/tile.png"
theme.layout_tilegaps               = icons_dir .. "/icons/layouts/tilegaps.png"
theme.layout_tileleft               = icons_dir .. "/icons/layouts/tileleft.png"
theme.layout_tilebottom             = icons_dir .. "/icons/layouts/tilebottom.png"
theme.layout_tiletop                = icons_dir .. "/icons/layouts/tiletop.png"
theme.layout_fairv                  = icons_dir .. "/icons/layouts/fairv.png"
theme.layout_fairh                  = icons_dir .. "/icons/layouts/fairh.png"
theme.layout_spiral                 = icons_dir .. "/icons/layouts/spiral.png"
theme.layout_dwindle                = icons_dir .. "/icons/layouts/dwindle.png"
theme.layout_max                    = icons_dir .. "/icons/layouts/max.png"
theme.layout_fullscreen             = icons_dir .. "/icons/layouts/fullscreen.png"
theme.layout_magnifier              = icons_dir .. "/icons/layouts/magnifier.png"
theme.layout_floating               = icons_dir .. "/icons/layouts/floating.png"

return theme
