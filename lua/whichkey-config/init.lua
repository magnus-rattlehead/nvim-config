local wk = require("which-key")
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
    N = { '<cmd>Lspsaga diagnostic_jump_prev<cr>', "Go To Previous Diagnostic" }
  },
  b = {
    name = "Barbar",
    [","] = { '<cmd>BufferPrevious<cr>', "Previous Tab" },
    ["."] = { '<cmd>BufferNext<cr>', "Next Tab" },
    ["<"] = { '<cmd>BufferMovePrevious<cr>', "Move Tab Left" },
    [">"] = { '<cmd>BufferMoveNext<cr>', "Move Tab Right" },
    ["1"] = { '<cmd>BufferGoto 1<cr>', "Tab 1" },
    ["2"] = { '<cmd>BufferGoto 2<cr>', "Tab 2" },
    ["3"] = { '<cmd>BufferGoto 3<cr>', "Tab 3" },
    ["4"] = { '<cmd>BufferGoto 4<cr>', "Tab 4" },
    ["5"] = { '<cmd>BufferGoto 5<cr>', "Tab 5" },
    ["6"] = { '<cmd>BufferGoto 6<cr>', "Tab 6" },
    ["7"] = { '<cmd>BufferGoto 7<cr>', "Tab 7" },
    ["8"] = { '<cmd>BufferGoto 8<cr>', "Tab 8" },
    ["9"] = { '<cmd>BufferGoto 9<cr>', "Tab 9" },
    ["0"] = { '<cmd>BufferLast<cr>', "Last Tab" },
    c = { '<cmd>BufferClose<cr>', "Close Tab" },
  },
  e = { ":NvimTreeToggle<cr>", "Toggle File Tree" },
  r = { ":NvimTreeRefresh<cr>", "Refresh File Tree" },
  n = { ":NvimTreeFindFile<cr>", "Find File in Tree" },
}
local opts = { prefix = '<leader>' }
wk.register(mappings, opts)
