vim.cmd [[
  au ColorScheme * highlight CopilotSuggestion guifg=#3333DD ctermfg=8

  imap <silent><script><nowait><expr> <C-\> copilot#Dismiss() . "\<C-\>"
  imap <C-]> <Plug>(copilot-next)
  imap <C-[> <Plug>(copilot-previous)
  map  <leader>cp :Copilot split<CR>
  imap <silent><script><expr> <C-e> copilot#Accept("\<CR>")

  let g:copilot_no_tab_map = v:true
  let g:copilot_assume_mapped = v:true
]]
