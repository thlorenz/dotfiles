# Github

export GITHUB_TOKEN=$(git config --get github.token)
export GITHUB_USER=$(git config --get github.user)
export GIT_COMMITTER_NAME=${GITHUB_USER:-$(git config --get user.name)}
export GIT_COMMITTER_EMAIL=$(git config --get user.email)
export GIT_AUTHOR_NAME=${GITHUB_USER:-$(git config --get user.name)}
export GIT_AUTHOR_EMAIL=$(git config --get user.email)

export js=$(cd ~/dev/js && pwd)
export c=$(cd ~/dev/c && pwd)
export v8="$c/v8/"
export nm="$js/node/"
export n10="$js/node-v0.10.29/"
export n11="$js/node-v0.11.13/"
