TMUXIFIER_SESSION=1
ROOT="$HOME/dev/asm/logasm"
session_root $ROOT

if initialize_session "logasm"; then
  cd $ROOT 
  load_window "gdb-vim"
fi

finalize_and_go_to_session
