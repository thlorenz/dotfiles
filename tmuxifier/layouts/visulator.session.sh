export TMUXIFIER_SESSION=1
ROOT="$HOME/dev/asm/visulator"
session_root $ROOT

if initialize_session "visulator"; then
  cd $ROOT 
  load_window "visulator"
fi

finalize_and_go_to_session
