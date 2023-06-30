local awful = require("awful")
local set_wallpaper = require("set_wallpaper")
local gears = require("gears")
local wibox = require("wibox")
local tasklist = require("bar.tasklist")
local taglist = require("bar.taglist")

-- widgets
local bat0, bat1 = require("bar.widgets.bat")
local mem = require("bar.widgets.mem")
local cpu = require("bar.widgets.cpu")
local vol = require("bar.widgets.vol")
local date = require("bar.widgets.date")

awful.screen.connect_for_each_screen(function(s)
    set_wallpaper(s)

    -- local names = { "term", "web", "office", "mail", "music", "games", "*" }
    local names = { "1", "2", "3", "4", "5", "6", "7" }
    local l = awful.layout.suit
    local layouts = { l.tile, l.tile, l.tile, l.tile, l.floating, l.floating, l.floating }
    awful.tag(names, s, layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({}, 1, function() awful.layout.inc(1) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end),
        awful.button({}, 4, function() awful.layout.inc(1) end),
        awful.button({}, 5, function() awful.layout.inc(-1) end)))

    local mytaglist = taglist.init(s)
    local mytasklist = tasklist.init(s)

    -- Create the wibox
    s.wb = awful.wibar({
        position = "top",
        screen = s,
        type = "desktop",
        height = 20,
        -- opacity = .8
    })

    -- Add widgets to the wibox
    s.wb:setup {
        layout = wibox.layout.align.horizontal,
        {
            -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            spacing = 10,
            mylauncher,
            mytaglist,
            -- s.mypromptbox,
        },
        mytasklist,
        {
            -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            -- mykeyboardlayout,
            wibox.widget.systray(),
            spacing = 10,
            mem,
            cpu,
            bat1,
            bat0,
            -- vol,
            -- hddtempwidget,
            -- s.mylayoutbox,
            date,
        },
    }
end)


