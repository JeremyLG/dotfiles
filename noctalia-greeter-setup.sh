#!/usr/bin/env bash
# Switches the display manager from SDDM to greetd + Noctalia Greeter.
set -euo pipefail

echo "==> [1/4] Noctalia Greeter system setup (PAM patch, paths, default appearance)"
sudo bash /usr/share/noctalia-greeter/setup_greeter_system.sh

echo
echo "==> [2/4] Writing greetd config (backup kept as config.toml.bak.noctalia)"
sudo cp -a /etc/greetd/config.toml /etc/greetd/config.toml.bak.noctalia 2>/dev/null || true
sudo tee /etc/greetd/config.toml >/dev/null <<'GREETD_CONFIG'
[terminal]
vt = 1

[default_session]
command = "/usr/bin/noctalia-greeter-session"
user = "greeter"
GREETD_CONFIG

echo
echo "==> [3/4] Moving display-manager.service from SDDM to greetd"
sudo systemctl disable sddm
sudo systemctl enable greetd

echo
echo "==> [4/4] Verify"
echo "display-manager.service now -> $(readlink /etc/systemd/system/display-manager.service)"
sudo systemctl is-enabled greetd sddm

echo
echo "Done. The Noctalia Greeter will appear on the next boot"
echo "(your current Umbriel session stays untouched until you reboot)."
