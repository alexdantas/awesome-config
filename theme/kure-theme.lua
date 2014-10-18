-- kure theme based on the Default awesome theme
-- Works only on Awesome 3.5!
--
-- Using the `beautiful` theme engine
--
-- You can add as many variables as you wish and access them by using
-- `beautiful.variable` in your rc.lua

-- {{{ My Variables

theme_dir  = "/home/kure/.config/awesome/theme/"
icons_dir  = "/home/kure/.config/awesome/theme/icons/"

-- }}}

theme = {}

--theme.font = "Monospaced 6"
--theme.font = "Ubuntu Mono 10"
--theme.font = "Fixed 8"
--theme.font = "monospace normal 12"
theme.font = "Inconsolata 10"

-- {{{ Taskbar colors

-- theme.bg_normal		= "#01050D"
--theme.bg_normal		= "#404040"
-- theme.bg_normal		= "#000020"
theme.bg_normal		= "#002B36"

-- theme.fg_normal		= "#3D7E84"
theme.fg_normal		= "#E4E4E4"

theme.bg_focus		= "#535d6c"
theme.fg_focus		= "#ffffff"

theme.bg_urgent		= "#501913"
theme.fg_urgent		= "#DC8D84"

theme.bg_minimize	= "#6D6D6D"
theme.fg_minimize	= "#ffffff"

-- Borders on all Windows
theme.border_width	= "1"
theme.border_normal = "#000020"
theme.border_focus	= "#000020"
theme.border_marked = "#8b0000"

-- }}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Taglist
-- Display the taglist squares
theme.taglist_squares_sel	= "/usr/share/awesome/themes/default/taglist/squarefw.png"
theme.taglist_squares_unsel = "/usr/share/awesome/themes/default/taglist/squarew.png"

-- Tasklist
-- Was ugly as fuark
--theme.tasklist_floating_icon = "/usr/share/awesome/themes/default/tasklist/floatingw.png"

-- {{{ Menu
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = icons_dir .. "arrow-right.png"
theme.menu_height		= "18"
theme.menu_width		= "150"
theme.menu_border_color = theme.bg_focus
theme.menu_border_width = "1"

-- }}}

-- {{{ Widget settings
-- These are my custom variables, to be accessed
-- externally

theme.bg_widget = theme.bg_focus

-- }}}

-- {{{ Titlebar

-- Define the image to load
theme.titlebar_close_button_normal = "/usr/share/awesome/themes/zenburn/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/usr/share/awesome/themes/zenburn/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive	= "/usr/share/awesome/themes/zenburn/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive	 = "/usr/share/awesome/themes/zenburn/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active	 = "/usr/share/awesome/themes/zenburn/titlebar/floating_focus_active.png"
-- }}}

-- {{{ Wallpaper
-- You can use your own command to set your wallpaper
--theme.wallpaper_cmd = { "awsetbg /usr/share/awesome/themes/default/background.png" }
--theme.wallpaper_cmd = { "awsetbg "..theme_dir.."bg.png"}
--theme.wallpaper_cmd = { "awsetbg "..theme_dir.."arch.png"}
theme.wallpaper = "/home/kure/.config/awesome/theme/arch.png"

-- }}}

-- You can use your own layout icons like this:
theme.layout_fairh = "/usr/share/awesome/themes/default/layouts/fairhw.png"
theme.layout_fairv = "/usr/share/awesome/themes/default/layouts/fairvw.png"
theme.layout_floating  = "/usr/share/awesome/themes/default/layouts/floatingw.png"
theme.layout_magnifier = "/usr/share/awesome/themes/default/layouts/magnifierw.png"
theme.layout_max = "/usr/share/awesome/themes/default/layouts/maxw.png"
theme.layout_fullscreen = "/usr/share/awesome/themes/default/layouts/fullscreenw.png"
theme.layout_tilebottom = "/usr/share/awesome/themes/default/layouts/tilebottomw.png"
theme.layout_tileleft	= "/usr/share/awesome/themes/default/layouts/tileleftw.png"
theme.layout_tile = "/usr/share/awesome/themes/default/layouts/tilew.png"
theme.layout_tiletop = "/usr/share/awesome/themes/default/layouts/tiletopw.png"
theme.layout_spiral	 = "/usr/share/awesome/themes/default/layouts/spiralw.png"
theme.layout_dwindle = "/usr/share/awesome/themes/default/layouts/dwindlew.png"

theme.awesome_icon = icons_dir .. "awesome.png"

return theme

