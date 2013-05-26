-- CPU usage widget (taken from Vicious' default widget set)
--
-- Updated every 3 seconds, feeds the graph with total usage
-- percentage of all CPUs/cores.
--
-- For more info about a Vicious widget, check
-- http://git.sysphere.org/vicious/tree/README
--
-- Don't forget to dofile() this file and include this widget on the Wibox


cpuwidget = awful.widget.graph()
cpuwidget:set_width(30)
cpuwidget:set_background_color("#494B4F")
cpuwidget:set_color("#FF5656")
cpuwidget:set_scale(true)

-- Why doesn't this work on awesome 3.5?
--cpuwidget:set_gradient_colors({ "#FF5656", "#88A175", "#AECF96" })

vicious.register(cpuwidget, vicious.widgets.cpu, "$1", 3)

