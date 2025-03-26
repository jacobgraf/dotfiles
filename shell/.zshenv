# This file is loaded for all zsh shells, including non-interactive ones
# like those used by Raycast scripts

# Hide username in prompt (used by agnoster theme)
DEFAULT_USER=$(whoami)

# Load the shell dotfiles that should be available in all environments:
for file in ~/.dotfiles/shell/.{exports,aliases,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

# Load custom dotfiles if they exist
for file in ~/.dotfiles-custom/shell/.{exports,aliases,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Setup Homebrew
eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null)" || true

# Add dotfiles bin directory to PATH
export PATH=$HOME/.dotfiles/bin:$PATH

# Add composer bin to PATH
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Add homebrew bin to PATH (fallback if brew shellenv fails)
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# Add MySQL 5.7 to PATH
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"

# Setup xdebug
export XDEBUG_CONFIG="idekey=VSCODE"

# Sudoless npm configuration
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# Do not update all homebrew stuff automatically
export HOMEBREW_NO_AUTO_UPDATE=1

# Setup fnm (Fast Node Manager) if available
if [ -d "/Users/$DEFAULT_USER/Library/Application Support/fnm" ]; then
  export PATH="/Users/$DEFAULT_USER/Library/Application Support/fnm:$PATH"
  eval "$(fnm env 2>/dev/null)" || true
fi
