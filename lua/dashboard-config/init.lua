local db = require('dashboard')
db.custom_center = {
  {icon = ' ',
  desc = 'Recently latest session ',
  shortcut = 'SPC S l',
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
  shortcut = 'SPC m d'},
}
