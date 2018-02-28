# bashrc
# catalina vajiac

# color definitions
WHITE='\e[0m'
GREEN='\e[01;32m'
BLUE='\e[01;36m'
PEACH='\e[01;33m'
PURPLE='\e[01;35m'
RED='\e[01;31m'

# history options
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth  # no duplicate lines or lines starting with space
shopt -s histappend     # append to history, don't overwrite
shopt -s checkwinsize   # check window size and update values of LINES and COLUMNS

# thanks 8bit <3
#. ~/.if/fi
#. \.\.\.

# important variables
export TERM=xterm-256color
export TERMINAL=terminator
export CLICOLOR=1
export PS1="\[$BLUE\]\u\[$WHITE\]@\[$GREEN\]\h:\[$PEACH\]\W\[$WHITE\]$ "
export BOYS="403 Access Denied/Forbidden"
export LESSCHARSET="utf-8"

# make default editor vim
VISUAL=vim
export vim EDITOR=vim
export vim

# colors
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# color less pages
export LESS_TERMCAP_mb=$(printf $RED)    # enter blinking mode
export LESS_TERMCAP_md=$(printf $PURPLE) # enter double-bright mode
export LESS_TERMCAP_me=$(printf $WHITE)  # turn off all appearance modes
export LESS_TERMCAP_se=$(printf $WHITE)  # leave standout mode    
export LESS_TERMCAP_so=$(printf $PEACH)  # enter standout mode
export LESS_TERMCAP_ue=$(printf $WHITE)  # leave underline mode
export LESS_TERMCAP_us=$(printf $BLUE)   # enter underline mode

# path
TEXPATH='/usr/local/texlive/2017/bin/x86_64-linux'
export PATH=$PATH:~/.local/bin:~/.config/notifyd/scripts:$TEXPATH:

# useful aliases
alias woman='man'
alias tmux='tmux -2'
alias xclip='xclip -selection clipboard'
alias mutt='$HOME/.local/bin/mutt'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# SSH agent
if [ -S ${XDG_RUNTIME_DIR}/ssh-agent ]; then
  export SSH_AUTH_SOCK=${XDG_RUNTIME_DIR}/ssh-agent
else
  eval $(ssh-agent -a ${XDG_RUNTIME_DIR}/ssh-agent 2> /dev/null)
fi 

# startx
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

$HOME/.local/bin/le_petit_prince
