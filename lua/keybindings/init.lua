vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap
map('n', '<C-h>', '<C-w>h', {noremap = true, silent = false})
map('n', '<C-j>', '<C-w>j', {noremap = true, silent = false})
map('n', '<C-k>', '<C-w>k', {noremap = true, silent = false})
map('n', '<C-l>', '<C-w>l', {noremap = true, silent = false})
map('i', 'jk', '<ESC>', {noremap = true, silent = false})
map('i', 'kj', '<ESC>', {noremap = true, silent = false})
map('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
map('n', '<leader>r', ':NvimTreeRefresh<CR>', {noremap = true, silent = true})
map('n', '<leader>n', ':NvimTreeFindFile<CR>', {noremap = true, silent = true})
map('v', '<', '<gv', {noremap = true, silent = false})
-- Move to previous/next
map('n', '<leader>,', ':BufferPrevious<CR>',{noremap = true, silent = false})
map('n', '<leader>.', ':BufferNext<CR>', {noremap = true, silent = false})
-- Re-order to previous/next
map('n', '<leader>H', ':BufferMovePrevious<CR>', {noremap = true, silent = false})
map('n', '<leader>L', ':BufferMoveNext<CR>', {noremap = true, silent = false})
-- Goto buffer in position...
map('n', '<leader>1', ':BufferGoto 1<CR>', {noremap = true, silent = false})
map('n', '<leader>2', ':BufferGoto 2<CR>', {noremap = true, silent = false})
map('n', '<leader>3', ':BufferGoto 3<CR>', {noremap = true, silent = false})
map('n', '<leader>4', ':BufferGoto 4<CR>', {noremap = true, silent = false})
map('n', '<leader>5', ':BufferGoto 5<CR>', {noremap = true, silent = false})
map('n', '<leader>6', ':BufferGoto 6<CR>', {noremap = true, silent = false})
map('n', '<leader>7', ':BufferGoto 7<CR>', {noremap = true, silent = false})
map('n', '<leader>8', ':BufferGoto 8<CR>', {noremap = true, silent = false})
map('n', '<leader>9', ':BufferGoto 9<CR>', {noremap = true, silent = false})
map('n', '<leader>0', ':BufferLast<CR>', {noremap = true, silent = false})
