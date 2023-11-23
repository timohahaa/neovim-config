local opt = vim.opt
local g = vim.g


opt.mouse = 'a'
opt.mousemoveevent = true
opt.encoding = 'utf-8'
opt.swapfile = false
opt.nu = true
opt.cursorline = true
opt.termguicolors = true
opt.ignorecase = true
opt.smartcase = true

opt.wrap = true
opt.expandtab = true
-- configure indentation
opt.tabstop = 4 --for everything except see lower
opt.smartindent = true
opt.shiftwidth = 4

opt.confirm = true

vim.cmd([[
augroup tabGroup
autocmd FileType lua, yaml setlocal shiftwidth=2 tabstop=2
augroup end
]])
--local tabGroup = vim.api.nvim_create_augroup('tabGroup', { clear = true })
--vim.api.nvim_create_autocmd({ "FileType yaml,lua" }, {
--	group = tabGroup,
--	command = "setlocal shiftwidth=2 tabstop=2"
--})



-- autocomands
local fmtGroup = vim.api.nvim_create_augroup('fmtGroup', { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = fmtGroup,
    callback = function()
        vim.lsp.buf.format({ async = true })
    end,
})
