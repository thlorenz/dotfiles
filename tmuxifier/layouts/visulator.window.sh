window_root="~/dev/asm/visulator"
new_window "visulator"

split_h 63
select_pane 1

run_cmd "cd $window_root && ,vi" 1
# cleanup tmuxifier in last window that load
run_cmd "rm -f /tmp/tmuxifier_loading_session && cd $window_root && ,vi" 2
