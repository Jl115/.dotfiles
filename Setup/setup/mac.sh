#!/bin/bash

# --- Configuration Variables ---
WALLPAPER_PATH="./wallpaper/denji.jpg"
DOCK_SIZE=12          # Base size of icons
MAGNIFICATION=true    # Enable magnification (true/false)
MAGNIFICATION_SIZE=45 # How big icons get when hovered (must be larger than DOCK_SIZE)
DOCK_POSITION="right" # Options: "left", "bottom", "right"

echo "🚀 Starting Mac configuration..."

# 1. Configure Dock Size & Magnification
echo "Configuring Dock settings..."
defaults write com.apple.dock orientation -string $DOCK_POSITION
defaults write com.apple.dock tilesize -int $DOCK_SIZE
defaults write com.apple.dock magnification -bool $MAGNIFICATION
defaults write com.apple.dock largesize -int $MAGNIFICATION_SIZE

# 2. Set Desktop Wallpaper
echo "Setting Desktop Wallpaper..."
osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"$WALLPAPER_PATH\""

# 3. Apply Changes
echo "Restarting Dock to apply changes..."
killall Dock

echo "✅ Done! Configuration applied."
