-- Keybinding

-- for keyname see https://github.com/xkbcommon/libxkbcommon/blob/master/include/xkbcommon/xkbcommon-keysyms.h

local cful = require("cuteful")
local gears = require("gears")
local cwc = cwc

local enum = cful.enum
local mod = enum.modifier
local button = enum.mouse_btn
local direction = enum.direction

local MODKEY = mod.ALT
local TERMINAL = "alacritty"

-- prevent hotkey conflict on nested session
if cwc.is_nested() then
    MODKEY = mod.Caps_lock
end

------------------- pointer/mouse binding ---------------------
local pointer = cwc.pointer

-- client interactive mode
pointer.bind(MODKEY, button.LEFT, pointer.move_interactive)
pointer.bind(MODKEY, button.RIGHT, pointer.resize_interactive)

------------------- keyboard binding --------------------
local kbd = cwc.kbd

---------------- compositor lifecycle
kbd.bind({ MODKEY, mod.CTRL }, "Delete", cwc.quit, { description = "exit cwc", group = "cwc" })
kbd.bind({ MODKEY, mod.CTRL }, "r", cwc.reload, { description = "reload configuration", group = "cwc" })
kbd.bind({ MODKEY }, "Delete", function()
    collectgarbage("collect")
end, { description = "trigger lua garbage collection", group = "cwc" })

kbd.bind({ MODKEY }, "Escape", function()
    cwc.container.reset_mark();
end, { description = "reset leftover server state", group = "cwc" })

for i = 1, 12 do
    kbd.bind({ mod.CTRL, mod.ALT }, "F" .. i, function()
        cwc.chvt(i)
    end)
end

----------------- CLIENT COMMANDS ------------------------

------------------ general
kbd.bind({ MODKEY, mod.SHIFT }, "q", function()
    local c = cwc.client.focused()
    if c then c:close() end
end, { description = "close client respectfully", group = "client" })

kbd.bind({ MODKEY, mod.CTRL }, "q", function()
    local c = cwc.client.focused()
    if c then c:kill() end
end, { description = "close client forcefully", group = "client" })

kbd.bind(MODKEY, "f", function()
    local c = cwc.client.focused()
    if c then c.fullscreen = not c.fullscreen end
end, { description = "toggle fullscreen", group = "client" })

kbd.bind(MODKEY, "m", function()
    local c = cwc.client.focused()
    if c then c.maximized = not c.maximized end
end, { description = "toggle maximize", group = "client" })

kbd.bind({ MODKEY, mod.SHIFT }, "m", function()
    cful.client.maximize_vertical()
end, { description = "maximize vertically", group = "client" })

kbd.bind({ MODKEY, mod.CTRL }, "m", function()
    cful.client.maximize_horizontal()
end, { description = "maximize horizontally", group = "client" })

kbd.bind({ MODKEY, mod.SHIFT }, "space", function()
    local c = cwc.client.focused()
    if c then c.floating = not c.floating end
end, { description = "toggle floating", group = "client" })

kbd.bind(MODKEY, "n", function()
    local c = cwc.client.focused()
    if c then c.minimized = true end
end, { description = "minimize client", group = "client" })

kbd.bind({ MODKEY, mod.CTRL }, "n", function()
    local c = cful.client.restore(true)
    if c then c:focus() end
end, { description = "restore minimized client", group = "client" })

kbd.bind({ MODKEY }, "o", function()
    local c = cwc.client.focused()
    if c then c.ontop = not c.ontop end
end, { description = "toggle client always on top", group = "client" })

kbd.bind({ MODKEY }, "i", function()
    local c = cwc.client.focused()
    if c then c.above = not c.above end
end, { description = "toggle client above normal toplevel", group = "client" })

kbd.bind({ MODKEY }, "u", function()
    local c = cwc.client.focused()
    if c then c.below = not c.below end
end, { description = "toggle client under normal toplevel", group = "client" })

kbd.bind({ MODKEY, mod.CTRL }, "0", function()
    local c = cwc.client.focused()
    if c then c.sticky = not c.sticky end
end, { description = "toggle client always visible", group = "client" })

--------------------- stack based

kbd.bind(MODKEY, "j", function()
    cful.client.focusidx(1)
end, { description = "focus next client relative by index", group = "client" })

kbd.bind({ MODKEY, mod.CTRL }, "k", function()
    cful.client.focusidx(-1)
end, { description = "focus previous client by index", group = "client" })

kbd.bind({ MODKEY, mod.SHIFT }, "j", function()
    cful.client.swapidx(1)
end, { description = "swap with next client by index", group = "client" })

