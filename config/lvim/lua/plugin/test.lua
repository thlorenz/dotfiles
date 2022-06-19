lvim.builtin.which_key.mappings["t"] = {
  name = "Test",
  l = { "<cmd>:TestLast<CR>", "Test Last" }
}
vim.cmd [[
  au FileType rust nmap <silent> tn :TestNearest -- --nocapture<CR>
  au FileType rust nmap <silent> tN :TestNearest --features test-bpf -- --nocapture<CR>
]]
