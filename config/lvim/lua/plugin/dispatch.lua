vim.cmd [[
function! s:DispatchTmuxInit(win, cmd) 
  exe 'silent Dispatch! tmux ' . a:win . ' "bash --init-file <(echo ''' . a:cmd . ''')"'
endfunction

function! s:DispatchTmuxCmd(win, cmd)
 exe 'silent Dispatch! tmux ' . a:win . ' "' . a:cmd . '"'
endfunction

function! TmuxSplitInit(cmd)
  call s:DispatchTmuxInit('split-window -h', a:cmd)
endfunction

function! TmuxWindowInit(name, cmd)
  call s:DispatchTmuxInit('new-window -n ' . a:name . ' -t 0', a:cmd)
endfunction

function! TmuxWindowInit(name, cmd)
  call s:DispatchTmuxInit('new-window -n ' . a:name . ' -t 0',, a:cmd)
endfunction

function! TmuxWindowCmd(name, cmd)
  call s:DispatchTmuxCmd('new-window -n ' . a:name . ' -t 0', a:cmd)
endfunction
]]
