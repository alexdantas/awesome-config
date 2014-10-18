-- Two battery widgets (taken from Vicious' default widget set)
--  * batterywidget: Shows a string with battery info
--  * batteryprogress: Shows a horizontal bar with battery usage
--
-- There's also a little bit of functionality added for the battery,
-- see below.
--
-- For more info about a Vicious widget, check
-- http://git.sysphere.org/vicious/tree/README
--
-- Don't forget to dofile() this file and include this widget on the Wibox

awful = require("awful");

-- My netbooks have a battery ID of "BAT0", while my new
-- Toshiba laptop have it as "BAT1".
-- 
-- Either way, this makes the widget pull stats from
-- the right one.
--
local battery_id = "BAT0"
if not awful.util.file_readable("/sys/class/power_supply/BAT0")
then
   battery_id = "BAT1"
end

batterywidget = wibox.widget.textbox()
batterywidget.border_width = 1
batterywidget.border_color = beautiful.fg_normal

vicious.register(
   batterywidget,       -- widget table, created with widget()
   vicious.widgets.bat, -- available widget from vicious
   " <span color='".. beautiful.bg_focus .. "'>$1 <span color='#50EBEC'>$2% $3</span></span> ",
   1,                   -- refresh interval (seconds)
   battery_id           -- optional argument, battery ID
)


local function trim(s)
   return s:find'^%s*$' and '' or s:match'^%s*(.*%S)'
end

-- Low battery warning {{{
-- This widget sends warnings to Awesome when the battery has low and critical
-- levels (defined inside the function).
--
-- Modified from:
-- http://bpdp.blogspot.com.br/2013/06/battery-warning-notification-for.html

local function battery_notification()

   local f_capacity = assert(io.open("/sys/class/power_supply/" .. battery_id .. "/capacity", "r"))
   local f_status   = assert(io.open("/sys/class/power_supply/" .. battery_id .. "/status", "r"))

   local bat_capacity = tonumber(f_capacity:read("*all"))
   local bat_status   = trim(f_status:read("*all"))

   -- Charged percentage of the battery
   local bat_low_threshold      = 10
   local bat_critical_threshold = 3

   -- Low battery
   if (bat_capacity <= bat_low_threshold and
       bat_capacity >  bat_critical_threshold and
       bat_status   == "Discharging") then

      naughty.notify({ title     = "Battery Warning"
                       , text    = "Battery low! <span color='#50EBEC'>" .. bat_capacity .."%" .. "</span> left!"
                       , timeout = 15
      })
   end

   -- Critical battery
   if (bat_capacity <= bat_critical_threshold
       and bat_status == "Discharging") then

      naughty.notify({ title     = "Battery Critical Warning"
                       , text    = "Battery fucking low! " .. bat_capacity .."%" .. " left!"
                       , fg      ="#ff0000"
                       , bg      ="#deb887"
                       , timeout = 15
      })
   end
end

-- Check every 'n' seconds
battimer = timer({ timeout = 30 })
battimer:connect_signal("timeout", battery_notification)
battimer:start()
-- }}}

-- Battery progress widget {{{
batteryprogress = awful.widget.progressbar()
batteryprogress:set_width(30)
batteryprogress:set_height(5)
batteryprogress:set_vertical(false)
batteryprogress:set_background_color("#494B4F")
batteryprogress:set_border_color(nil)
batteryprogress:set_color("#AECF96")

-- Y U NO WORK
--batteryprogress:set_gradient_colors({ "#AECF96", "#88A175", "#FF5656" })

--vicious.register(batteryprogress, vicious.widgets.bat, "$2", 61, battery_id)

-- }}
