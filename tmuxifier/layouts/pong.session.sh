export TMUXIFIER_SESSION=1
ROOT="$HOME/dev/asm/pong"
session_root $ROOT

if initialize_session "pong"; then
  cd $ROOT 
  load_window "gdb-vim"
  load_window "lib.asm"
fi

finalize_and_go_to_session
