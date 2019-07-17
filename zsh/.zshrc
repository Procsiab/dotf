# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Include user folder NPM folder into system PATH
export PATH=~/.npm-global/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
# Set the terminal color variable
export TERM="xterm-256color"
# Choose theme
ZSH_THEME="subnixr/minimal"

# Theme stuff:
MNML_OK_COLOR=5
MNML_USER_CHAR=
MNML_ELLIPSIS_CHAR=…
MNML_INSERT_CHAR="➤"
# Components on the left prompt
MNML_PROMPT=(mnml_ssh mnml_pyenv mnml_status mnml_keymap)
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
if [[ ! -f ~/.zpm/zpm.zsh ]]; then
  git clone --recursive https://github.com/horosgrisa/zpm ~/.zpm
fi
source ~/.zpm/zpm.zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  gitfast
  git-flow
  gitignore
  python
  thefuck
  vundle
  vi-mode
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
alias shish='thefuck'
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
