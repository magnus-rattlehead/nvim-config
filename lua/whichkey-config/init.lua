local wk = require("which-key")
local knap_process_once = function()
  local knap = require('knap')
  return knap.process_once()
end
local knap_close_viewer = function()
  local knap = require('knap')
  return knap.close_viewer()
end
local knap_toggle_autopreviewing = function()
  local knap = require('knap')
  return knap.toggle_autopreviewing()
end
local toggle_float = function()
  local Terminal = require('toggleterm.terminal').Terminal
  local float = Terminal:new({ direction = "float" })
  return float:toggle()
end
local mappings = {
  q = { ":q<cr>", "Quit" },
  w = { ":w<cr>", "Save" },
  x = { ":Bdelete<cr>", "Close" },
  f = { ":Telescope find_files<cr>", "Find File(s)" },
  s = { ":Telescope live_grep<cr>", "Live Grep" },
  l = {
    name = "LSP",
    i = { ":LspInfo<cr>", "Connected Language Servers" },
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
    k = { '<cmd>BufferMovePrev<cr>', "Move Tab to the Left" },
    j = { '<cmd>BufferMoveNext<cr>', "Move Tab to the Right" },
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
  r = { "<cmd>NvimTreeRefresh<cr>", "Refresh File Tree" },
  n = { "<cmd>NvimTreeFindFile<cr>", "Find File in Tree" },
  t = {
    name = "Toggle Term",
    t = { ":ToggleTerm<cr>", "Split Terminal" },
    f = { toggle_float, "Floating Terminal" },
  },
  z = {
    name = "Knap",
    z = { knap_process_once, "Process and refresh document" },
    x = { knap_close_viewer, "Close viewer" },
    c = { knap_toggle_autopreviewing, "Toggle autopreviewing" },
  },
  [","] = { '<cmd>TroubleToggle<cr>', "Toggle Trouble" },
  ["."] = { '<cmd>TroubleRefresh<cr>', "Refresh Trouble" },
  ["/"] = {
    name = "Hop",
    w = { '<cmd>HopWord<cr>', "Hop to a word" },
    a = { '<cmd>HopLineStart<cr>', "Hop to start of a line" },
    s = { '<cmd>HopLine<cr>', "Hop to a line" },
    d = { '<cmd>HopChar1<cr>', "Hop to a character" },
  }
}
local opts = { prefix = '<leader>' }
wk.register(mappings, opts)
