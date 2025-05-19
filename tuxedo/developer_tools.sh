
# Starship
mkdir -p "$HOME/.zsh"
curl -sS https://starship.rs/install.sh | sh -s -- -y


# Install UV
curl -LsSf https://astral.sh/uv/install.sh | sh

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash


# Install packages
sudo nala install zsh code

# use ZSH
chsh -s $(which zsh)
