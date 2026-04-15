
# Nala
sudo apt install apt
sudo apt update
sudo apt install curl wget -y texlive-xetex texlive-fonts-recommended texlive-plain-generic zsh



chsh -s $(which zsh)

# Starship
mkdir -p "$HOME/.zsh"
curl -sS https://starship.rs/install.sh | sh -s -- -y
