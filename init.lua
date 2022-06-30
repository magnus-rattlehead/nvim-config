-- vim options
vim.o.hidden = true
vim.o.pumheight = 20
vim.o.cmdheight = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.opt.termguicolors = true
vim.o.conceallevel = 0
vim.o.showtabline = 2
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 500
vim.o.timeoutlen = 100
vim.o.clipboard = "unnamedplus"
vim.o.ignorecase = true
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5
vim.o.mouse = a
vim.wo.wrap = true
vim.wo.number = true
vim.o.cursorline = true
vim.wo.signcolumn = "yes"
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true
vim.bo.textwidth = 80
vim.opt.listchars = {
  eol = '⤶',
  trail = '✚',
  extends = '◀',
  precedes = '▶',
}
vim.opt.list = true
vim.cmd [[
filetype plugin indent on
]]
-- external plugins
require('plugins')
require('keybindings')
require('treesitter-config')
require('nvim-tree-config')
require('bufferline-config')
require('lualine-config')
require('autopairs-config')
require('whichkey-config')
require('cmp-config')
require('indent-blankline-config')
require('colorizer-config')
require('null-ls-config')
require('comment-config')
require('telescope-config')
require('toggleterm-config')
require('gitsigns-config')
require('knap-config')
require('nvim-scrollview-config')
require('material-config')
require('trouble-config')
require('hop-config')
require('spellsitter-config')
require('nvim-cursorline-config')
-- require('github-copilot')
require('nvim-dap-config')
require('dashboard-config')
