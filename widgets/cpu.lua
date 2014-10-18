-- CPU usage widget (taken from Vicious' default widget set)
--
-- Updated every 3 seconds, feeds the graph with total usage
-- percentage of all CPUs/cores.
--
-- For more info about a Vicious widget, check
-- http://git.sysphere.org/vicious/tree/README
--
-- Don't forget to dofile() this file and include this widget on the Wibox
--
-- Learn more about signals here:
-- http://awesome.naquadah.org/wiki/Signals

cpuwidget = awful.widget.graph()
cpuwidget:set_width(30)
cpuwidget:set_background_color(beautiful.bg_widget)
cpuwidget:set_color("#FF5656")
cpuwidget:set_scale(true)

-- Why doesn't this work on awesome 3.5?
--cpuwidget:set_gradient_colors({ "#FF5656", "#88A175", "#AECF96" })

vicious.register(cpuwidget, vicious.widgets.cpu, "$1", 3)

-- This is my extension to the widget,
-- allowing you to hover your mouse and see the current cpu usage.
--
-- It relies on my local script that gets the temperature from
-- the output of `sensors -u`.
--
cpuwidget_t = awful.tooltip({
	  objects = { cpuwidget },
	  timer_function = function()
		 local output = awful.util.pread("/home/kure/bin/cpu.sh")

		 -- Removing "\n" so the Wibox is pretty
		 return string.sub(output, 1, -2)
	  end,
})

