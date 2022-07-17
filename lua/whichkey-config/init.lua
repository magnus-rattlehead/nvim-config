local wk = require("which-key")
local knap = require('knap')
local dap = require('dap')
local dap_python = require('dap-python')

local set_breakpoint_condition = function ()
  return dap.set_breakpoint(vim.fn.input('Breakpoint Condition: '))
end
local set_breakpoint_log = function ()
  return dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end
local toggle_float = function()
  local Terminal = require('toggleterm.terminal').Terminal
  local float = Terminal:new({ direction = "float" })
  return float:toggle()
end

local fr = function ()
  return require('custom-functions.find-replace').replace_selection(true, false)
end
local frc = function ()
  return require('custom-functions.find-replace').replace_selection(true, true)
end

local mappings = {
  q = { '<cmd>q<cr>', "Quit" },
  Q = { '<cmd>q!<cr>', "Force Quit" },
  w = { '<cmd>w<cr>', "Save" },
  x = { '<cmd>Bdelete<cr>', "Close" },
  f = { '<cmd>Telescope find_files<cr>', "Find File(s)" },
  s = { '<cmd>Telescope live_grep<cr>', "Live Grep" },
  r = { fr, "Find Replace No Confirm" },
  R = { frc, "Find Replace Confirm" },
  l = {
    name = "LSP",
    i = { "<cmd>LspInfo<cr>", "Connected Language Servers" },
    k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
    K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Commands" },
    w = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', "Add Workspace Folder" },
    W = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', "Remove Workspace Folder" },
    l = {
      '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>',
      "List Workspace Folders"
    },
    t = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', "Type Definition" },
    d = { '<cmd>lua vim.lsp.buf.definition()<cr>', "Go To Definition" },
    D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', "Go To Declaration" },
    r = { '<cmd>lua vim.lsp.buf.references()<cr>', "References" },
    ["<Tab>"] = { '<cmd>SymbolsOutline<cr>', "Toggle Symbols Outline" },
    R = { '<cmd>Lspsaga rename<cr>', "Rename" },
    a = { '<cmd>Lspsaga code_action<cr>', "Code Action" },
    e = { '<cmd>Lspsaga show_line_diagnostics<cr>', "Show Line Diagnostics" },
    n = { '<cmd>Lspsaga diagnostic_jump_next<cr>', "Go To Next Diagnostic" },
    N = { '<cmd>Lspsaga diagnostic_jump_prev<cr>', "Go To Previous Diagnostic" },
    c = { '<cmd>Copilot panel<cr>', "Show Github CoPilot Panel" },
  },
  b = {
    name = "Bufferline",
    h = { '<cmd>BufferLineCyclePrev<cr>', "Go to Previous Tab" },
    l = { '<cmd>BufferLineCycleNext<cr>', "Go to Next Tab" },
    k = { '<cmd>BufferLineMovePrev<cr>', "Move Tab to the Left" },
    j = { '<cmd>BufferLineMoveNext<cr>', "Move Tab to the Right" },
    p = { '<cmd>BufferLineTogglePin<cr>', "Pin Current Tab" },
    ["1"] = { '<cmd>BufferLineGotoBuffer 1<cr>', "Switch to Tab 1" },
    ["2"] = { '<cmd>BufferLineGotoBuffer 2<cr>', "Switch to Tab 2" },
    ["3"] = { '<cmd>BufferLineGotoBuffer 3<cr>', "Switch to Tab 3" },
    ["4"] = { '<cmd>BufferLineGotoBuffer 4<cr>', "Switch to Tab 4" },
    ["5"] = { '<cmd>BufferLineGotoBuffer 5<cr>', "Switch to Tab 5" },
    ["6"] = { '<cmd>BufferLineGotoBuffer 6<cr>', "Switch to Tab 6" },
    ["7"] = { '<cmd>BufferLineGotoBuffer 7<cr>', "Switch to Tab 7" },
    ["8"] = { '<cmd>BufferLineGotoBuffer 8<cr>', "Switch to Tab 8" },
    ["9"] = { '<cmd>BufferLineGotoBuffer 9<cr>', "Switch to Tab 9" },
  },
  e = { "<cmd>NvimTreeToggle<cr>", "Toggle File Tree" },
  E = { "<cmd>NvimTreeRefresh<cr>", "Refresh File Tree" },
  n = { "<cmd>NvimTreeFindFile<cr>", "Find File in Tree" },
  t = {
    name = "Toggle Term",
    t = { "<cmd>ToggleTerm<cr>", "Split Terminal" },
    f = { toggle_float, "Floating Terminal" },
  },
  k = {
    name = "Knap",
    g = { knap.process_once, "Process and refresh document" },
    h = { knap.close_viewer, "Close viewer" },
    j = { knap.toggle_autopreviewing, "Toggle autopreviewing" },
  },
  [","] = { '<cmd>TroubleToggle<cr>', "Toggle Trouble" },
  ["."] = { '<cmd>TroubleRefresh<cr>', "Refresh Trouble" },
  -- ["/"] = {
  --   name = "Hop",
  --   q = { '<cmd>HopAnywhere<cr>', "Hop anywhere" },
  --   w = { '<cmd>HopWord<cr>', "Hop to a word" },
  --   e = { '<cmd>HopPattern<cr>', "Hop to a pattern" },
  --   a = { '<cmd>HopLineStart<cr>', "Hop to start of a line" },
  --   z = { '<cmd>HopChar1<cr>', "Hop to a character" },
  --   x = { '<cmd>HopChar2<cr>', "Hop to 2 characters" },
  -- },
  D = {
    name = "Debug",
    c = { dap.continue, "Continue" },
    a = { dap.step_over, "Step Over" },
    s = { dap.step_into, "Step Into" },
    d = { dap.step_back, "Step Back" },
    f = { dap.step_out, "Step Out" },
    b = { dap.toggle_breakpoint, "Toggle Breakpoint" },
    B = { set_breakpoint_condition, "Set breakpoint with condition" },
    l = { set_breakpoint_log, "Set breakpoint with log" },
    r = { dap.repl.open, "Open REPL" },
    L = { dap.run_last, "Run Last" },
    p = {
      Name = "Python",
      j = { dap_python.test_method, "Test method closest to cursore" },
      k = { dap_python.test_class, "Test class" },
      l = { dap_python.debug_selection, "Debug Selection" },
    },
  },
  M = {
    name = "Markdown",
    g = { '<cmd>Glow<cr>', "Glow Markdown Preview" },
  },
  m = {
    Name = "Misc",
    c = { '<cmd>ClangdSwitchSourceHeaderFile<cr>', "Switch between source and header files, when availabe" },
    d = { '<cmd>PackerSync<cr>', "Run PackerSync" },
  },
  S = {
    Name = "Session Management",
    l = { '<cmd>lua require("persistence").load()<cr>', "Load session for current directory" },
    L = { '<cmd>lua require("persistence).load({ last = true })<cr>', "Load last session" },
    s = { '<cmd>lua require("persistence").stop()<cr>', "Stop Persistence" },
  },
}
local opts = { prefix = '<leader>' }
wk.register(mappings, opts)
