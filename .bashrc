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
#export PATH='C:/Program Files/PostgreSQL/13/bin:$PATH'

# Expand history size
export HISTFILESIZE=10000
export HISTSIZE=500

# Prompt modification
PS1="\[\033[1;32m\]\w $ \[\033[0m\]"

# Aliases
alias c='clear'
#alias l='ls -Ahlv --group-directories-first --color=auto'
alias l='ls -Ahlv --color=auto'
alias ..='cd ..'
alias v='vim'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ga='git add'
alias gaa='ga -A'
alias gs='git stash'
alias gsa='gs apply'
alias gsl='gs list'
alias gsc='gs clear'
alias gst='git status'
alias gcm='git commit -m'
alias gacm='gaa; gcm'
alias gp='git push'
alias gps='git push; git status'
# alias gkey='eval "$(ssh-agent -s)" && ssh-add /home/user/.ssh/github_rsa'
# alias tm='tmux new-session \; split-window -v \;'


# Functions
# List all functions: declare -f
# Remove function: unset -f [FUNCTION]


# New workflow = gs to store all changes, then gdone
# Add all files, commit, and push
gdone() {
    echo
    echo '######################## Check if `git pull` is Required #######################'
    if git fetch -v --dry-run 2>&1 | grep -q .*'up to date'.*
    then
        echo 'No changes detected upstream...'
        echo
    else
        echo 'Perform a git pull first!'
        echo
        return 1
    fi
    echo '########################## Check if Stashes Are Applied #########################'
    if [ $(git stash list | wc -l) -eq 0 ]
    then
        echo 'Stash your changes first before proceeding!'
        echo
        return 1
    else
        echo 'Stashes are applied, function will proceed...'
        echo
    fi
    echo '############################### Apply All Stashes ##############################'
    gsa
    shopt -s lastpipe
    echo
    echo '######################## `git add -A` and `git commit -m` #######################'
    read -p 'Enter commit message: ' message
    echo
    if [ ${#message} -eq 0 ]
    then
        echo 'Nothing inputted, exiting...'
        return 1
    else
        gacm "$message"
        echo
    fi
    echo '################################### `git push` ##################################'
    gp
    echo
    echo '################################## `git status` #################################'
    gst
    echo
    echo '############################### Clear All Stashes ##############################'
    gsc
    echo
}


# git add, commit, and push
gacp() {
    echo
    echo '######################## Check if `git pull` is Required #######################'
    if git fetch -v --dry-run 2>&1 | grep -q .*'up to date'.*
    then
        echo 'No changes detected upstream...'
        echo
    else
        echo 'Perform a git pull first!'
        echo
        return 1
    fi
    echo '######################## `git add -A` and `git commit -m` #######################'
    read -p 'Enter commit message: ' message
    echo
    if [ ${#message} -eq 0 ]
    then
        echo 'Nothing inputted, exiting...'
        return 1
    else
        gacm "$message"
        echo
    fi
    echo '################################### `git push` ##################################'
    gp
    echo
    echo '################################## `git status` #################################'
    gst
    echo
}


# git branch init
gbi() {
    bname=$1
    if [ ${#bname} -eq 0 ]
    then
        echo 'Branch not specified. Exiting...'
        return 1
    else
        git checkout -b $bname
        git push --set-upstream origin $bname
    fi
}


# Show all git commits ever
# https://stackoverflow.com/questions/89332/how-to-recover-a-dropped-stash-in-git
gitk_help() {
    gitk --all $( git fsck --no-reflog | awk '/dangling commit/ {print $3}' )
}


# source the bashrc and return to previous location
src() {
    dir=$(pwd)
    source ~/.bashrc
    cd $dir
}


# Iniitialize database credentials
dbInit() {
    read -sp "Enter PGUSER: " dbu
    echo
    read -sp "Enter PGDATABASE: " dbn
    echo
    read -sp "Enter PGPASSWORD: " dbp
    echo
    read -sp "Enter PGPORT: " dbpo
    echo
    read -sp "Enter PGHOST: " dbh
    echo
    export PGUSER=$dbu
    export PGDATABASE=$dbn
    export PGPASSWORD=$dbp
    export PGPORT=$dbpo
    export PGHOST=$dbh
    echo 'Done'
}

# This is such a pointless function; no idea why I tried to write it
# It basically prints the comment titles surrounded by comment blocks
# I'd rather let vim do it...
# comtitle () {
#     new_str=" $1 "
#     num=${#new_str}
#     num=$((80 - num))
#     sides=$((num/2))
#     sides=$(seq "${sides}" | awk '{printf "#"}')
#
#     printf "$sides $1 $sides\n"
# }

# Start tmux automatically
# https://wiki.archlinux.org/index.php/Tmux#Start_tmux_on_every_shell_login
#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

# Gitkey
#eval "$(ssh-agent -s)" && ssh-add /home/user/.ssh/github_rsa
