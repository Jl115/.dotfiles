#!/bin/bash

# Check if Homebrew is already installed
if command -v brew &>/dev/null; then
  echo "Homebrew is already installed."
  return 0
fi

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Attempt to configure shell environment automatically
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  if [[ -f "/opt/homebrew/bin/brew" ]]; then
    # Apple Silicon
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -f "/usr/local/bin/brew" ]]; then
    # Intel
    eval "$(/usr/local/bin/brew shellenv)"
  fi
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

echo "Installation complete."