kbd.bind({ MODKEY, mod.SHIFT }, "k", function()
    cful.client.swapidx(-1)
end, { description = "swap with previous client by index", group = "client" })

kbd.bind({ MODKEY, mod.CTRL }, "Return", function()
    local c = cwc.client.focused()
    if c then cful.client.set_master(c, true) end
end, { description = "promote focused client to master", group = "client" })

kbd.bind({ MODKEY }, "bracketleft", function()
    local c = cwc.client.focused()
    local new_screen = cful.screen.idx(-1, c.screen)
    c:move_to_screen(new_screen)
    new_screen:focus()
end, { description = "cycle move focused client to previous screen", group = "client" })

kbd.bind({ MODKEY }, "bracketright", function()
    local c = cwc.client.focused()
    local new_screen = cful.screen.idx(1, c.screen)
    c:move_to_screen(new_screen)
    new_screen:focus()
end, { description = "cycle move focused client to next screen", group = "client" })

--------------------- direction based
kbd.bind({ MODKEY, mod.CTRL }, "j", function()
    local c = cwc.client.focused()
    if c then
        local near = c:get_nearest(direction.DOWN)
        if near then near:focus() end
    end
end, { description = "focus down", group = "client" })

kbd.bind(MODKEY, "k", function()
    local c = cwc.client.focused()
    if c then
        local near = c:get_nearest(direction.UP)
        if near then near:focus() end
    end
end, { description = "focus up", group = "client" })

kbd.bind(MODKEY, "h", function()
    local c = cwc.client.focused()
    if c then
        local near = c:get_nearest(direction.LEFT)
        if near then near:focus() end
    end
end, { description = "focus left", group = "client" })

kbd.bind(MODKEY, "l", function()
    local c = cwc.client.focused()
    if c then
        local near = c:get_nearest(direction.RIGHT)
        if near then near:focus() end
    end
end, { description = "focus right", group = "client" })

-------------------- container operation
kbd.bind(MODKEY, "t", function()
    local c = cwc.client.focused()
    if c then c.container.insert_mark = true end
end, { description = "mark insert container from the focused client", group = "client" })

kbd.bind(mod.LOGO, "Tab", function()
    local c = cwc.client.focused()
    if c then c.container:focusidx(1) end
end, { description = "cycle next to toplevel inside container", group = "client" })

kbd.bind({ mod.LOGO, mod.SHIFT }, "Tab", function()
    local c = cwc.client.focused()
    if c then c.container:focusidx(-1) end
end, { description = "cycle prev to toplevel inside container", group = "client" })

-------------------------------- appearance
kbd.bind({ MODKEY, mod.SHIFT }, "minus", function()
    local c = cwc.client.focused()
    if c then c.opacity = c.opacity - 0.1 end
end, { description = "decrease opacity", group = "client", repeated = true })

kbd.bind({ MODKEY, mod.SHIFT }, "equal", function()
    local c = cwc.client.focused()
    if c then c.opacity = c.opacity + 0.1 end
end, { description = "increase opacity", group = "client", repeated = true })

---------------- FLOATING WINDOW OPERATION -----------------

---------------- client movement
local move_speed = 30

local function move_left()
    local c = cwc.client.focused()
    if not c or not c.floating then return end

    c:move(-move_speed, 0)
    local pos = c.geometry
    if pos.x < 0 then c:move_to(0, pos.y) end
end

local function move_right()
    local c = cwc.client.focused()
    if not c or not c.floating then return end

    c:move(move_speed, 0)
end

local function move_up()
    local c = cwc.client.focused()
    if not c or not c.floating then return end

    c:move(0, -move_speed)
    local pos = c.geometry
    if pos.y < 0 then c:move_to(pos.x, 0) end
end

local function move_down()
    local c = cwc.client.focused()
    if not c or not c.floating then return end

    c:move(0, move_speed)
end

local move_left_opt = { description = "move client to the left", group = "client", repeated = true }
local move_right_opt = { description = "move client to the right", group = "client", repeated = true }
local move_up_opt = { description = "move client upward", group = "client", repeated = true }
local move_down_opt = { description = "move client downward", group = "client", repeated = true }

kbd.bind(MODKEY, "Left", move_left, move_left_opt)
kbd.bind(MODKEY, "Right", move_right, move_right_opt)
kbd.bind(MODKEY, "Up", move_up, move_up_opt)
kbd.bind(MODKEY, "Down", move_down, move_down_opt)

--------------------- client resize
local size_interval = 20
local function resize_left()
    local c = cwc.client.focused()
    if not c or not c.floating then return end

    c:resize(-size_interval, 0)
