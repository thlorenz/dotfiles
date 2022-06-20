lvim.builtin.dap.on_config_done = function(dap)
  local mappings = lvim.builtin.which_key.mappings["d"]
  mappings['/'] = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" }
  mappings['o'] = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" }
  mappings['s'] = { "<cmd>lua require'dap'.continue(); require'dapui'.open()<cr>", "Start" }

  dap.configurations.rust = {
    {
      name = 'Launch',
      type = 'rt_lldb',
      request = 'launch',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      args = {},
    },
  }
end
