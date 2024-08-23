vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

require('colorshemes/catppuccin')
require('colorshemes/monet')
require('colorshemes/lackluster')
require('colorshemes/kanagawa')
require('colorshemes/gruvbox')
require('colorshemes/tokyonight')
require('colorshemes/everforest')
require('colorshemes/obscure')

--vim.cmd.colorscheme "catppuccin"
--vim.cmd.colorscheme "tokyonight" -- doesnt work with transarent
vim.cmd.colorscheme "monet"
--vim.cmd.colorscheme "obscure"
