# ---- History ----
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS

# ---- Completion ----
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'   # case-insensitive
zstyle ':completion:*' menu select                        # arrow-key menu

# ---- Basics ----
setopt AUTO_CD            # type a folder name to cd into it
export EDITOR="nvim"

# ---- PATH ----
export PATH="$HOME/go/bin:$PATH"       # Go binaries
export PATH="$HOME/.local/bin:$PATH"   # Cursor CLI

# ---- Version managers ----
eval "$(rbenv init - zsh)"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# ---- Aliases ----
alias ls="eza --color=always --long --git --no-filesize --no-time --no-user --no-permissions"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'   # dotfiles

# A few favorites from Oh My Zsh's git plugin (keep the ones you used)
alias gst='git status'
alias gco='git checkout'
alias gcb='git checkout -b'
alias ga='git add'
alias gc='git commit -v'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias glog='git log --oneline --decorate --graph'

# ---- Plugins & tools ----
source <(fzf --zsh)                    # Ctrl+R fuzzy history, Ctrl+T file search
eval "$(zoxide init zsh)"              # z <partial-folder-name>
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ---- Prompt ----
eval "$(starship init zsh)"

# ---- Dotfiles ----
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Must be last
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
