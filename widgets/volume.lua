-- Simple volume widget, from Vicious' defaults
-- Displays the Volume and state of ALSA mixers
--
-- For more info about a Vicious widget, check
-- http://git.sysphere.org/vicious/tree/README
--
-- Don't forget to dofile() this file and include this widget on the Wibox

volumewidget = wibox.widget.textbox()
volumewidget.border_width = 1
volumewidget.border_color = beautiful.fg_normal
volumewidget.align = "center"
volumewidget.width = 50
vicious.register(volumewidget, vicious.widgets.volume, "$2 " .. "$1" .. "%", 17, "Master")

