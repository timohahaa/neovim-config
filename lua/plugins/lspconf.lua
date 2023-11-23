require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "gopls",
        "pyright",
        "dockerls",
        "docker_compose_language_service",
        "rust_analyzer",
    },
    automatic_installation = true,
})

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.lua_ls.setup({
    capabilities = capabilities,
})
lspconfig.gopls.setup({
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    capabilities = capabilities,
    settings = {
        gopls = {
            usePlaceholders = true,
            completeUnimported = true,
            analyses = {
                unusedparams = true,
            },
        },
    },
})
lspconfig.pyright.setup({
    capabilities = capabilities,
})
lspconfig.dockerls.setup({
    capabilities = capabilities,
})
lspconfig.docker_compose_language_service.setup({
    capabilities = capabilities,
})
lspconfig.rust_analyzer.setup({
    --    filetypes = { "rs" },
    --    root_dir = util.root_pattern("Cargo.toml"),
    capabilities = capabilities,
    settings = {
        rust_analyzer = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true,
            }
        },
    },
})
