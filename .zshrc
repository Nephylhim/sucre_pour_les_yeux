# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/thomas/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"

# Powerlevel9k theme's vars :
POWERLEVEL9K_MODE='awesome-patched'
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs time status background_jobs)
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=6
plugins=(git git-auto-fetch common-aliases zsh-autosuggestions colored-man-pages colorize command-not-found dircycle go)
# contextual: archlinux nvm

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

eval $(thefuck --alias)

# fix CURL certificates path
export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

alias vtff='killall'
# function vtff(){
#     prog="$@"
#     cmd=$(ps -ef | pgrep $prog | head -n1)
#     kill $cmd
# }


large_separator="\n_____________________________________________________________________\n_____________________________________________________________________\n"
small_separator="_____________________________________________________________________"

function get_dir(){
    echo $1 | sed -re 's|^(/.*)+/.*$|\1|g'
}

function lless(){
    if [[ $# != 1 ]]; then
        echo "lless need 1 arguments";
    fi

    ccat $1 | less
}

function cheat(){
    curl cheat.sh/$1
}

function pkgfrom(){
    dpkg -S $(which $1)
}
alias filefrom='dpkg -S'

alias ll='ls -la --color=auto'
alias osef='sudo !!'
# alias osef='sudo $(history | tail -n1 | cut -c 8-)'
#bash osef='sudo $(history | tail -n2 | head -n1 | cut -c 8-)'
alias cl='clear'
alias update='yaourt -Syu'
alias upt='yaourt -Syu'
alias rb='reboot'
alias internet='systemctl restart NetworkManager'
alias pingue='ping 8.8.8.8'
alias search='yaourt -Ss'
alias install='yaourt -S'
alias nazi='yaourt -Ss'
alias kotoa_m1='ssh toto@172.31.0.14'

alias dodo='shutdown now'
alias resource='clear; source ~/.zshrc'
alias zshrc='vim ~/.zshrc; clear; source ~/.zshrc'
alias shardis='python -m SimpleHTTPServer'
alias gt='goto'
alias vimrc='vim ~/.vimrc; source ~/.vimrc'
alias t2='tree -L 2'
alias t3='tree -L 3'
alias cl='clear'
alias c='code .'
alias s='sudo systemctl'
alias hh='history | less'
alias n='nautilus . &'
alias cht='cht.sh'
alias cheat='cht.sh'
