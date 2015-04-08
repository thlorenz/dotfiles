window_root="`pwd`"
new_window "gdb-vim"

split_h 63
select_pane 1

split_v 10

run_cmd ",vi; gdb" 1
run_cmd ",vi; make" 2
run_cmd ",vi; vim x.asm" 3
