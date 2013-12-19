-- Memory widget (taken from Vicious' default widget set)
--
-- For more info about a Vicious widget, check
-- http://git.sysphere.org/vicious/tree/README
--
-- Don't forget to dofile() this file and include this widget
-- on the Wibox

ramwidget = awful.widget.graph()
ramwidget:set_width(30)
ramwidget:set_background_color("#494B4F")
ramwidget:set_color("#ABFF56")
ramwidget:set_scale(true)

-- Why doesn't this work on awesome 3.5?
--ramwidget:set_gradient_colors({ "#FF5656", "#88A175", "#AECF96" })

vicious.register(ramwidget, vicious.widgets.mem, "$1", 3)

