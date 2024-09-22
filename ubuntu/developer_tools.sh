# Android Studio
sudo snap install android-studio --classic

# Flutter
sudo snap install flutter --classic
flutter doctor

# Spaceship
mkdir -p "$HOME/.zsh"
git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.zsh/spaceship"

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
