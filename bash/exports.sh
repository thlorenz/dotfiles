# Github

export GITHUB_TOKEN=$(git config --get github.token)
export GITHUB_USER=$(git config --get github.user)
export GIT_COMMITTER_NAME=${GITHUB_USER:-$(git config --get user.name)}
export GIT_COMMITTER_EMAIL=$(git config --get user.email)
export GIT_AUTHOR_NAME=${GITHUB_USER:-$(git config --get user.name)}
export GIT_AUTHOR_EMAIL=$(git config --get user.email)

# Ruby Gems

# export GEM_HOME=/usr/local/lib/gems/ruby/2.0/gems
export GEM_HOME=/usr/local/Cellar/ruby/3.0.0_1/lib/ruby/gems/3.0.0
export GEM_PATH="$GEM_HOME"

# Go
export GOPATH=$HOME/go

# Cypress Project Related
export SNAPSHOT=$HOME/dev/cy/perf-tr1/esbuild/esbuild/snapshot
