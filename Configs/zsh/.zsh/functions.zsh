function resetNvim() {
  echo "Resetting Neovim cache.."
  rm -rf ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
  echo "Neovim configuration reset complete."
}

function openVault() {
  if [ -z "$1" ]; then
    nvim ~/Vaults/
  else
    nvim ~/Vaults/"$1"
  fi
}

function vi() {
  nvim ${1:+$1}
}

# Auto-load .nvmrc when changing directories
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"
  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Linting script
function lint() {
  base_dir="../" 
  exclude_dirs=("node_modules" ".vscode" ".idea" ".git" "setup") 
  exclude_pattern=$(printf "! -name %s " "${exclude_dirs[@]}")
  dirs=$(eval find "$base_dir" -mindepth 1 -maxdepth 1 -type d $exclude_pattern)
  has_errors=false

  echo "$dirs" | while IFS= read -r dir; do
    echo "Processing $dir..."
    if [ -f "$dir/package.json" ]; then
      if grep -q "\"lint\":" "$dir/package.json"; then
        if npm run lint --prefix "$dir"; then
          echo "Linting succeeded in $dir"
        else
          echo "Linting failed in $dir"
          has_errors=true
        fi
      else
        echo "No lint command found in $dir, skipping."
      fi
    fi
  done

  if [ "$has_errors" = false ]; then
    echo "All linting completed successfully!"
  else
    echo "Linting completed with errors."
  fi
}
