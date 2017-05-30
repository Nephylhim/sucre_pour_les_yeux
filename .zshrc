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
plugins=(git archlinux autojump common-aliases zsh-autosuggestions)

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

#[[ $- != *i* ]] && return
#[[ $(ps -p $PPID -o cmd=) == fish ]] && return
#exec fish
alias isen-eth='sudo ip route add default via 172.18.0.1'
alias beaglebone='ssh 172.18.6.48 -l tcouss'
alias beaglebone-root='ssh 172.18.6.48 -l root'

 alias vtff='killall'
# function vtff(){
#     prog="$@"
#     cmd=$(ps -ef | pgrep $prog | head -n1)
#     kill $cmd
# }

function goto(){
    cmd="$@"
    if [[ $cmd == "-l" || $cmd == "--list" || $cmd == "list" ]]; then
        echo "Liste des alias :"; echo ""
        while read line; do
            alias=${line%:*}
            pwd=${line#*:}
            echo "$alias -> $pwd"
        done < /home/thomas/.gotoFct
    else
        if [[ $1 == "-a" || $1 == "--add"  || $1 == "add" ]]; then
            if [[ $# != 3 ]]; then
                echo "La commande est goto add <alias> <pwd>"
                echo "Tapez 'goto -h' pour afficher l'aide"
            else
                new="$2:$3"
                echo $new >> /home/thomas/.gotoFct
            fi
        else
            if [[ $1 == "-r" || $1 == "--remove" || $1 == "remove" ]]; then
                if [[ $# != 2 ]]; then
                    echo "La commande est goto -r <alias>"
                    echo "Tapez 'goto -h' pour afficher l'aide"
                else
                    sed -i.bak "/$2*/d" /home/thomas/.gotoFct
                    echo "$2 supprimé !"
                fi
            else
                if [[ $1 == "-h" || $1 == "--help" || $1 == "help" ]]; then
                    echo "Utilisation : goto ALIAS"
                    echo "         ou : goto OPTION ALIAS [CHEMIN]"
                    echo "Permet de se déplacer rapidement dans l'arborescence via des alias."
                    echo "Les alias/chemins sont ajoutés au fichier ~/.gotoFct"
                    echo ""
                    echo "Options :"
                    echo "  -l, --list, list            Liste les alias disponibles suivis de leur chemin"
                    echo "  -a, --add, add              Ajoute un alias dans la base"
                    echo "  -r, --remove, remove        Supprime un alias dans la base"
                    echo "  -h, --help, help            Affiche l'aide"
                fi
            fi
        fi
        if [[ $# == 1 ]]; then
            trouve=0
            while read line; do
                alias=${line%:*}
                pwd=${line#*:}
                if [[ $alias == $1 ]]; then
                    cd $pwd;
                    trouve=1
                    break;
                fi
            done < /home/thomas/.gotoFct
            if [[ $trouve == 0 ]]; then
                while read line; do
                    alias=${line%:*}
                    pwd=${line#*:}
                    if [[ $alias == *$1* ]]; then
                        cd $pwd;
                        trouve=1
                        break;
                    fi
                done < /home/thomas/.gotoFct

                if [[ $trouve == 0 ]]; then
                    echo "Alias non trouvé"
                    echo "Tapez 'goto -h' pour afficher l'aide"
                fi
            fi
        fi
    fi
}

alias ll='ls -la --color=auto'
alias osef='sudo $(history | tail -n1 | cut -c 8-)'
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
