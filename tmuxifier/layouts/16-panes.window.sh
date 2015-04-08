window_root "`pwd`"

new_window "20-panes"

split_v 50
split_v 50
select_pane 1
split_v 50

#run_cmd "tmux select-layout even-vertical"

select_pane 1
split_h 50 
split_h 50 
select_pane 1
split_h 50 

select_pane 5
select_pane 5
split_h 50 
split_h 50 
select_pane 5
split_h 50 

select_pane 9
split_h 50 
split_h 50 
select_pane 9
split_h 50 

select_pane 13
split_h 50 
split_h 50 
select_pane 13
split_h 50 

select_pane 1
