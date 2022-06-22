local wk = require("which-key")
local toggle_float = function()
  local Terminal = require('toggleterm.terminal').Terminal
  local float = Terminal:new({ direction = "float" })
  return float:toggle()
end
local mappings = {
  q = { ":q<cr>", "Quit" },
  w = { ":w<cr>", "Save" },
  x = { ":bdelete<cr>", "Close" },
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
    name = "Barbar",
    h = { '<cmd>BufferPrevious<cr>', "Go to Previous Tab" },
    l = { '<cmd>BufferNext<cr>', "Go to Next Tab" },
    k = { '<cmd>BufferMovePrevious<cr>', "Move Tab to the Left" },
    j = { '<cmd>BufferMoveNext<cr>', "Move Tab to the Right" },
    ["1"] = { '<cmd>BufferGoto 1<cr>', "Switch to Tab 1" },
    ["2"] = { '<cmd>BufferGoto 2<cr>', "Switch to Tab 2" },
    ["3"] = { '<cmd>BufferGoto 3<cr>', "Switch to Tab 3" },
    ["4"] = { '<cmd>BufferGoto 4<cr>', "Switch to Tab 4" },
    ["5"] = { '<cmd>BufferGoto 5<cr>', "Switch to Tab 5" },
    ["6"] = { '<cmd>BufferGoto 6<cr>', "Switch to Tab 6" },
    ["7"] = { '<cmd>BufferGoto 7<cr>', "Switch to Tab 7" },
    ["8"] = { '<cmd>BufferGoto 8<cr>', "Switch to Tab 8" },
    ["9"] = { '<cmd>BufferGoto 9<cr>', "Switch to Tab 9" },
    ["0"] = { '<cmd>BufferLast<cr>', "Switch to Last Tab" },
    c = { '<cmd>BufferClose<cr>', "Close Current Tab" },
  },
  e = { ":NvimTreeToggle<cr>", "Toggle File Tree" },
  r = { ":NvimTreeRefresh<cr>", "Refresh File Tree" },
  n = { ":NvimTreeFindFile<cr>", "Find File in Tree" },
  t = {
    name = "Toggle Term",
    t = { ":ToggleTerm<cr>", "Split Terminal" },
    f = { toggle_float, "Floating Terminal" },
  },
}
local opts = { prefix = '<leader>' }
wk.register(mappings, opts)
