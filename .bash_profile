# random fortune on new window
clear
date
echo
fortune
echo


export PROJECTS_DIR=~/projects
alias projects='cd $PROJECTS_DIR'


# daily notebook
# ========================================================
export NOTEBOOK=~/notebook

# generate the filename for today
MONTH=$(echo $(date '+%b') | tr '[A-Z]' '[a-z]')
DAY=$(date '+%d')
# ~/notebook/oct-15.txt
export TODAYS_FILE=$NOTEBOOK/$MONTH-$DAY.txt

# we only create a new file if we run the 'morning' command
function morning {
  SCRIPT="good mornin' $USER. it's $(date '+%A, %B %e')"

  touch $TODAYS_FILE

  clear
  echo
  echo $SCRIPT
  say $SCRIPT
  echo
  today
}

# reopen the text file for today
function today {
  # check if there is one for today
  if [ ! -f $TODAYS_FILE ]; then
      echo "File not found!"
  fi
  subl $TODAYS_FILE
}




# htdocs
export HTDOCS=/Applications/MAMP/htdocs/
alias htdocs='cd $HTDOCS'

# dev folder
export DEV=~/dev/




# aliases
# ========================================================
alias reload='source ~/.bash_profile'
alias _a='subl ~/.bash_profile'
alias _git='subl ~/.gitconfig'
# ---------------
alias dsk='cd ~/Desktop'
alias docs="cd ~/Documents"
alias downloads="cd ~/Downloads"
alias movies="cd ~/Movies"
alias pictures="cd ~/Pictures"
alias notebook="cd $NOTEBOOK"
# ---------------
alias dev="cd $DEV"
# ---------------
alias chrome="open -a Google\ Chrome"
alias canary="open -a Google\ Chrome\ Canary"
alias firefox="open -a Firefox"
alias fz="open -a FileZilla"
alias spotify="open -a Spotify"
alias vlc="open -a VLC"
alias steam="open -a Steam"
alias skype="open -a Skype"
# ---------------
alias matrix="cmatrix"


# typos
# ============================
alias ~='cd ~'
alias .='pwd'
alias ..='cd ..'
alias ...='cd ../..'
alias cd..='..'
alias _A='_a'
alias _g='_git'
alias _G='_g'
alias gti='git'


# ========================================================

# check open/running ports
alias ports="lsof -i -P | grep -i \"listen\""
# kill a port: "kill [PID ex. 6141]" --> kill 6413

# run simple Python server (echo address)
function server {
  FEEDBACK='Live link: '
  URL='http://127.0.0.1:'
  PORT=8000

  if [[ "$1" ]]; then
    PORT=$1
  fi

  echo
  echo $FEEDBACK$URL$PORT
  echo
  canary $URL$PORT
  python -m SimpleHTTPServer $PORT
  echo
}


# youtube-dl --> mp3
function mp3 {
  youtube-dl $1 --extract-audio --audio-format mp3
}

# web project bootstrap
alias monte="git clone https://github.com/aztec8/monte.git"



# PATHS, binaries, bash vars
# ========================================================

# Homebrew priority
export PATH=/usr/local/bin:$PATH

# add ~/bin to path
export PATH=~/dev/bin:$PATH

# set EDITOR to sublime text
export EDITOR='subl -w'


# virtualenv stuff
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
source /usr/local/bin/virtualenvwrapper.sh






# ========================================================
# ========================================================

# Custom bash prompt via kirsle.net/wizards/ps1.html
# [zapo:~] $  (bracket part is white)
export PS1='\[$(tput setaf 7)\][\u:\[$(tput bold)\]\W\[$(tput sgr0)\]\[$(tput setaf 7)\]]\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]'
# server:     [user@host ~]$
#             export PS1="[\u@\h \W]\\$ "


# customize ls output
export CLICOLOR=1
export LSCOLORS=exgxdxfxbxegedabagacad
# default: exfxcxdxbxegedabagacad
