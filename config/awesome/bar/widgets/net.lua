local wibox = require("wibox")
local vicious = require("vicious")

-- enp0s31f6
-- wlp4s0

-- TODO grab network interfaces dynamically instaed of hardcoding them
--
local net = wibox.widget.textbox()

-- vicious.register(net, vicious.widgets.net, 'en0s31f6: <span color="red">${enp0s31f6 carrier}</span> wlp4s0: ${wlp4s0 carrier}', 3)

vicious.register(
    net,
    vicious.widgets.net,
    function(widget, args)
        local interfaces = {
            {
                name = "enp0s31f6",
                status = "down"
            },
            {
                name = "wlp4s0",
                status = "down",
            }
        }

        -- should probably base themes on colors
        local net_str = ""
        for _, interface in pairs(interfaces) do
            local color = "red"
            if args["{" .. interface["name"] .. " carrier}"] == 1 then
                interface["status"] = "up"
                color = "green"
            end
            net_str = net_str .. ('%s: <span color="%s">%s</span> '):format(
                interface["name"],
                color,
                interface["status"]
            )
        end

        return string.sub(net_str, 1, string.len(net_str) - 1)
    end,
    2)

return net
