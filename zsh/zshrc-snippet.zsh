# Append to ~/.zshrc. Only the starship line is required for the prompt;
# the rest is optional quality-of-life. Requires Homebrew on Apple Silicon (/opt/homebrew).

# --- REQUIRED for the prompt ---
eval "$(starship init zsh)"

# --- OPTIONAL: plugins (brew install zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
# Up/down arrows search history by what's already typed.
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# --- OPTIONAL: aliases (ll needs: brew install eza)
alias ll="eza -al --group-directories-first"
alias c="clear"
