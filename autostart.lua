-- These are some applications that are autostarted
-- every time Awesome is initialized.
--

-- This function makes sure that a program runs only
-- if it's not running yet.
--
-- See: http://awesome.naquadah.org/wiki/Autostart
function run_once(cmd)
   findme = cmd
   firstspace = cmd:find(" ")
   if firstspace then
	  findme = cmd:sub(0, firstspace-1)
   end
   awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " >/dev/null || (" .. cmd .. ")")
end

run_once("unclutter -idle 2")
run_once("xscreensaver -no-splash")

