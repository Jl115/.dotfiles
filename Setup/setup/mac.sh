#!/bin/bash

# --- Configuration Variables ---
TARGET_FILE="./wallpaper/denji.jpg"
WALLPAPER_PATH="$(cd "$(dirname "$TARGET_FILE")" && pwd)/$(basename "$TARGET_FILE")"

DOCK_SIZE=12
MAGNIFICATION=true
MAGNIFICATION_SIZE=45
DOCK_POSITION="right"

echo "🚀 Starting Mac configuration..."

echo "Configuring Dock settings..."
defaults write com.apple.dock orientation -string $DOCK_POSITION
defaults write com.apple.dock tilesize -int $DOCK_SIZE
defaults write com.apple.dock magnification -bool $MAGNIFICATION
defaults write com.apple.dock largesize -int $MAGNIFICATION_SIZE

echo "Restarting Dock to apply settings..."
killall Dock

sleep 2

echo "Setting Desktop Wallpaper..."
osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"$WALLPAPER_PATH\""

echo "✅ Done! Configuration applied."
