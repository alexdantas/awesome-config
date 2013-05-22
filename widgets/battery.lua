-- My modded version of Gizmoguy's super-easy acpi battery widgeta battery widget
-- source: http://awesome.naquadah.org/wiki/Gizmoguy's_super-easy_acpi_battery_widget
--
-- Don't forget to dofile() it and include this widget on the Wibox
-- maybe later I'll try to do http://awesome.naquadah.org/wiki/Gigamo_Battery_Widget

--batterywidget      = widget({ type = "textbox" })
batterywidget      = wibox.widget.textbox()
batterywidget.text = "| XX% XX:XX:XX |"
batterywidgettimer = timer({ timeout = 5 })
batterywidgettimer:connect_signal("timeout",
                              function()
                                 --fh = assert(io.popen("acpi | cut -d, -f 2,3 -", "r"))
                                 fh = assert(io.popen("acpi | cut -d ' ' -f 4,5 | tr -d ','", "r"))
                                 --batterywidget.text = "|<span color='orange'> " .. fh:read("*l") .. " </span>|"
                                 batterywidget.text = "| " .. fh:read("*l") .. " |"
                                 fh:close()
                              end)
batterywidgettimer:start()

