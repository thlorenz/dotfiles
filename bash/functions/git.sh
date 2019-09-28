# Show git branches by commit date with branch names, dates and last commit
# messages. Prints local branches by default, but can pass a remote name: gitbd origin
function gitbd() {
  local r="refs"
  [[ $1 ]] && r="$r/remotes/$1" || r="$r/heads"
  while read l; do
    echo ${l}
    echo "  " $(git log --date=short -1 --format="%ad %h  %s" ${l})
  done <<< $(git for-each-ref --format='%(refname:short)' --sort=-committerdate ${r})
}
