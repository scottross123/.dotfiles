local awful = require("awful")
local set_wallpaper = require("set_wallpaper")
local gears = require("gears")
local wibox = require("wibox")
local tasklist = require("bar.tasklist")
local taglist_buttons = require("bar.taglist_buttons")

-- widgets
-- local bat0, bat1 = require("widgets.bat")
local mem = require("bar.widgets.mem")
local cpu = require("bar.widgets.cpu")
local vol = require("bar.widgets.vol")

awful.screen.connect_for_each_screen(function(s)
    set_wallpaper(s)

    local names = { "1", "2", "3", "4", "5", "6", }
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
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    local mytasklist = tasklist.init(s)

    -- Create the wibox
    s.wb = awful.wibar({
        position = "top",
        screen = s,
        type = "desktop",
        height = 20,
        -- bg = beautiful.bg_normal .. "55"
    })

    -- Add widgets to the wibox
    s.wb:setup {
        layout = wibox.layout.align.horizontal,
        {
            -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            spacing = 10,
            mylauncher,
            s.mytaglist,
            -- s.mypromptbox,
        },
        mytasklist,
        -- mytasklist, -- Middle widget
        -- wibox.container.place([
        {
            -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            -- mykeyboardlayout,
            wibox.widget.systray(),
            spacing = 10,
            mem,
            cpu,
            -- bat1,
            -- bat0,
            --vol,
            -- hddtempwidget,
            -- volume_widget(),
            -- s.mylayoutbox,
            mytextclock,
        },
    }
end)


