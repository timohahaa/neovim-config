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


-- autocomands
local fmtGroup = vim.api.nvim_create_augroup('fmtGroup', {clear = true})
vim.api.nvim_create_autocmd({"BufWritePre"}, {
	group = fmtGroup,
	callback = function()
		vim.lsp.buf.format({ async = true })
	end,
})

