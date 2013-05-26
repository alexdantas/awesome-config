-- Temperature widget (taken from Vicious' default widget set)
--
-- For more info about a Vicious widget, check
-- http://git.sysphere.org/vicious/tree/README
--
-- Don't forget to dofile() this file and include this widget on the Wibox


temperaturewidget = awful.widget.graph()
temperaturewidget:set_width(30)
temperaturewidget:set_background_color("#494B4F")
temperaturewidget:set_color("#FFAB56")
temperaturewidget:set_scale(true)

-- Why doesn't this work on awesome 3.5?
--temperaturewidget:set_gradient_colors({ "#FF5656", "#88A175", "#AECF96" })

vicious.register(temperaturewidget, vicious.widgets.thermal, "$1", 3, "thermal_zone0")

