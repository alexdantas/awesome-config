-- Separate file for all my Awesome key bindings

-- {{{ Key bindings
globalkeys = awful.util.table.join(

   -- Navigating on the tags (screens)
   awful.key({ modkey,           }, "Left",   awful.tag.viewprev ),
   awful.key({ modkey,           }, "Right",  awful.tag.viewnext ),

   -- "Alt-tabbing" the tags
   awful.key({ modkey,           }, "Escape", awful.tag.history.restore ),

   -- Next window
   awful.key({ modkey,           }, "n",
	  function ()
		 awful.client.focus.byidx( 1)
		 if client.focus then client.focus:raise() end
   end),

   -- Previous window
   awful.key({ modkey,           }, "p",
	  function ()
		 awful.client.focus.byidx(-1)
		 if client.focus then client.focus:raise() end
   end),

   -- Show the main menu wherever the mouse cursor
   -- currently is.
   awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

   -- Switching Windows' position on the taskbar
   awful.key({ modkey, "Shift"   }, "n", function () awful.client.swap.byidx(  1)    end),
   awful.key({ modkey, "Shift"   }, "p", function () awful.client.swap.byidx( -1)    end),

   -- .. wut
   awful.key({ modkey, "Control" }, "n", function () awful.screen.focus_relative( 1) end),
   awful.key({ modkey, "Control" }, "p", function () awful.screen.focus_relative(-1) end),
   awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),

   -- "Alt+Tabbing"
   awful.key({ modkey,           }, "Tab",
	  function ()
		 awful.client.focus.history.previous()
		 if client.focus then
			client.focus:raise()
		 end
   end),

   -- Running the terminal
   awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),

   -- Restarting Awesome
   awful.key({ modkey, "Control" }, "r", awesome.restart),

   -- I never use this shortcut anyways, let's avoid hitting it by accident
   --    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

   -- Locks screen with `xscreensaver`
   awful.key({ modkey, "Shift"   }, "l", function () awful.util.spawn("xscreensaver-command -lock") end),

   -- Dims off screen on X
   -- (returns to normal after mouse movement or keypress)
   awful.key({ modkey, "Shift"   }, "d", function () awful.util.spawn("xset dpms force off") end),

   -- I don't know what those do.
   -- Let's just ignore them for a while
   --
   -- awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
   -- awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
   -- awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
   -- awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
   -- awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
   -- awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),

   -- Alternate between Layout modes defined on `rc.lua`
   awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
   awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

   -- WTF does this do?
   awful.key({ modkey, "Control" }, "-", awful.client.restore),

   -- Prompt to run something
   awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

   -- Special keys on my strange keyboard mapping to programs
   awful.key({ }, "#180", function () awful.util.spawn("firefox") end), -- Home
   awful.key({ }, "#163", function () awful.util.spawn("thunderbird") end), -- Mail
   awful.key({ }, "#179", function () awful.util.spawn("banshee") end), -- Tools
   awful.key({ }, "#148", function () awful.util.spawn("qalculate") end), -- Calculator


   -- I've never needed this
   -- (to eval arbitrary lua code)
   --
   -- awful.key({ modkey }, "x",
   --           function ()
   --               awful.prompt.run({ prompt = "Run Lua code: " },
   --               mypromptbox[mouse.screen].widget,
   --               awful.util.eval, nil,
   --               awful.util.getdir("cache") .. "/history_eval")
   --           end),

   -- Print screen key saves screenshots through scrot on ~/screenshots
   -- awful.key({ }, "Print", function () awful.util.spawn("scrot 'screen-%F-%T.png' -e 'mv $f ~/screenshots/ 2>/dev/null'") end),
   awful.key({ }, "Print", function () awful.util.spawn("xfce4-screenshooter --fullscreen") end),

   -- Mod+Print screen saves current window
   -- awful.key({ modkey, }, "Print", function () awful.util.spawn("scrot 'window-%F-%T.png' -u -e 'mv $f ~/screenshots/ 2>/dev/null'") end),
   awful.key({ modkey, }, "Print", function () awful.util.spawn("xfce4-screenshooter --window") end)

   -- Let's do something with the Menu key
   --    awful.key({ }, "Menu", function () awful.util.spawn("xscreensaver-command -lock") end)
)

-- Other key bindings
clientkeys = awful.util.table.join (

   -- Toggle fullscreen
   awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),

   -- "Alt-F4", kill current window
   awful.key({ modkey,           }, "F4",     function (c) c:kill()                         end),

   -- Toggle floating
   awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),

   awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),

   -- What?
   awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),

   -- What? Error?
   awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),

   -- Toggle on-top
   awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),


   -- Controlling the volume via those special keys
   awful.key({ }, "XF86AudioLowerVolume", function () couth.notifier:notify( couth.alsa:setVolume('Master','3dB-'))   end),
   awful.key({ }, "XF86AudioRaiseVolume", function () couth.notifier:notify( couth.alsa:setVolume('Master','3dB+'))   end),
   awful.key({ }, "XF86AudioMute",        function () couth.notifier:notify( couth.alsa:setVolume('Master','toggle')) end),

   awful.key({ "Control" }, "XF86AudioLowerVolume", function () couth.notifier:notify( couth.alsa:setVolume('Headphone','3dB-'))   end),
   awful.key({ "Control" }, "XF86AudioRaiseVolume", function () couth.notifier:notify( couth.alsa:setVolume('Headphone','3dB+'))   end),
   awful.key({ "Control" }, "XF86AudioMute",        function () couth.notifier:notify( couth.alsa:setVolume('Headphone','toggle')) end),


   -- Minimize window
   awful.key({ modkey,           }, "-",
	  function (c)
		 -- The client currently has the input focus, so it cannot be
		 -- minimized, since minimized clients can't have the focus.
		 c.minimized = true
   end),

   -- Maximize window ('Shift' plus '=' equals '+')
   awful.key({ modkey, "Shift"   }, "=",
	  function (c)
		 c.maximized_horizontal = not c.maximized_horizontal
		 c.maximized_vertical   = not c.maximized_vertical
   end),

   -- Toggle window span whole screen
   awful.key({ modkey, }, "a",
	  function (c)
		 c.maximized_horizontal = not c.maximized_horizontal
		 c.maximized_vertical   = not c.maximized_vertical
   end)
)

-- The following will bind all the numbers to certain keys.
-- Mod + Number                 Move to specified tag
-- Mod + Ctrl  + Number         s
-- Mod + Shift + Number         Move current window to tag
-- Mod + Ctrl  + Shift + Number sp

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Actually bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
   globalkeys = awful.util.table.join(globalkeys,
									  awful.key({ modkey }, "#" .. i + 9,
										 function ()
											local screen = mouse.screen
											if tags[screen][i] then
											   awful.tag.viewonly(tags[screen][i])
											end
									  end),
									  awful.key({ modkey, "Control" }, "#" .. i + 9,
										 function ()
											local screen = mouse.screen
											if tags[screen][i] then
											   awful.tag.viewtoggle(tags[screen][i])
											end
									  end),
									  awful.key({ modkey, "Shift" }, "#" .. i + 9,
										 function ()
											if client.focus and tags[client.focus.screen][i] then
											   awful.client.movetotag(tags[client.focus.screen][i])
											end
									  end),
									  awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
										 function ()
											if client.focus and tags[client.focus.screen][i] then
											   awful.client.toggletag(tags[client.focus.screen][i])
											end
   end))
end

clientbuttons = awful.util.table.join(
   awful.button({ },        1, function (c) client.focus = c; c:raise() end),
   awful.button({ modkey }, 1, awful.mouse.client.move),
   awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)

-- }}}

