alias cg-watch-build='cargo-watch -s "clear; cargo build"'

function cg-watch-bin() {
  local bin="$1"
  local command="clear; cargo run --bin ${bin}"
  cargo-watch -s "$command"
}

function cg-watch-bin-release() {
  local bin="$1"
  local command="clear; cargo run --release --bin ${bin}"
  cargo-watch -s "$command"
}
