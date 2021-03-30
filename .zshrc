# ---------------ZPLUG----------------
# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh
zplug "plugins/git",  from:oh-my-zsh, as:plugin
zplug "plugins/colored-man-pages",  from:oh-my-zsh, as:plugin
#zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
#zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# Source plugins and add commands to $PATH
# zplug load --verbose
zplug load

# ------------------------------------
# Default editor
export EDITOR="vim"
# Defalut visual
export VISUAL="vim"

# Replace `ls`
if [ -x "$(command -v exa)" ]; then
    alias ls="exa --group-directories-first"
    alias l="exa -la"
    alias ll="exa --git -l"
    alias t="exa --tree -D -L $1"
else
    echo "Install https://github.com/ogham/exa a better \`ls\`!😉" 
fi
# Replace `cat`
if [ -x "$(command -v bat)" ]; then
    alias cat="bat"
    # bat - configurations
    export BAT_THEME="TwoDark"
    export BAT_STYLE="numbers,changes,header"
else
    echo "Install https://github.com/sharkdp/bat a better \`bat\`!🦇" 
fi
# Fuzzy finder `skim`
if [ -x "$(command -v sk)" ]; then
    export SKIM_DEFAULT_COMMAND="rg --files"
    export SKIM_DEFAULT_OPTIONS="--height=20% --layout=reverse"
    # shell key bindings imported from `fzf`
    source "$HOME/.skim/shell/key-bindings.zsh"
    # Fuzzy find history w/ `Ctrl + R`
    # bindkey -s "^r" "history 1 | sk\n"
    # bindkey -s "^t" "sk\n"
else
    echo "Install https://github.com/lotabout/skim a fuzzy finder tool!🔦" 
fi
# Fast autojumper `z`
if [ -x "$(command -v pazi)" ]; then
    eval "$(pazi init zsh)" # or 'bash'
else
    echo "Install https://github.com/euank/pazi a fast autojump helper ⚡️" 
fi

alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"

# Refresh zsh session
alias src="source ~/.zshrc"

# -----------------------------------
# Configure your current shell for cargo
source $HOME/.cargo/env

# ------------------------------------
if [ -x "$(command -v starship)" ]; then
    export STARSHIP_CONFIG=~/.starship.toml
    eval "$(starship init zsh)"
else
    echo "Install https://starship.rs/guide/#%F0%9F%9A%80-installation a cool prompt 🚀"
fi