end

local function resize_right()
    local c = cwc.client.focused()
    if not c or not c.floating then return end

    c:resize(size_interval, 0)
end

local function resize_up()
    local c = cwc.client.focused()
    if not c or not c.floating then return end

    c:resize(size_interval, 0)
end

local function resize_up()
    local c = cwc.client.focused()
    if not c or not c.floating then return end

    c:resize(0, -size_interval)
end

local function resize_down()
    local c = cwc.client.focused()
    if not c or not c.floating then return end

    c:resize(0, size_interval)
end

local resize_left_opt = { description = "reduce client width", group = "client", repeated = true }
local resize_right_opt = { description = "increase client width", group = "client", repeated = true }
local resize_up_opt = { description = "reduce client height", group = "client", repeated = true }
local resize_down_opt = { description = "increase client height", group = "client", repeated = true }

kbd.bind({ MODKEY, mod.SHIFT }, "Left", resize_left, resize_left_opt)
kbd.bind({ MODKEY, mod.SHIFT }, "Right", resize_right, resize_right_opt)
kbd.bind({ MODKEY, mod.SHIFT }, "Up", resize_up, resize_up_opt)
kbd.bind({ MODKEY, mod.SHIFT }, "Down", resize_down, resize_down_opt)

--------------------- SCREEN LAYOUT ------------------------

kbd.bind({ mod.LOGO, mod.ALT }, "j", function()
    cful.screen.focus_relative(1)
end, { description = "focus the next screen", group = "screen" })
kbd.bind({ mod.LOGO, mod.ALT }, "k", function()
    cful.screen.focus_relative(-1)
end, { description = "focus the previous screen", group = "screen" })

----------------- tag
for i = 1, 9 do
    local i_str = tostring(i)
    kbd.bind(MODKEY, i_str, function()
        local t = cwc.screen.focused():get_tag(i)
        t:view_only()
    end, { description = "view tag #" .. i_str, group = "tag" })

    kbd.bind({ MODKEY, mod.CTRL }, i_str, function()
        local t = cwc.screen.focused():get_tag(i)
        t:toggle()
    end, { description = "toggle tag #" .. i_str, group = "tag" })

    kbd.bind({ MODKEY, mod.SHIFT }, i_str, function()
        local c = cwc.client.focused()
        if not c then return end

        c:move_to_tag(i_str)
    end, { description = "move focused client to tag #" .. i_str, group = "tag" })

    kbd.bind({ MODKEY, mod.SHIFT, mod.CTRL }, i_str, function()
        local c = cwc.client.focused()
        if not c then return end

        c:toggle_tag(i_str)
    end, { description = "toggle focused client on tag #" .. i_str, group = "tag" })
end

kbd.bind(MODKEY, "0", function()
    local scrs = cwc.screen.get()
    for _, s in pairs(scrs) do
        cful.tag.viewnone(s)
    end
end, { description = "view desktop on all screen", group = "tag" })

kbd.bind(MODKEY, "comma", function()
    cful.tag.viewprev()
end, { description = "view next workspace/tag", group = "tag" })

kbd.bind(MODKEY, "period", function()
    cful.tag.viewnext()
end, { description = "view prev workspace/tag", group = "tag" })

-- backtick/tilde key
kbd.bind(MODKEY, "grave", cful.tag.history.restore,
    { description = "activate last activated tags", group = "tag" })

-------------------- tag config
kbd.bind(MODKEY, "equal", function()
    cful.tag.incgap(1)
end, { description = "increase gaps", group = "tag", repeated = true })

kbd.bind(MODKEY, "minus", function()
    cful.tag.incgap(-1)
end, { description = "decrease gaps", group = "tag", repeated = true })

kbd.bind({ mod.LOGO, mod.ALT }, "l", function()
    local s = cwc.screen.focused()
    local c = cwc.client.focused()
    if s.selected_tag.layout_mode == enum.layout_mode.BSP and c.bspfact then
        c.bspfact = c.bspfact + 0.05
    else
        cful.tag.incmwfact(0.05)
    end
end, { description = "increase master/bsp width factor", group = "tag", repeated = true })

kbd.bind({ mod.LOGO, mod.ALT }, "h", function()
    local s = cwc.screen.focused()
    local c = cwc.client.focused()
    if s.selected_tag.layout_mode == enum.layout_mode.BSP and c.bspfact then
        c.bspfact = c.bspfact - 0.05
    else
        cful.tag.incmwfact(-0.05)
    end
end, { description = "decrease master/bsp width factor", group = "tag", repeated = true })

