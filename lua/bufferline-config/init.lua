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
    separator_style = { '', '' },
    always_show_bufferline = false,
    groups = {
      items = {
        require("bufferline.groups").builtin.pinned:with({ icon = "" }),
      }
    },
  }
}
