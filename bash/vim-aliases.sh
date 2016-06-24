# Open all modified an new files
alias vmno='vim -O `git status --porcelain | awk '"'"'{ print $2 }'"'"'`'
alias vmn='vim `git status --porcelain | awk '"'"'{ print $2 }'"'"'`'

# Switch standard used
alias std='(cd /Users/thlorenz/npm-global/bin/ && rm -f standard && ln -s standardd standard)'
alias stt='(cd /Users/thlorenz/npm-global/bin/ && rm -f standard && ln -s standart  standard)'

