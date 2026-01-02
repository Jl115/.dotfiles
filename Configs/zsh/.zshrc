# --- Powerlevel10k Instant Prompt ---
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Main Configuration ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Homebrew for M1/M2/M3 Macs
if [[ -d /opt/homebrew/bin ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# --- Source Custom Modules ---
source $HOME/.zsh/exports.zsh
source $HOME/.zsh/plugins.zsh  # Load plugins setup before OMZ
source $ZSH/oh-my-zsh.sh       # Load Oh-My-Zsh
source $HOME/.zsh/aliases.zsh  # Aliases
source $HOME/.zsh/functions.zsh # Functions

# --- Powerlevel10k Configuration ---
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
