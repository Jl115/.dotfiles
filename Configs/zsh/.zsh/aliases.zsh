# General
alias clear="clear && printf '\e[3J'"
alias c="clear"

# Navigation (Zoxide)
alias cd='z'
alias cdi='zi'
alias cdl='zoxide query -l -s | less'
alias cda='zoxide add'

# Git / Dev
alias gu="git reset --soft HEAD~1"
alias resetDb="npx sequelize db:drop && npx sequelize db:create && npx sequelize db:migrate && npx sequelize db:seed:all"
alias mg="npx sequelize-cli migration:generate --name" # simplified function to alias
alias mgn="mg"

# Flutter / Dart
alias f="fvm flutter"
alias d="fvm dart"

# AI
alias aidero="aider --model ollama/qwen2.5-coder --no-show-model-warnings"

# Custom Tools
alias ovo="openVault"

# SSH Connections
alias flor-dev="ssh centos@dev.app.floriplan.ch"
alias flor-test="ssh centos@test.app.floriplan.ch"
alias myev-dev="ssh centos@dev.my.evosys.ch"
alias myev-test="ssh centos@test.my.evosys.ch"
alias ahub-dev="ssh debian@dev.app.alarmhub.ch"
alias ahub-test="ssh debian@test.app.alarmhub.ch"
alias aldi-dev="ssh debian@dev.app.alarmdisplay.ch"
alias aldi-test="ssh debian@test.app.alarmdisplay.ch"
alias devAldi="ssh debian@dev.app.alarmdisplay.ch" # Duplicate of aldi-dev?
alias spot-dev="ssh debian@dev.app.spotpilot.ch"
alias spot-test="ssh debian@test.app.spotpilot.ch"
alias vp-log="ssh -p 58291 root@31.97.36.220"
alias vp-kube="ssh -L 6443:127.0.0.1:6443 root@31.97.36.220 -p 58291"

# Dotfiles
alias dotfiles="tuckr"
