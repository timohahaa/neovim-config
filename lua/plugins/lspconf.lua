require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {"lua_ls", "gopls", "pyright", "dockerls", "docker_compose_language_service"},
    automatic_installation = true,
})

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")
lspconfig.lua_ls.setup({})
lspconfig.gopls.setup({
    cmd = {"gopls"},
    filetypes = {"go", "gomod", "gowork", "gotmpl"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
            analyses = {
                unusedparams = true
            },
        },
    },
})
lspconfig.pyright.setup({})
lspconfig.dockerls.setup({})
lspconfig.docker_compose_language_service.setup({})

