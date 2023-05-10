local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local tasklist = require("bar.tasklist")
local taglist = require("bar.taglist")

-- mykeyboardlayout = awful.widget.keyboardlayout()
-- {{{ Wibar
-- Create a textclock widget
-- mytextclock = wibox.widget.textclock()

-- streetturtle's awesome-wm widgets
local battery_widget = require("widgets.battery-widget.battery")
local volume_widget = require("widgets.volume-widget.volume")
-- bright doesn't work for some reason, idk. fix later or find different widget. or just don;t use it
--local brightness_widget = require("widgets.brightness-widget.brightness")
local net_speed_widget = require("widgets.net-speed-widget.net-speed")
local apt_widget = require("widgets.apt-widget.apt-widget")
local cpu_widget = require("widgets.cpu-widget.cpu-widget")
local ram_widget = require("widgets.ram-widget.ram-widget")
local weather_widget = require("widgets.weather-widget.weather")

awful.screen.connect_for_each_screen(function(s)
    local names = { "web", "term", "office", "music", "games", "misc" }
    local l = awful.layout.suit
    local layouts = { l.tile, l.tile, l.floating, l.tile.left, l.floating, l.floating }
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

    -- Create the wibox
    s.mywibox = awful.wibar({
        position = "top",
        screen = s,
        height = 24
    })

    local mytaglist = taglist.init(s)
    local mytasklist = tasklist.init(s)

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        {
            -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            -- mylauncher,
            mytaglist,
            s.mypromptbox,
        },
        mytasklist,
        {
            -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            -- mykeyboardlayout,
            wibox.widget.systray(),
            apt_widget(),
            net_speed_widget(),
            -- cpu_widget(),
            ram_widget(),
            volume_widget(),
            battery_widget(),
            -- mytextclock,
            -- TODO get this to work
            --[[
            weather_widget({
                api_key = OPENWEATHER_API_KEY,
                coordinates = COORDINATES
            }),
            ]] --
            -- s.mylayoutbox,
        },
    }
end)
