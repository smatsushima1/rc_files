################################################################################
#source global definitions
################################################################################

#if [ -f /etc/bashrc ]
#    then . /etc/bashrc
#fi

################################################################################
#check window size after each command and adjust accordingly
################################################################################

shopt -s checkwinsize

################################################################################
#enable auto-completion
#
#yum install -y auto-completion*
################################################################################

if [ -f /usr/share/bash-completion/bash_completion ]
    then . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]
    then . /etc/bash_completion
fi

################################################################################
#paths and environment variables
################################################################################

#export PATH="/home/user/anaconda3/bin:$PATH"

################################################################################
#expand history size
################################################################################

export HISTFILESIZE=10000
export HISTSIZE=500

################################################################################
#prompt modification
################################################################################

PS1="\[\033[1;32m\]\w $ \[\033[0m\]"

################################################################################
#aliases
################################################################################

alias l="ls -Ahlv --group-directories-first --color=auto"
alias ..="cd .."
alias v="vim"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias gitkey='eval "$(ssh-agent -s)" && ssh-add /home/user/.ssh/github_rsa'

################################################################################
#functions
#
#list all functions: declare -f 
#remove function: unset -f [FUNCTION]
################################################################################

#add all files, commit, and push
gdone () {
  echo
  echo "####################### CHECK IF STASHES ARE APPLIED #####################"
  if [ $(git stash list | wc -l) -eq 0 ] 
  then
    echo "Stash your changes first before proceeding!"
    echo
    return 1
  else
    echo "Stashes are applied - function will proceed..."
  fi
  echo
  echo "###################### GIT STASH APPLY AND GIT ADD ######################"
  git stash apply
  git add -A
  shopt -s lastpipe
  echo
  echo "############################## GIT COMMIT ##############################"
  read -p "Enter commit message: " message
  echo
  git commit -m "$message"
  echo
  echo "############################## GIT PUSH ##############################"
  git push
  echo
  echo "################### GIT STATUS AND GIT STASH CLEAR ###################"
  git status
  git stash clear
  echo
}

################################################################################
#start tmux automatically
#
#https://wiki.archlinux.org/index.php/Tmux#Start_tmux_on_every_shell_login
################################################################################

#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

################################################################################
#gitkey
################################################################################

#eval "$(ssh-agent -s)" && ssh-add /home/user/.ssh/github_rsa

