# To source this from .bashrc from home directory, input:
# source [PATH_TO_THIS_FILE]

# Source global definitions
#if [ -f /etc/bashrc ]
#    then . /etc/bashrc
#fi

# Check window size after each command and adjust accordingly
shopt -s checkwinsize

# Enable auto-completion
# yum install -y auto-completion*
if [ -f /usr/share/bash-completion/bash_completion ]
    then . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]
    then . /etc/bash_completion
fi

# Paths and environment variables
#export PATH="/home/user/anaconda3/bin:$PATH"

# Expand history size
export HISTFILESIZE=10000
export HISTSIZE=500

# Prompt modification
PS1="\[\033[1;32m\]\w $ \[\033[0m\]"

# Aliases
alias c="clear"
alias l="ls -Ahlv --group-directories-first --color=auto"
alias ..="cd .."
alias v="vim"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias ga='git add'
alias gaa='ga -A'
alias gs='git stash'
alias gsa='gs apply'
alias gsl='gs list'
alias gsc='gs clear'
alias gcm='git commit -m'
alias gacm='gaa && gs && gsa && gcm'
alias gps='git push && git status'
alias gkey='eval "$(ssh-agent -s)" && ssh-add /home/user/.ssh/github_rsa'
alias gcomm_help="gitk --all $( git fsck --no-reflog | awk '/dangling commit/ {print $3}' )"

# Functions
# List all functions: declare -f 
# Remove function: unset -f [FUNCTION]

# New workflow = gs to store all changes, then gdone
# Add all files, commit, and push
gdone () {
  echo
  echo "######################## CHECK IF GIT PULL IS REQUIRED ########################"
  if git fetch -v --dry-run 2>&1 | grep -q .*'up to date'.*
  then
    echo "No changes detected upstream..."
    echo
  else
    echo "Perform a git pull first!"
    echo
    return 1
  fi
  echo "######################### CHECK IF STASHES ARE APPLIED #########################"
  if [ $(git stash list | wc -l) -eq 0 ] 
  then
    echo "Stash your changes first before proceeding!"
    echo
    return 1
  else
    echo "Stashes are applied, function will proceed..."
    echo
  fi
  echo "######################### GIT STASH APPLY AND GIT ADD #########################"
  git stash apply
  git add -A
  shopt -s lastpipe
  echo
  echo "################################## GIT COMMIT ##################################"
  read -p "Enter commit message: " message
  echo
  git commit -m "$message"
  echo
  echo "################################### GIT PUSH ###################################"
  git push
  echo
  echo "######################## GIT STATUS AND GIT STASH CLEAR ########################"
  git status
  git stash clear
  echo
}

# git add, stash, commit, and push
gascp () {
  echo
  read -p "Enter commit message: " message
  echo
  if [ ${#message} -eq 0 ]
  then
    echo "Nothing inputted, exiting..."
    return 1
  else
    gaa; git commit -m "$message"; git push; git status
  fi
}

# shows every commit ever
# 


# This is such a pointless function; no idea why I tried to write it
# It basically prints the comment titles surrounded by comment blocks
# I'd rather let vim do it...
# comtitle () {
#   new_str=" $1 "
#   num=${#new_str}
#   num=$((80 - num))
#   sides=$((num/2))
#   sides=$(seq "${sides}" | awk '{printf "#"}')
#   
#   printf "$sides $1 $sides\n"
# }

# Start tmux automatically
# https://wiki.archlinux.org/index.php/Tmux#Start_tmux_on_every_shell_login
#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

# Gitkey
#eval "$(ssh-agent -s)" && ssh-add /home/user/.ssh/github_rsa

