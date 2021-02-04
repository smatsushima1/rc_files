# To modify this file:
# 1) Run Powershell as administrator
# 2) Run command:
#      Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# 3) Create directory that matches $profile.currentusercurrenthost, which was
#    found here: C:\Users\[USER]\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
#      mkdir c:\Users\[USER]\Documents\WindowsPowerShell
#      notepad $profile
#      [EDIT_AS_NEEDED]
#
# To source another powershell script:
# 1) Puting this line in the .ps1 file will run the .ps1 file from the other
#    profile:
#      . C:\Users\[USER]\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

# Aliases
set-alias l 'ls'
set-alias .. 'cd..'
set-alias np 'notepad'
set-alias v 'C:\Program Files (x86)\Vim\vim81\vim.exe'

