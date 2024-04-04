vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })


-- EVERFOREST
--require("everforest").setup({
--    background = "hard",
--    transparent_background_level = 2,
--    --sign_column_background = "grey",
--    --ui_contrast = "high",
--    diagnostic_line_highlight = true,
--})
----vim.cmd([[:set background=light]])
--require("everforest").load()

-- MELLOW
--vim.g.mellow_transparent = true
--vim.cmd([[colorscheme mellow]])

-- SONOKAI
--vim.g.sonokai_style = "default"
--vim.g.sonokai_transparent_background = 1
--vim.g.sonokai_better_performance = 1
--vim.cmd([[colorscheme sonokai]])

-- KANAGAWA
--require('kanagawa').setup({
--    --transparent = true,
--    theme = "dragon",
--    transparent = true,
--})
--vim.cmd([[colorscheme kanagawa]])

-- DRACULA
--require('dracula').setup({
--    transparent = "full",
--    soft = true,
--})

--MONET
--require("monet").setup {
--    transparent_background = true,
--    semantic_tokens = true,
--    highlight_overrides = {},
--    color_overrides = {},
--    styles = {
--        strings = {},
--    },
--}
--vim.cmd([[colorscheme monet]])

-- CATPPUCCIN
require("catppuccin").setup({
  flavour = "mocha",   -- latte, frappe, macchiato, mocha
  transparent_background = true,
  styles = {
    comments = { "italic" },
    conditionals = {},
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
