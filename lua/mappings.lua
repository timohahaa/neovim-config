local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- autocomands
-- vim.api.nvim_create_autocmd({"BufWritePre"}, {
--     pattern = {"*.go"},
--     command = ,
-- })

-- general
--vim.keymap.set('n', '<space>fr', function()
--        vim.lsp.buf.format { async = true }
--      end, opts)

map("n", "<leader>nh", ":nohl<CR>", opts)
map("n", "<leader>lr", ":LspRestart<CR>", opts)

---- plugin specific mappings

-- nvim-tree
map("n", "<leader>t", ":NvimTreeFocus<CR>", opts)
map("n", "<leader>T", ":NvimTreeClose<CR>", opts)

-- bufferline
map("n", "b1", ":BufferLineGoToBuffer 1<CR>", opts)
map("n", "b2", ":BufferLineGoToBuffer 2<CR>", opts)
map("n", "b3", ":BufferLineGoToBuffer 3<CR>", opts)
map("n", "b4", ":BufferLineGoToBuffer 4<CR>", opts)
map("n", "b5", ":BufferLineGoToBuffer 5<CR>", opts)
map("n", "b6", ":BufferLineGoToBuffer 6<CR>", opts)
map("n", "b7", ":BufferLineGoToBuffer 7<CR>", opts)
map("n", "b8", ":BufferLineGoToBuffer 8<CR>", opts)
map("n", "b9", ":BufferLineGoToBuffer 9<CR>", opts)
map("n", "<A-n>", ":BufferLineCycleNext<CR>", opts)
map("n", "<A-p>", ":BufferLineCyclePrev<CR>", opts)
map("n", "<A-x>", "::bp<bar>sp<bar>bn<bar>bd<CR>", opts)

-- telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
