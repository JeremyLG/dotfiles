-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

hl.unbind("SUPER + ALT + RETURN")
o.bind("SUPER + ALT + RETURN", "Tmux", "uwsm-app -- xdg-terminal-exec --dir=\"$(omarchy-cmd-terminal-cwd)\" tmux new")

hl.unbind("SUPER + F")
o.bind("SUPER + F", "File manager", "uwsm app -- nautilus --new-window")

hl.unbind("SUPER + B")
o.bind("SUPER + B", "Browser", "[workspace 1 silent] uwsm-app -- firefox -P \"default-release\"")

o.bind("SUPER + ALT + B", "Browser (profile)", "[workspace 1 silent] uwsm-app -- firefox -P \"issou\"")

hl.unbind("SUPER + SHIFT + B")
o.bind("SUPER + SHIFT + B", "Browser (profile)", "[workspace 2] uwsm-app -- firefox -P \"loreal\"")

o.bind("SUPER + SHIFT + ALT + B", "Browser (private)", "uwsm-app -- firefox -P \"jeremy\" --private-window")

o.bind("SUPER + M", "Music", "omarchy-launch-or-focus spotify")

o.bind("SUPER + N", "Editor", "omarchy-launch-editor")

hl.unbind("SUPER + T")
o.bind("SUPER + T", "Activity", "omarchy-launch-tui btop")

o.bind("SUPER + D", "Docker", "omarchy-launch-tui lazydocker")

hl.unbind("SUPER + SHIFT + G")
o.bind("SUPER + G", "Signal", "omarchy-launch-or-focus signal \"uwsm app -- signal-desktop\"")

o.bind("SUPER + SHIFT + A", "Grok", { webapp = "https://grok.com" })

o.bind("SUPER + Y", "YouTube", { webapp = "https://youtube.com/" })

o.bind("SUPER + SHIFT + G", "WhatsApp", { webapp = "https://web.whatsapp.com/", focus = true })

o.bind("SUPER + ALT + G", "Google Messages", { webapp = "https://messages.google.com/web/conversations", focus = true })

o.bind("SUPER + SHIFT + S", "Screenshot", "grim ~/Pictures/$(date +%Y-%m-%d_%H-%M-%S).png")
o.bind("SUPER + ALT + S", "Screenshot region", "grim -g \"$(slurp)\" ~/Pictures/$(date +%Y-%m-%d_%H-%M-%S).png")
