# Android Studio
sudo snap install android-studio --classic

# Flutter
sudo snap install flutter --classic
flutter doctor

# Starship
mkdir -p "$HOME/.zsh"
curl -sS https://starship.rs/install.sh | sh -s -- -y

# PDM
curl -sSLO https://pdm-project.org/install-pdm.py
curl -sSL https://pdm-project.org/install-pdm.py.sha256 | shasum -a 256 -c -
# Run the installer
python3 install-pdm.py

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# Nala
sudo apt install nala
sudo nala update

# Install packages
sudo nala install zsh code

# use ZSH
chsh -s $(which zsh)