----------------------- bsp hotkey
kbd.bind(MODKEY, "e", function()
    local c = cwc.client.focused()
    if not c then return end

    c:toggle_split()
end, { description = "toggle bsp split", group = "layout" })

--------------- layout commands
kbd.bind(MODKEY, "space", function()
    local tag = cwc.screen.focused().selected_tag
    tag.layout_mode = (tag.layout_mode + 1) % enum.layout_mode.LENGTH
end, { description = "cycle to next layout mode in focused screen", group = "layout" })

kbd.bind({ MODKEY, mod.CTRL }, "space", function()
    local tag = cwc.screen.focused().selected_tag
    tag:strategy_idx(1)
end, { description = "cycle to next strategy in focused screen", group = "layout" })

kbd.bind({ MODKEY, mod.CTRL, mod.SHIFT }, "space", function()
    local tag = cwc.screen.focused().selected_tag
    tag:strategy_idx(-1)
end, { description = "cycle to previous strategy in focused screen", group = "layout" })

kbd.bind({ MODKEY, mod.SHIFT }, "h", function()
    cful.tag.incnmaster(1)
end, { description = "increase the number of master clients", group = "layout" })

kbd.bind({ MODKEY, mod.SHIFT }, "l", function()
    cful.tag.incnmaster(-1)
end, { description = "decrease the number of master clients", group = "layout" })

kbd.bind({ MODKEY, mod.CTRL }, "h", function()
    cful.tag.incncol(1)
end, { description = "increase the number of columns", group = "layout" })

kbd.bind({ MODKEY, mod.CTRL }, "l", function()
    cful.tag.incncol(-1)
end, { description = "decrease the number of columns", group = "layout" })

---------------- launcher
kbd.bind(MODKEY, "Return", function()
    cwc.spawn_with_shell("kitty || alacritty || wezterm || xterm || st")
end, { description = "open a terminal", group = "launcher" })
kbd.bind({ MODKEY }, "F1", function()
    cwc.spawn_with_shell("firefox")
end, { description = "open a web browser", group = "launcher" })
kbd.bind({}, "Super_L", function()
    cwc.spawn_with_shell(
        'rofi -show drun -show-icons')
end, { description = "application launcher", group = "launcher" })

------------------- utility
kbd.bind({ MODKEY }, "Print", function()
    cwc.spawn_with_shell("flameshot gui")
end, { description = "screenshot entire screen", group = "launcher" })
--kbd.bind({ MODKEY, mod.SHIFT }, "s", function()
 --   cwc.spawn_with_shell("flameshot gui")
    -- cwc.spawn_with_shell('slurp | grim -g - - | copyq write image/png - && copyq select 0')
--end, { description = "snipping tool", group = "launcher" })
--kbd.bind(MODKEY, "v", function()
--    cwc.spawn_with_shell("copyq toggle")
--end, { description = "clipboard history", group = "launcher" })

------------------ MEDIA KEY -----------------------

-- Screen brightness
kbd.bind({}, "XF86MonBrightnessUp", function()
    cwc.spawn_with_shell("brightnessctl s 3%+")
end, { exclusive = true, repeated = true })
kbd.bind({}, "XF86MonBrightnessDown", function()
    cwc.spawn_with_shell("brightnessctl s 3%-")
end, { exclusive = true, repeated = true })

local function toggle_mon()
    local scrs = cwc.screen.get();
    for _, s in pairs(scrs) do
        s.dpms = not s.dpms
    end
end
-- there is 2 variant of XF86ScreenSaver and the xkb_state_key_get_syms only send one of the
-- key. The solution is that to use the keysym number as the "key" as specified in
-- xkbcommon-keysyms header.
--
-- just to make sure both will use keysym
kbd.bind({}, 0x1008ff2d, toggle_mon)
kbd.bind({}, 0x10081245, toggle_mon)
-- kbd.bind({}, "XF86ScreenSaver", toggle_mon)

------------ Audio Media Keys
kbd.bind({}, "XF86AudioLowerVolume", function()
    local cmd = string.format("pactl set-sink-volume @DEFAULT_SINK@ %s%%", "-3")
    cwc.spawn_with_shell(cmd)
end, { exclusive = true, repeated = true })
kbd.bind({}, "XF86AudioRaiseVolume", function()
    local cmd = string.format("pactl set-sink-volume @DEFAULT_SINK@ %s%%", "+3")
    cwc.spawn_with_shell(cmd)
end, { exclusive = true, repeated = true })
kbd.bind({}, "XF86AudioMute", function()
    cwc.spawn_with_shell("pactl set-sink-mute @DEFAULT_SINK@ toggle")
end, { exclusive = true })
kbd.bind({}, "XF86AudioMicMute", function()
    cwc.spawn_with_shell("pactl set-source-mute @DEFAULT_SOURCE@ toggle")
end, { exclusive = true })

