-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- Personal tiling, workspace, and screenshot bindings
-- Vim-style H/J/K/L navigation replaces the corresponding Omarchy defaults.

hl.unbind("SUPER + P") -- Was: pseudo window (redeclared below)
hl.unbind("SUPER + O") -- Was: pop window out (float and pin)
hl.unbind("SUPER + H")
hl.unbind("SUPER + J") -- Was: toggle window split
hl.unbind("SUPER + K") -- Was: keybindings menu
hl.unbind("SUPER + L") -- Was: toggle workspace layout
hl.unbind("SUPER + SHIFT + H")
hl.unbind("SUPER + SHIFT + J")
hl.unbind("SUPER + SHIFT + K")
hl.unbind("SUPER + SHIFT + L")
hl.unbind("SUPER + CTRL + H") -- Was: hardware menu
hl.unbind("SUPER + CTRL + J")
hl.unbind("SUPER + CTRL + K") -- Was: Herdr keybindings
hl.unbind("SUPER + CTRL + L") -- Was: lock system

o.bind("SUPER + P", "Pseudo window", hl.dsp.window.pseudo())
o.bind("SUPER + O", "Toggle window split", hl.dsp.layout("togglesplit"))

for key, direction in pairs({ H = "l", L = "r", K = "u", J = "d" }) do
  o.bind("SUPER + " .. key, "Focus window " .. direction, hl.dsp.focus({ direction = direction }))
  o.bind("SUPER + SHIFT + " .. key, "Move window " .. direction, hl.dsp.window.swap({ direction = direction }))
end

o.bind("SUPER + CTRL + H", "Resize window left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
o.bind("SUPER + CTRL + L", "Resize window right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
o.bind("SUPER + CTRL + K", "Resize window right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
o.bind("SUPER + CTRL + J", "Resize window left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })

for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)
  hl.unbind("SUPER + " .. key)
  hl.unbind("SUPER + SHIFT + " .. key)
  o.bind("SUPER + " .. key, "Switch to workspace " .. workspace, hl.dsp.focus({ workspace = tostring(workspace) }))
  o.bind("SUPER + SHIFT + " .. key, "Move window to workspace " .. workspace, hl.dsp.window.move({ workspace = tostring(workspace) }))
end

hl.unbind("SUPER + S") -- Was: toggle scratchpad
hl.unbind("SUPER + SHIFT + S") -- Was: Google Maps
o.bind("SUPER + S", "Toggle magic workspace", hl.dsp.workspace.toggle_special("magic"))
o.bind("SUPER + SHIFT + S", "Move window to magic workspace", hl.dsp.window.move({ workspace = "special:magic" }))

hl.unbind("SUPER + SHIFT + P") -- Was: Google Photos
hl.unbind("SUPER + SHIFT + CTRL + P")
hl.unbind("SUPER + SHIFT + CTRL + ALT + P")
o.bind("SUPER + SHIFT + P", "Screenshot region to clipboard", "hyprshot -m region --clipboard-only")
o.bind("SUPER + SHIFT + CTRL + P", "Screenshot window to clipboard", "hyprshot -m window --clipboard-only")
o.bind("SUPER + SHIFT + CTRL + ALT + P", "Screenshot output to clipboard", "hyprshot -m output --clipboard-only")

-- Relocated Omarchy bindings displaced by the personal bindings above
o.bind("SUPER + ALT + O", "Pop window out (float and pin)", "omarchy-hyprland-window-pop")
o.bind("SUPER + ALT + L", "Toggle workspace layout", "omarchy-hyprland-workspace-layout-toggle")
hl.unbind("SUPER + ALT + K") -- Was: Tmux keybindings
o.bind("SUPER + ALT + K", "Keybindings", "omarchy-menu-keybindings")
o.bind("SUPER + ALT + T", "Tmux keybindings", "omarchy-menu-tmux-keybindings")
o.bind("SUPER + ALT + R", "Herdr keybindings", "omarchy-menu-herdr-keybindings")
o.bind("SUPER + ALT + H", "Hardware menu", "omarchy-menu toggle hardware")
o.bind("SUPER + ALT + Q", "Lock system", "omarchy-system-lock")

hl.unbind("SUPER + ALT + S") -- Was: move window to scratchpad
o.bind("SUPER + ALT + S", "Toggle scratchpad", hl.dsp.workspace.toggle_special("scratchpad"))
o.bind("SUPER + SHIFT + ALT + S", "Move window to scratchpad", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))
