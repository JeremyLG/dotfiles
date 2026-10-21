-- Hyprland default apps

TERMINAL     = "kitty"
FILE_MANAGER = "dolphin"
BROWSER      = "firefox"
EDITOR       = "gnome-text-editor --new-window"
CALCULATOR   = "gnome-calculator"

-- Monitors
-- Physical outputs (see `hyprctl monitors`): DP-1 = external iiyama (primary work
-- screen), eDP-1 = laptop panel. Adjust if you change display hardware.
MONITOR1 = "DP-1"
MONITOR2 = "eDP-1"
MONITOR3 = ""
PRIMARY_MONITOR = MONITOR1

-- Workspaces
NUM_WPM = 6 -- Workspaces covered by SUPER+digit binds (workspaces 1-6 across both monitors; Max 10)
