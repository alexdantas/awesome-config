-- Temperature widget (taken from Vicious' default widget set)
--
-- For more info about a Vicious widget, check
-- http://git.sysphere.org/vicious/tree/README
--
-- Don't forget to dofile() this file and include this widget on the Wibox

temperaturewidget = awful.widget.graph()
temperaturewidget:set_width(30)
temperaturewidget:set_background_color(beautiful.bg_widget)
temperaturewidget:set_color("#FFAB56")
temperaturewidget:set_scale(true)

-- Why doesn't this work on awesome 3.5?
--temperaturewidget:set_gradient_colors({ "#FF5656", "#88A175", "#AECF96" })

vicious.register(temperaturewidget, vicious.widgets.thermal, "$1", 3, "thermal_zone0")

-- Gets the output of my custom command that sends sensor
-- informations on a nice way (sensors.rb).
-- The source code is on my gist page (alexdantas).


-- When someone clicks on me, notify current value
temperaturewidget:connect_signal("button::press",
                         function ()
                            os.execute('notify-send Temperature `/home/kure/bin/sensors.rb`')
                           naughty.notify({ title = "Temperature",
                                            text  = "a"..sensors_output().."e" })
                         end)

-- This is my extension to the widget,
-- allowing you to hover your mouse and see the current value.
--
-- It relies on my local script that gets the temperature from
-- the output of `sensors -u`.
--
temperaturewidget_t = awful.tooltip({
	  objects = { temperaturewidget },
	  timer_function = function()
		 local output = awful.util.pread("/home/kure/bin/sensors.rb")

		 -- Removing "\n" so the Wibox is pretty
		 return string.sub(output, 1, -2)
	  end,
})

