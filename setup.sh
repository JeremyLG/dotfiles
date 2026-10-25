sudo pacman -Syu \
  age sops bitwarden spotify-launcher discord freerdp pass \
  talosctl kubectl \
  codium ghostty neovim docker docker-compose zip just kubeconform
sudo pacman -R -c fish zsh alacritty

sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker "$USER"
newgrp docker

mkdir -p ~/.config/sops/age
age-keygen -o ~/.config/sops/age/keys.txt
chmod 600 ~/.config/sops/age/keys.txt
cat ~/.config/sops/age/keys.txt

curl --proto '=https' --tlsv1.2 -LsSf https://github.com/j178/prek/releases/download/v0.5.3/prek-installer.sh | sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.8/install.sh | bash
nvm install 26
curl -fsSL https://pi.dev/install.sh | sh
curl -fsSL https://claude.ai/install.sh | bash

sh -c "$(curl -fsLS https://get.chezmoi.io)" -- -b ~/.local/bin
.local/bin/chezmoi init --apply JeremyLG
chezmoi cd
prek install

mkdir devs/
mkdir devs/issou/
mkdir devs/pro/

curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz
tar -xf google-cloud-cli-linux-x86_64.tar.gz
./google-cloud-sdk/install.sh
gcloud init
gcloud auth application-default login
gcloud auth configure-docker

curl -LsSf https://astral.sh/uv/install.sh | sh
uv python install 3.10 3.11 3.14
uv tool install dbt-core --with dbt-postgres

curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/master/install.sh | bash

curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

ssh/config + .gitconfig
gpg --import XXX.asc
gpg --list-keys
gpg --edit-key XXXX
trust
5
save

gpg --list-secret-keys --keyid-format LONG
pass init contabo/pwd

xfreerdp3 /v:"$(pass contabo/ip)" \
  /u:"$(pass contabo/uname)" \
  /p:"$(pass contabo/pwd)" \
  /gfx:AVC440,RFX /cert:ignore \
  +fonts /clipboard \
  /dynamic-resolution \
  -wallpaper -themes -decorations
