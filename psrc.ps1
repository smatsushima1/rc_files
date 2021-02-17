
# To source another powershell script:
# . C:\Users\[USER]\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
#
# To modify this file:
# 1) Run Powershell as administrator
# 2) Run command:
#      Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# 3) Create directory that matches $profile.currentusercurrenthost, which was
#    found here: C:\Users\[USER]\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
#      mkdir c:\Users\[USER]\Documents\WindowsPowerShell
#      notepad $profile
#      [EDIT_AS_NEEDED]

################################## Functions ##################################
function g_add {& git add $args}
function g_addA {& git add -A $args}
function g_stash {& git stash $args}
function g_stashA {& git stash apply $args}
function g_stashL {& git stash list $args}
function g_stashC {& git stash clear $args}
function g_status {& git status $args}
function g_commitM {& git commit -m $args}
function g_addACM {& git add -A; git commit -m $args}
function g_push {& git push $args}
function g_pushSt {& git push; git status $args}

function gacp {
    write-output ''
    write-output '######################## Check if `git pull` is Required #######################'
    if (git fetch -v --dry-run 2>&1 | select-string -quiet -pattern '.*up to date.*') {
        write-output 'No changes detected upstream...'
        write-output ''
    } else {
        write-output 'Perform a git pull first!'
        write-output ''
        exit 1
    }
    write-output '######################## `git add -A` and `git commit -m` #######################'
    $message = read-host -prompt 'Enter commit message: '
    write-output ''
    if ($message.length -eq 0) {
        write-output 'Nothing inputted, exiting...'
        exit 1
    } else {
        g_addACM $message
        write-output ''
    }
    write-output '################################### `git push` ##################################'
    g_push
    write-output ''
    write-output '################################## `git status` #################################'
    g_status
    write-output ''
}


################################### Aliases ###################################
set-alias l 'ls'
set-alias .. 'cd..'
set-alias np 'notepad'
set-alias v 'C:\Program Files (x86)\Vim\vim81\vim.exe'
set-alias ga g_add
set-alias gaa g_addA
set-alias gs g_stash
set-alias gsa g_stashA
set-alias gsl g_stashL
set-alias gsc g_stashC
set-alias gst g_status
set-alias gcme g_commitM
set-alias gacm g_addACM
set-alias gpu g_push
set-alias gpst g_pushSt

################################# Chocolatey ##################################
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}


