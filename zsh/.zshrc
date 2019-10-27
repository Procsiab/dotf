# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Include user folder NPM folder into system PATH
export PATH=~/.npm-global/bin:/home/lero/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
# Set the terminal color variable
export TERM="xterm-256color"
# Choose theme
ZSH_THEME="subnixr/minimal"
# Choose 'ls' colors
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS

# Prompt component to show Taskwarrior's info
function taskwarrior {
    autoload colors && colors
    for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
        eval $COLOR='%{$fg_no_bold[${(L)COLOR}]%}'  #wrap colours between %{ %}
    done
    eval RESET='%{$reset_color%}'
    _OVERDUE=$(task +READY +OVERDUE count)
    _DUETODAY=$(task +READY +TODAY count)
    _DUETOMRW=$(task +READY +TOMORROW count)
    _PENDING=$(task +READY count)
    if [ $_OVERDUE -gt 0 ]
    then
        printf '%b' "${RED} $_OVERDUE"
    elif [ $_DUETODAY -gt 0 ]
    then
        printf '%b' "${YELLOW} $_DUETODAY"
    elif [ $_DUETOMRW -gt 0 ]
    then
        printf '%b' "${BLUE} $_DUETOMRW"
    elif [ $_PENDING -gt 0 ]
    then
        printf '%b' "${WHITE} $_PENDING"
    else
        printf '%b' "${GREEN}"
    fi
}

# Theme stuff:
MNML_OK_COLOR=5
MNML_USER_CHAR=
MNML_ELLIPSIS_CHAR=…
MNML_INSERT_CHAR="➤"
# Components on the left prompt
MNML_PROMPT=(taskwarrior mnml_pyenv mnml_status mnml_keymap)
# Components on the right prompt
MNML_RPROMPT=('mnml_cwd 2 0' mnml_git)
# Components shown on info line
MNML_INFOLN=(mnml_err mnml_jobs)
# Components shown on magic enter
MNML_MAGICENTER=(mnml_me_git)

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=30

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="false"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="false"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Ignore history records longer than 25 chars
ZSH_AUTOSUGGEST_HISTORY_IGNORE="?(#c25,)"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# ZSH Plugin Manager
#if [[ ! -f ~/.zpm/zpm.zsh ]]; then
#  git clone --recursive https://github.com/horosgrisa/zpm ~/.zpm
#fi
#source ~/.zpm/zpm.zsh

# ZSH Syntax highlight
if [[ ! -f ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/README.md ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  gitfast
  git-flow
  gitignore
  python
  zsh-syntax-highlighting
)

# ZSH Theme Minimal
if [[ ! -f ~/.oh-my-zsh/custom/themes/subnixr/minimal.zsh ]]; then
  git clone https://github.com/subnixr/minimal.git ~/.oh-my-zsh/custom/themes/subnixr
fi

# Return to avoid interactive shell problems over SSH
[ -z "$PS1" ] && return
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh"

# Disable autocorrection
unsetopt correct_all

# Enable 'thefuck' command correction
alias shish='TF_CMD=$(TF_ALIAS=fuck PYTHONIOENCODING=utf-8 TF_SHELL_ALIASES=$(alias) thefuck $(fc -ln -1 | tail -n 1)) && eval $TF_CMD ; test -n "$TF_CMD" && print -s $TF_CMD'

# Alias for sudo
alias please='sudo'

# Bind CTRL + G to Git add all, commit and push
function git_prepare() {
	if [ -n "$BUFFER" ];
		then
			BUFFER="git add -A && git commit -m \"$BUFFER\" && git push"
	fi
	if [ -z "$BUFFER" ];
		then
			BUFFER="git add -A && git commit -v && git push"
	fi
	zle accept-line
}
zle -N git_prepare
bindkey "^g" git_prepare

# Function to generate printable random bytes
function ndascii() {
	if [ -z $1 ]; then 1=10; fi
	tr -dc '[:graph:]' < /dev/urandom | tr -d \''\\'\` | head -c $1
}

# Fix rofi calls for wayland, and apply correct theme
function get_rofi_theme() {
    if [[ "$(gsettings get org.gnome.desktop.interface gtk-theme)" == "'Adwaita'" ]]; then
        echo "steel-light"
    else
        echo "steel-dark"
    fi
}
alias rofi='rofi -normal-window -theme $(get_rofi_theme)'

# Run a Git sparse clone, using git-sparse <remote url> <dest folder> [<path>, <path>, ...]
function git-sparse() {
    if [[ -z $1 || -z $3 ]]; then
        echo 'Missimg arguments: git-sparse <remote url> <dest folder> [<path>, <path>, ...]'
        exit 1
    fi
    if [[ -z $2 ]]; then
        2=$(pwd)
    fi
    rurl="$1" localdir="$2" && shift 2
    mkdir -p "$localdir"
    cd "$localdir"
    git init
    git remote add -f origin "$rurl"
    git config --local core.sparseCheckout true
    # Loops over remaining args
    for i; do
        echo "$i" >> .git/info/sparse-checkout
    done
    git pull origin master
}
