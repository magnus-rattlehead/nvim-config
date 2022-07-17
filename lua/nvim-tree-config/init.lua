require 'nvim-tree'.setup {
  update_cwd = true,
  view = {
    hide_root_folder = true,
    preserve_window_proportions = true,
    mappings = {
      list = {
        -- user mappings go here
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    indent_markers = {
      enable = true,
    }
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
}
