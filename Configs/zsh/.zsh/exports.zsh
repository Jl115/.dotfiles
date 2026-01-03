# Language
export LANG=en_US.UTF-8

# Android / Java
export JAVA_HOME=$(/usr/libexec/java_home -v 17)
export PATH=$JAVA_HOME/bin:$PATH
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"  
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"

# Ruby / Gems
export PATH=$HOME/.gem/bin:$PATH

# Flutter / Dart
# This dynamically finds where Homebrew has hidden the real Flutter SDK
export FLUTTER_ROOT="$(dirname $(dirname $(readlink /opt/homebrew/bin/flutter)))"
export PATH="$FLUTTER_ROOT/bin:$PATH"
# export PATH="$PATH:$HOME/.pub-cache/bin"
export PATH="$HOME/.pub-cache/bin:$PATH"

# Xcode
export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin

# Go
export PATH="$PATH:$(go env GOPATH)/bin"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# RUST
export PATH="/opt/homebrew/opt/rustup/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"



# Node / NVM
export NVM_DIR="$HOME/.nvm"


# Tools / Misc
export OLLAMA_API_BASE=http://127.0.0.1:11434
export PATH="/usr/local/opt/trash/bin:$PATH"

# System Limits
ulimit -n 4096
