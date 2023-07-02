local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")

local wibox = require("wibox")

local terminal = "kitty"
local modkey = "Mod4"

local keys = {
    -- screenshots
    globalkeys = gears.table.join(

    -- hide wibar
        awful.key({ modkey }, "b",
            function()
                local screen = awful.screen.focused()
                screen.wb.visible = not screen.wb.visible
            end,
            { description = "toggle statusbar" }
        ),

        awful.key({}, "Print", function() awful.util.spawn("scrot -s") end),
        awful.key({ modkey }, "Print", function() awful.util.spawn("scrot") end),

        -- media controls
        -- uses numpad arrow keys
        awful.key({ "Mod1" }, "KP_Up", function()
            awful.util.spawn("playerctl play", false)
        end),
        awful.key({ "Mod1" }, "KP_Down", function()
            awful.util.spawn("playerctl pause", false)
        end),
        awful.key({ "Mod1" }, "KP_Right", function()
            awful.util.spawn("playerctl next", false)
        end),
        awful.key({ "Mod1" }, "KP_Left", function()
            awful.util.spawn("playerctl previous", false)
        end),


        -- keyboard volume, control, brightness control, etc
        awful.key({}, "XF86AudioRaiseVolume", function()
            --volume_widget:inc(5)
            awful.spawn.with_shell("amixer -q sset Master 5%+")
        end),
        awful.key({}, "XF86AudioLowerVolume", function()
            --volume_widget:dec(5)
            awful.spawn.with_shell("amixer -q sset Master 5%-")
        end),
        awful.key({}, "XF86AudioMute", function()
            --volume_widget:toggle()
            awful.spawn.with_shell("amixer -q sset Master toggle")
        end),

        awful.key({}, "XF86MonBrightnessUp", function()
            --brightness_widget:inc()
            awful.spawn.with_shell("brightnessctl set 10%+")
        end),

        awful.key({}, "XF86MonBrightnessDown", function()
            --brightness_widget:dec()
            awful.spawn.with_shell("brightnessctl set 10%-")
        end),

        awful.key({ modkey, }, "s", hotkeys_popup.show_help,
            { description = "show help", group = "awesome" }),
        awful.key({ modkey, }, "Left", awful.tag.viewprev,
            { description = "view previous", group = "tag" }),
        awful.key({ modkey, }, "Right", awful.tag.viewnext,
            { description = "view next", group = "tag" }),
        awful.key({ modkey, }, "Escape", awful.tag.history.restore,
            { description = "go back", group = "tag" }),

        awful.key({ modkey, }, "j",
            function()
                awful.client.focus.byidx(1)
            end,
            { description = "focus next by index", group = "client" }
        ),
        awful.key({ modkey, }, "k",
            function()
                awful.client.focus.byidx(-1)
            end,
            { description = "focus previous by index", group = "client" }
        ),

        awful.key({ modkey, }, "w", function() mymainmenu:show() end,
            { description = "show main menu", group = "awesome" }),

        -- Layout manipulation
        awful.key({ modkey, "Shift" }, "j", function() awful.client.swap.byidx(1) end,
            { description = "swap with next client by index", group = "client" }),
        awful.key({ modkey, "Shift" }, "k", function() awful.client.swap.byidx(-1) end,
            { description = "swap with previous client by index", group = "client" }),
        awful.key({ modkey, "Control" }, "j", function() awful.screen.focus_relative(1) end,
            { description = "focus the next screen", group = "screen" }),
        awful.key({ modkey, "Control" }, "k", function() awful.screen.focus_relative(-1) end,
            { description = "focus the previous screen", group = "screen" }),
        awful.key({ modkey, }, "u", awful.client.urgent.jumpto,
            { description = "jump to urgent client", group = "client" }),
        awful.key({ modkey, }, "Tab",
            function()
                awful.client.focus.history.previous()
                if client.focus then
                    client.focus:raise()
                end
            end,
            { description = "go back", group = "client" }),

        -- Standard program
        awful.key({ modkey, }, "Return", function() awful.spawn(terminal) end,
            { description = "open a terminal", group = "launcher" }),
        awful.key({ modkey, "Control" }, "r", awesome.restart,
            { description = "reload awesome", group = "awesome" }),
        awful.key({ modkey, "Shift" }, "q", awesome.quit,
            { description = "quit awesome", group = "awesome" }),
        awful.key({ modkey, }, "l", function() awful.tag.incmwfact(0.05) end,
            { description = "increase master width factor", group = "layout" }),
        awful.key({ modkey, }, "h", function() awful.tag.incmwfact(-0.05) end,
            { description = "decrease master width factor", group = "layout" }),
        awful.key({ modkey, "Shift" }, "h", function() awful.tag.incnmaster(1, nil, true) end,
            { description = "increase the number of master clients", group = "layout" }),
        awful.key({ modkey, "Shift" }, "l", function() awful.tag.incnmaster(-1, nil, true) end,
            { description = "decrease the number of master clients", group = "layout" }),
        awful.key({ modkey, "Control" }, "h", function() awful.tag.incncol(1, nil, true) end,
            { description = "increase the number of columns", group = "layout" }),
        awful.key({ modkey, "Control" }, "l", function() awful.tag.incncol(-1, nil, true) end,
            { description = "decrease the number of columns", group = "layout" }),
            -- TODO figure out what to change this too
        awful.key({ modkey, "Mod1" }, "space", function() awful.layout.inc(1) end,
            { description = "select next", group = "layout" }),
        awful.key({ modkey, "Shift" }, "space", function() awful.layout.inc(-1) end,
            { description = "select previous", group = "layout" }),

        awful.key({ modkey, "Control" }, "n",
            function()
                local c = awful.client.restore()
                -- Focus restored client
                if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", { raise = true }
                    )
                end
            end,
            { description = "restore minimized", group = "client" }),

        -- rofi
        awful.key({ modkey, }, "r", function()
                awful.util.spawn('rofi -show run')
            end,
            { description = "run rofi", group = "launcher" }),
        awful.key({ modkey, }, "space", function()
                awful.util.spawn('rofi -show drun')
            end,
            { description = "run rofi", group = "launcher" }),


        awful.key({ modkey, "Shift" }, "s", function()
                awful.util.spawn('rofi -show ssh')
            end,
            { description = "run rofi ssh", group = "launcher" }),

        awful.key({ modkey, }, "e", function()
                awful.util.spawn('rofi -show window')
            end,
            { description = "run rofi window", group = "launcher" }),

        awful.key({ modkey }, "x",
            function()
                -- awful.placement.top(w, { margins = {top = 40}, parent = awful.screen.focused()})
                awful.popup {
                    widget       = {
                        {
                            {
                                text   = 'Execute lua code: ',
                                widget = wibox.widget.textbox
                            },
                            {
                                value         = 0.5,
                                forced_height = 30,
                                forced_width  = 100,
                                widget        = wibox.widget.progressbar
                            },
                            layout = wibox.layout.fixed.vertical,
                        },
                        margins = 10,
                        widget  = wibox.container.margin
                    },
                    border_width = 5,
                    placement    = awful.placement.centered,
                    shape        = gears.shape.rect,
                    ontop        = true,
                    visible      = true,
                }
                awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    -- TODO make this a popup
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                }
            end,
            { description = "lua execute prompt", group = "awesome" })
        -- Menubar
        -- no menubar
        --awful.key({ modkey }, "p", function() menubar.show() end,
             -- { description = "show the menubar", group = "launcher" })
    ),
    clientkeys = gears.table.join(
        awful.key({ modkey, }, "f",
            function(c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
            { description = "toggle fullscreen", group = "client" }),
        awful.key({ modkey, "Shift" }, "c", function(c) c:kill() end,
            { description = "close", group = "client" }),
        awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle,
            { description = "toggle floating", group = "client" }),
        awful.key({ modkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end,
            { description = "move to master", group = "client" }),
        awful.key({ modkey, }, "o", function(c) c:move_to_screen() end,
            { description = "move to screen", group = "client" }),
        awful.key({ modkey, }, "t", function(c) c.ontop = not c.ontop end,
            { description = "toggle keep on top", group = "client" }),
        awful.key({ modkey, }, "n",
            function(c)
                -- The client currently has the input focus, so it cannot be
                -- minimized, since minimized clients can't have the focus.
                c.minimized = true
            end,
            { description = "minimize", group = "client" }),
        awful.key({ modkey, }, "m",
            function(c)
                c.maximized = not c.maximized
                c:raise()
            end,
            { description = "(un)maximize", group = "client" }),
        awful.key({ modkey, "Control" }, "m",
            function(c)
                c.maximized_vertical = not c.maximized_vertical
                c:raise()
            end,
            { description = "(un)maximize vertically", group = "client" }),
        awful.key({ modkey, "Shift" }, "m",
            function(c)
                c.maximized_horizontal = not c.maximized_horizontal
                c:raise()
            end,
            { description = "(un)maximize horizontally", group = "client" })
    ),
    clientbuttons = gears.table.join(
        awful.button({}, 1, function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
        end),
        awful.button({ modkey }, 1, function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
            awful.mouse.client.move(c)
        end),
        awful.button({ modkey }, 3, function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
            awful.mouse.client.resize(c)
        end)
    ),
    mousebuttons = gears.table.join(
        awful.button({}, 3, function() mymainmenu:toggle() end),
        awful.button({}, 4, awful.tag.viewnext),
        awful.button({}, 5, awful.tag.viewprev)
    )
}

for i = 1, 9 do
    keys.globalkeys = gears.table.join(keys.globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            { description = "view tag #" .. i, group = "tag" }),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            { description = "toggle tag #" .. i, group = "tag" }),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            { description = "move focused client to tag #" .. i, group = "tag" }),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            { description = "toggle focused client on tag #" .. i, group = "tag" })
    )
end

root.keys(keys.globalkeys)
root.buttons(keys.mousebuttons)

return keys
