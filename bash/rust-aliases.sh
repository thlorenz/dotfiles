# Disabled sccache for now since it doesn't work when building C++
# Instead adding aliases below to build with sccache explixitly
# `cargo install sccache`
# export RUSTC_WRAPPER=sccache

alias cg-build-caching='RUSTC_WRAPPER=sccache cargo build'
alias cg-watch-build='cargo-watch -s "clear; cargo build"'
alias cg-watch-build-caching='cargo-watch -s "clear; RUSTC_WRAPPER=sccache cargo build"'
alias cg-watch-test-noc='cargo-watch -s "clear; cargo test -- --nocapture"'

function cg-watch-bin() {
  local bin="$1"
  local command="clear; cargo run --bin ${bin}"
  cargo-watch -s "$command"
}

function cg-watch-example() {
  local bin="$1"
  local command="clear; cargo run --example ${bin}"
  cargo-watch -s "$command"
}

function cg-watch-bin-release() {
  local bin="$1"
  local command="clear; cargo run --release --bin ${bin}"
  cargo-watch -s "$command"
}

function cg-test-sbf() {
  clear; 
  cargo test-sbf $1 -- --nocapture --test-threads=1 2>&1 | solfmt
}