-------------- Media Player Keys
kbd.bind({}, "XF86AudioPlay", function()
    cwc.spawn_with_shell("playerctl play-pause")
end, { exclusive = true })
kbd.bind({}, "XF86AudioNext", function()
    cwc.spawn_with_shell("playerctl next")
end, { exclusive = true })
kbd.bind({}, "XF86AudioPrev", function()
    cwc.spawn_with_shell("playerctl previous")
end, { exclusive = true })
kbd.bind({}, "XF86AudioStop", function()
    cwc.spawn_with_shell("playerctl stop")
end, { exclusive = true })
kbd.bind({}, "XF86AudioRewind", function()
    cwc.spawn_with_shell("playerctl position 5-")
end, { exclusive = true })
kbd.bind({}, "XF86AudioForward", function()
    cwc.spawn_with_shell("playerctl position 5+")
end, { exclusive = true })


------------ Other Extra Keys
kbd.bind({}, "XF86TouchpadToggle", function()
    local devs = cwc.input.get()

    for _, dev in pairs(devs) do
        if dev.name:lower():match("touchpad") then
            if dev.send_events_mode == enum.libinput.SEND_EVENTS_ENABLED then
                dev.send_events_mode = enum.libinput.SEND_EVENTS_DISABLED
            else
                dev.send_events_mode = enum.libinput.SEND_EVENTS_ENABLED
            end
        end
    end
end, { exclusive = true })
kbd.bind({}, "XF86Calculator", function()
    cwc.spawn_with_shell(TERMINAL .. "-e python ")
end)
kbd.bind({}, "XF86Mail", function()
    cwc.spawn_with_shell("thunderbird -addressbook")
end)
kbd.bind({}, "XF86Tools", function()
    cwc.spawn_with_shell("quodlibet --run")
end)
kbd.bind({}, "XF86HomePage", function() --
    cwc.spawn { "xdg-open", "https://google.com/" }
end)
kbd.bind({}, "XF86RFKill", function() --
    -- TODO: toggle wireless
end)

---------------- PLUGINS -------------------

kbd.bind({ mod.ALT }, "Tab", function() --
    if not cwc.cwcle then return end

    cwc.cwcle.next(mod.ALT)
end, { description = "cycle next client", group = "client", repeated = true })
kbd.bind({ mod.ALT, mod.SHIFT }, "Tab", function() --
    if not cwc.cwcle then return end

    cwc.cwcle.prev(mod.ALT)
end, { description = "cycle previous client", group = "client", repeated = true })

----------------------------- CLIENT MANAGEMENT SUBMAP ---------------------------------

-- Perform client management without holding the modkey
local client_map = kbd.create_bindmap()
client_map.active = false

-- enter this submap by pressing MOD + W in the default map
kbd.bind({ MODKEY }, "w", function()
    client_map:active_only()
end)

-- exit this submap by pressing Esc
client_map:bind({}, "Escape", function()
    client_map.active = false
end)

client_map:bind({}, "h", move_left, move_left_opt)
client_map:bind({}, "j", move_down, move_down_opt)
client_map:bind({}, "k", move_up, move_up_opt)
client_map:bind({}, "l", move_right, move_right_opt)

client_map:bind({ mod.SHIFT }, "h", resize_left, resize_left_opt)
client_map:bind({ mod.SHIFT }, "j", resize_down, resize_down_opt)
client_map:bind({ mod.SHIFT }, "k", resize_up, resize_up_opt)
client_map:bind({ mod.SHIFT }, "l", resize_right, resize_right_opt)

-------------------- DEV ------------------------
kbd.bind({ MODKEY }, "F11", function() --
    cwc.create_output(2)
    print(#cwc.screen.get())
end, { description = "Create output", group = "dev" })

kbd.bind({ MODKEY, mod.CTRL }, "slash", function()
    local s = cwc.screen.focused()
    local c = cwc.client.focused()
    local pos = pointer.get_position()
    print(c, s, c.tag, c.workspace)
    print(pos.x, pos.y)
    print(cwc.client.at(pos.x, pos.y))
    print(gears.debug.dump(c.geometry))
    print(s.active_tag, s.active_workspace)
end, { description = "this just for debugging", group = "dev", exclusive = true, repeated = true })
