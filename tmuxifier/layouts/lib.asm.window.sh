window_root="~/dev/asm/lib.asm"
new_window "lib.asm"

split_h 63
select_pane 1

run_cmd "cd $window_root && ,vi" 1
run_cmd "cd $window_root && ,vi" 2
