# Git
alias ga='git add'
alias gp='git push'
alias gl='git lg'

# outputs logs sorted by committer date
alias gld='git ld | sort -r | more -R'
alias gs='git status --ignore-submodules -s'
alias gb='git branch -v'
alias gc='git checkout'

# diffing
alias gd='git diff'
alias gt='git difftool'
alias gdc='git diff --cached'
alias gtc='git difftool --cached'

# committing
alias gm='git commit -m'
alias gam='git commit -am'
alias gamd='git commit --amend --no-edit'

# fix commit author
alias gfa='git commit --amend --author="Thorsten Lorenz <thlorenz@gmx.de>"'

# remotes
alias gra='git remote add'
alias grr='git remote rm'

# pulling and cloning
alias gpu='git pull'
alias gpur='git pull --rebase'

alias gcl='git clone'

# Fugitive

alias vgs='nvim -c :Gstatus'
alias vgl='nvim -c :Glog'
