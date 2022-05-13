require'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
  view = {
    width = 25,
    height = 25,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
  },
} -- END_DEFAULT_OPTS
