-- Two battery widgets (taken from Vicious' default widget set)
--  * batterywidget: Shows a string with battery info
--  * batteryprogress: Shows a horizontal bar with battery usage
--
-- For more info about a Vicious widget, check
-- http://git.sysphere.org/vicious/tree/README
--
-- Don't forget to dofile() this file and include this widget on the Wibox

batterywidget = wibox.widget.textbox()
batterywidget.border_width = 1
batterywidget.border_color = beautiful.fg_normal

vicious.register(batterywidget,       -- widget table, created with widget()
                 vicious.widgets.bat, -- available widget from vicious
                 " <span color='#6698FF'>$1 $2% <span color='#50EBEC'>$3</span></span> ",
                 5,                   -- refresh interval (seconds)
                 "BAT0")              -- optional argument, battery ID


-- Battery widget
batteryprogress = awful.widget.progressbar()
batteryprogress:set_width(30)
batteryprogress:set_height(5)
batteryprogress:set_vertical(false)
batteryprogress:set_background_color("#494B4F")
batteryprogress:set_border_color(nil)
batteryprogress:set_color("#AECF96")

-- Y U NO WORK
--batteryprogress:set_gradient_colors({ "#AECF96", "#88A175", "#FF5656" })

vicious.register(batteryprogress, vicious.widgets.bat, "$2", 61, "BAT0")


