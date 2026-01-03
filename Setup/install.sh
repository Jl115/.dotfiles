#!/bin/bash

cleanup_and_exit() {
  echo "!!! Decryption failed 3 times. Uninstalling everything..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
  rm -rf "$HOME/.dotfiles"
  echo "Cleanup complete. Exiting."
  exit 1
}

#Install Homebrew
echo ">>> Installing Homebrew..."
source ./install/brew.sh

#Install Dependencies
echo ">>> Installing Brewfile dependencies..."
brew bundle --file=./Brewfile

#Decrypt Secrets
echo ">>> Decrypting SSH folder..."
attempt=0
max_attempts=3
success=false

while [ $attempt -lt $max_attempts ]; do
  if tuckr ssh decrypt; then
    success=true
    break
  else
    ((attempt++))
    echo "Password incorrect. Attempt $attempt of $max_attempts."
  fi
done

if [ "$success" = false ]; then
  cleanup_and_exit
fi

#Install Rust
echo ">>> Setting up Rust..."
rustup default stable

#SSH Agent
echo ">>> Enabling SSH Agent..."
source ./helpers/enable-ssh-agent.sh

#Link Dotfiles
echo ">>> Symlinking files..."
tuckr add * -f

#Mac Setup
echo ">>> Configuring macOS defaults..."
source ./setup/mac.sh

#Oh My Zsh
echo ">>> Installing Oh My Zsh..."
source ./install/ohmyzsh.sh

echo ">>> Done. Restart your terminal."
