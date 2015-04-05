window_root '~/dev/asm/logasm'

new_window "voltron"

split_v 70
split_v 60 
split_v 20 
split_h 50

select_pane 1
split_h 10

# --------------------------------------------------------
# |                                             |        |
# |                 1                           |   2    |
# |                                             |        |
# |                                             |        |
# --------------------------------------------------------
# |                                                      |
# |                                                      |
# |                 3                                    |
# |                                                      |
# --------------------------------------------------------
# |                                                      |
# |                                                      |
# |                 4                                    |
# |                                                      |
# --------------------------------------------------------
# |                            |                         |
# |                            |                         |
# |                 5          |             6           |
# |                            |                         |
# --------------------------------------------------------

run_cmd 'lldb ./x' 3
run_cmd 'voltron view disasm' 1
run_cmd 'voltron view register' 2
run_cmd 'voltron view stack' 4
run_cmd 'voltron view backtrace' 5
run_cmd 'voltron view breakpoints' 6

select_pane 3
