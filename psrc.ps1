
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
function ga {& git add $args}
function gaa {& git add -A $args}
function gs {& git stash $args}
function gsa {& git stash apply $args}
function gsl {& git stash list $args}
function gsc {& git stash clear $args}
function gst {& git status $args}
function gcme {& git commit -m $args}
function gacm {& git add -A; git commit -m $args}
function gpu {& git push $args}
function gpst {& git push; git status $args}

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
        gacm $message
        write-output ''
    }
    write-output '################################### `git push` ##################################'
    gpu
    write-output ''
    write-output '################################## `git status` #################################'
    gst
    write-output ''
}


################################### Aliases ###################################
set-alias l 'ls'
set-alias .. 'cd..'
set-alias np 'notepad'
set-alias v 'C:\Program Files (x86)\Vim\vim81\vim.exe'

################################# Chocolatey ##################################
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}


