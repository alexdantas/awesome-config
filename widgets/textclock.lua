-- Simple textclock widget, from Awful's default
--
-- When clicked it shows the calendar.

mytextclock = awful.widget.textclock(" <span color='#50EBEC'>%H:%M</span> <span color='#00AFAF'>%a, %d/%m/%y</span> ", 10)

-- When someone clicks on me,
-- show calendar
mytextclock:connect_signal("button::press",
						   function ()
							  naughty.notify({ title = "Calendar",
											   timeout = 10,
											   text  = "\n" .. awful.util.pread("cal") })
end)

