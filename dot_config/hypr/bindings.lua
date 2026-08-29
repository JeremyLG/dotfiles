-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

hl.unbind("SUPER + ALT + RETURN")
o.bind("SUPER + ALT + RETURN", "Tmux", 'uwsm-app -- xdg-terminal-exec --dir="$(omarchy-cmd-terminal-cwd)" tmux new')

hl.unbind("SUPER + F")
o.bind("SUPER + F", "File manager", "uwsm app -- nautilus --new-window")

hl.unbind("SUPER + B")
hl.unbind("SUPER + SHIFT + B")
hl.unbind("SUPER + SHIFT + ALT + B")
o.bind("SUPER + B", "Browser", '[workspace 1 silent] uwsm-app -- firefox -P "default-release"')
o.bind("SUPER + ALT + B", "Browser (profile)", '[workspace 1 silent] uwsm-app -- firefox -P "issou"')
o.bind("SUPER + SHIFT + B", "Browser (profile)", '[workspace 2] uwsm-app -- firefox -P "loreal"')
o.bind("SUPER + SHIFT + ALT + B", "Browser (profile RIC)", 'uwsm-app -- firefox -P "ric"')

o.bind("SUPER + M", "Music", "omarchy-launch-or-focus spotify")

o.bind("SUPER + N", "Editor", "omarchy-launch-editor")

hl.unbind("SUPER + T")
o.bind("SUPER + T", "Activity", "omarchy-launch-tui btop")

hl.unbind("SUPER + SHIFT + G")
o.bind("SUPER + G", "Signal", 'omarchy-launch-or-focus signal "uwsm app -- signal-desktop"')

hl.unbind("SUPER + SHIFT + S")
o.bind("SUPER + SHIFT + S", "Screenshot", "grim ~/Pictures/$(date +%Y-%m-%d_%H-%M-%S).png")
o.bind("SUPER + ALT + S", "Screenshot region", 'grim -g "$(slurp)" ~/Pictures/$(date +%Y-%m-%d_%H-%M-%S).png')

-- Omarchy Cleaner: unbind packaged defaults for removed apps (2026-08-29)
hl.unbind("SUPER + SHIFT + A")
hl.unbind("SUPER + SHIFT + ALT + A")
hl.unbind("SUPER + SHIFT + ALT + E")
hl.unbind("SUPER + SHIFT + ALT + G")
hl.unbind("SUPER + SHIFT + ALT + M")
hl.unbind("SUPER + SHIFT + ALT + X")
hl.unbind("SUPER + SHIFT + C")
hl.unbind("SUPER + SHIFT + CTRL + G")
hl.unbind("SUPER + SHIFT + D")
hl.unbind("SUPER + SHIFT + E")
hl.unbind("SUPER + SHIFT + O")
hl.unbind("SUPER + SHIFT + P")
hl.unbind("SUPER + SHIFT + W")
hl.unbind("SUPER + SHIFT + X")
hl.unbind("SUPER + SHIFT + Y")
