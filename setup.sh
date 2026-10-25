sh -c "$(curl -fsLS https://get.chezmoi.io)" -- -b ~/.local/bin
.local/bin/chezmoi init --apply JeremyLG
chezmoi cd
prek install

sudo pacman -Syu \
  age sops bitwarden spotify-launcher discord freerdp pass \
  direnv talosctl kubectl \
  codium ghostty neovim docker docker-compose zip just kubeconform

curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
sudo chsh -s /bin/bash $USER
reboot

sudo pacman -R -c fish zsh alacritty

sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker "$USER"
newgrp docker

mkdir -p ~/.config/sops/age
age-keygen -o ~/.config/sops/age/keys.txt
chmod 600 ~/.config/sops/age/keys.txt

curl --proto '=https' --tlsv1.2 -LsSf https://github.com/j178/prek/releases/download/v0.5.3/prek-installer.sh | sh

export NVM_DIR=
export XDG_CONFIG_HOME=
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.8/install.sh | bash
nvm install 26
source ~/.bashrc

curl -fsSL https://pi.dev/install.sh | sh
curl -fsSL https://claude.ai/install.sh | bash

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

curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/master/install.sh | sudo bash

ssh/config + .gitconfig
gpg --import XXX.asc
gpg --list-keys
gpg --edit-key XXXX
trust
5
save

gpg --list-secret-keys --keyid-format LONG
pass init GPGKEY
pass add contabo/pwd
xf

ssh-keygen -f ~/.ssh/id_ed25519
ssh-keygen -f ~/.ssh/id_ed25519.issou
ssh-keygen -f ~/.ssh/id_ed25519.jeremylg
ssh-keygen -f ~/.ssh/id_ed25519.loreal

chezmoi cd
git remote remove origin
git remote add origin git@github-perso:JeremyLG/dotfiles.git

cd devs/issou
cat ~/.ssh/id_ed25519.issou.pub | wl-copy
# go to forgejo
git clone ssh://git@forgejo/topkek-issou/homelab.git
git clone ssh://git@forgejo/topkek-issou/mds.git
# add keys to sops, push and wait for other laptop to reencrypt
cd homelab
cat ~/.config/sops/age/keys.txt
nvim .sops.yaml
git add . && git commit -m "add sops key" && git push
git pull
just install

cd ../mds
cat ~/.config/sops/age/keys.txt
nvim .sops.yaml
git add . && git commit -m "add sops key" && git push
git pull
just install

cd ~/devs/jeremylg
cat ~/.ssh/id_ed25519.jeremylg.pub | wl-copy
# go to github
git clone git@github-perso:JeremyLG/lookml-utils.git

curl -fsSL https://raw.githubusercontent.com/rtk-ai/rtk/master/install.sh | sh
rtk init -g
rtk init -g --agent pi
rtk gain
