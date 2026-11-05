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

# --- OPTIONAL: git aliases
alias gst="git status -sb"
alias gp="git push"
alias gl="git pull"
alias gb="git branch"
alias gsw="git switch"
alias gsm="git switch main && git pull"
alias glo="git log --oneline -15"
alias gd="git diff"
alias gpf="git push --force-with-lease"
# Delete local branches already merged into main (misses squash-merged ones).
alias gcleanup="git fetch --prune && git branch --merged main --format='%(refname:short)' | grep -vx main | xargs -n1 git branch -d"
