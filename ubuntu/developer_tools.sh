# Android Studio
sudo snap install android-studio --classic

# Flutter
sudo snap install flutter --classic
flutter doctor

# Starship
mkdir -p "$HOME/.zsh"
curl -sS https://starship.rs/install.sh | sh -s -- -y

# PGADMIN
# Install the public key for the repository (if not done previously):
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg

# Create the repository configuration file:
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'




# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash


# Install packages
sudo nala install zsh code pgadmin4

# use ZSH
chsh -s $(which zsh)
