# Github

export GITHUB_TOKEN=$(git config --get github.token)
export GITHUB_USER=$(git config --get github.user)
export GIT_COMMITTER_NAME=${GITHUB_USER:-$(git config --get user.name)}
export GIT_COMMITTER_EMAIL=$(git config --get user.email)
export GIT_AUTHOR_NAME=${GITHUB_USER:-$(git config --get user.name)}
export GIT_AUTHOR_EMAIL=$(git config --get user.email)

# Ruby Gems

# export GEM_HOME=$HOME/.gem
# export GEM_PATH="$GEM_HOME"

# Go
export GOPATH=$HOME/go

# Cypress Project Related
export SNAPSHOT=$HOME/dev/cy/perf-tr1/esbuild/esbuild/snapshot

# Rust incremental breaks some project's compilation
# https://github.com/rust-lang/rust/issues/83291#issuecomment-812958848
export CARGO_INCREMENTAL=0
