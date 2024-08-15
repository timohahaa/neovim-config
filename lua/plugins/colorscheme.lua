vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

require('colorshemes/catppuccin')
require('colorshemes/monet')
require('colorshemes/lackluster')
require('colorshemes/kanagawa')
require('colorshemes/gruvbox')

vim.cmd.colorscheme "catppuccin"
