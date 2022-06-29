require("bufferline").setup{
  options = {
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = function ()
          return vim.fn.getcwd()
        end,
        highlight = "Directory",
        text_align = "left"
      }
    },
    separator_style = "slant",
    always_show_bufferline = false,
  }
}
