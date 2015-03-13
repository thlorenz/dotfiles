# Open all modified an new files
alias vmno='vim -O `git status --porcelain | awk '"'"'{ print $2 }'"'"'`'
alias vmn='vim `git status --porcelain | awk '"'"'{ print $2 }'"'"'`'
