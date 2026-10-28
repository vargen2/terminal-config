# Append to ~/.zshrc. Only the starship line is required for the prompt;
# the rest is optional quality-of-life. Uses $HOMEBREW_PREFIX (set by `brew shellenv`),
# falling back to /opt/homebrew (Apple Silicon).

# --- REQUIRED for the prompt ---
eval "$(starship init zsh)"

# --- OPTIONAL: plugins (brew install zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)
source ${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh-history-substring-search/zsh-history-substring-search.zsh
# Up/down arrows search history by what's already typed.
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# --- OPTIONAL: aliases (ll needs: brew install eza)
alias ll="eza -al --group-directories-first"
alias c="clear"
