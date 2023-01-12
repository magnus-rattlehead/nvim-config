-- Default options
require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,    -- Disable setting background
    terminal_colors = false, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
    styles = {              -- Style to be applied to different syntax groups
      comments = "italic",    -- Value is any valid attr-list value `:help attr-list`
      conditionals = "NONE",
      constants = "NONE",
      functions = "NONE",
      keywords = "NONE",
      numbers = "NONE",
      operators = "NONE",
      strings = "italic",
      types = "NONE",
      variables = "bold",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = true,
      visual = true,
      search = true,
    },
    modules = {             -- List of various plugins and additional options
      -- ...
      cmp = true,
      dashboard = true,
      diagnostic = true,
      gitsigns = true,
      hop = true,
      lsp_saga = true,
      lsp_trouble = true,
      native_lsp = true,
      nvimtree = true,
      symbol_outline = true,
      telescope = true,
      treesitter = true,
      whichkey = true,
    },
  }
})

-- setup must be called before loading
vim.cmd("colorscheme carbonfox")
