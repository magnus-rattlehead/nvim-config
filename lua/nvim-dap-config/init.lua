local dap = require('dap')
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '~/.config/nvim/external/cpptools-linux/debugAdapters/bin/OpenDebugAD7',
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}
dap.configurations.c = dap.configurations.cpp
require('dap-python').setup('~/.virtualenvs/debugpynvim/bin/python')
require("jdtls").setup_dap { hotcodereplace = "auto" }
require("jdtls.dap").setup_dap_main_class_configs()
vim.lsp.codelens.refresh()
