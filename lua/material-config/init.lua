vim.g.material_style = "darker"
require("material").setup{
  high_visibility = {
    darker = true
  },
  lualine_style = "stealth"
}
vim.cmd 'colorscheme material'
