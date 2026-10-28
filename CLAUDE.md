# AI setup guide

You are installing this terminal config (cmux/Ghostty + Starship) on someone's Mac.
Read `README.md` first for what each file does and what is optional.

## Rules
- **Ask before** installing anything, and **never overwrite** an existing config without backing it up first (`<file>.bak.<YYYYMMDD-HHMMSS>`).
- **Ask the user** which optional parts they want. Present them as one multi-select question:
  1. Terminal: cmux, Ghostty, or keep their current terminal (then they must set its font to JetBrainsMono Nerd Font themselves)
  2. zsh plugins + aliases from `zsh/zshrc-snippet.zsh` (default: yes)
  3. cmux shortcut tweak `cmux/cmux.json` (default: yes if cmux)
- Don't touch unrelated parts of their `~/.zshrc`.

## Steps

1. **Check prerequisites**
   - macOS, zsh (`echo $SHELL`), Homebrew (`brew --version`). If brew is missing, ask before installing it from https://brew.sh.
   - Note the brew prefix (`brew --prefix`). The zsh snippet assumes `/opt/homebrew` (Apple Silicon). On Intel use `/usr/local` and adjust the paths.

2. **Install required tools** (skip what's already installed)
   ```sh
   brew install starship
   brew install --cask font-jetbrains-mono-nerd-font
   ```
   Plus the chosen terminal: `brew install --cask ghostty` or `brew install --cask manaflow-ai/cmux/cmux` (if that tap fails, tell the user to download it from https://cmux.dev).

3. **Ghostty config** (needed for both Ghostty and cmux)
   - Check for existing configs at `~/.config/ghostty/config`, `~/.config/ghostty/config.ghostty`, and `~/Library/Application Support/com.mitchellh.ghostty/config`. Ghostty loads all of them, so back up any that exist and tell the user about them. If an existing one has real settings (not just the commented template), ask whether to merge or replace.
   - `mkdir -p ~/.config/ghostty && cp ghostty/config ~/.config/ghostty/config`
   - Validate: `ghostty +validate-config` (for cmux: `/Applications/cmux.app/Contents/Resources/bin/ghostty +validate-config`). It must print no errors.

4. **Starship**
   - Back up `~/.config/starship.toml` if it exists, then `cp starship/starship.toml ~/.config/starship.toml`.
   - If `STARSHIP_CONFIG` is set in their shell, warn them, because it overrides that path.
   - Ensure `eval "$(starship init zsh)"` is in `~/.zshrc` exactly once. Remove or ask about conflicting prompt setups (oh-my-zsh `ZSH_THEME`, powerlevel10k, oh-my-posh).

5. **zsh extras** (if chosen)
   - `brew install zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search eza`
   - Append the lines from `zsh/zshrc-snippet.zsh` that aren't already in `~/.zshrc`. Keep `starship init` single, fix the brew prefix if needed, and keep `zsh-syntax-highlighting` sourced before `history-substring-search`.

6. **cmux** (if chosen)
   - Back up `~/.config/cmux/cmux.json` if it exists, then `mkdir -p ~/.config/cmux && cp cmux/cmux.json ~/.config/cmux/cmux.json`.
   - If they already had a cmux.json with other settings, merge the `shortcuts.bindings` keys in instead of replacing the file.

7. **Verify**
   - `zsh -ic 'starship --version && starship explain >/dev/null && echo ok'`
   - `starship print-config >/dev/null` must report no errors.
   - Ask the user to open a **new** cmux/Ghostty window. They should see a red/peach/yellow powerline prompt with a  icon, the path, and the git branch. Boxes or `?` instead of icons mean the terminal isn't using the Nerd Font.
   - In a running cmux, `cmux reload-config` picks up Ghostty changes.

8. **Report**: list what was installed, which files were written, and where the backups are.
