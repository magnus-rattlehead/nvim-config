local db = require('dashboard')
db.preview_command = 'cat | lolcat -F 0.3'
db.preview_file_path = '~/.config/nvim/external/header.cat'
db.preview_file_width = 65
db.preview_file_height = 15
db.custom_center = {
  {icon = ' ',
  desc = 'Recently latest session ',
  shortcut = 'SPC s l',
  action ='lua require("persistence").load({ last = true })'},
  {icon = ' ',
  desc = 'Find  File ',
  action = 'Telescope find_files find_command=rg,--hidden,--files',
  shortcut = 'SPC f f'},
  {icon = ' ',
  desc = 'Find  word ',
  action = 'Telescope live_grep',
  shortcut = 'SPC f w'},
  {icon = '▼ ',
  desc = 'Update Plugins ',
  action = 'PackerSync',
  shortcut = 'SPC d'},
}
