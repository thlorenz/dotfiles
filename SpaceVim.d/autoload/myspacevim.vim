function! s:cargo_task() abort
    if filereadable('Cargo.toml')
        let commands = ['build', 'run', 'test']
        let conf = {}
        for cmd in commands
            call extend(conf, {
                        \ cmd : {
                        \ 'command': 'cargo',
                        \ 'args' : [cmd],
                        \ 'isDetected' : 1,
                        \ 'detectedName' : 'cargo:'
                        \ }
                        \ })
        endfor
        return conf
    else
        return {}
    endif
endfunction


function! myspacevim#before() abort
    let g:neomake_rust_enabled_makers = ['rustc']
    call SpaceVim#plugins#tasks#reg_provider(funcref('s:cargo_task'))
endfunction

function! myspacevim#after() abort
endfunction
