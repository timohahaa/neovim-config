require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "gopls",
    "pyright",
    "dockerls",
    "docker_compose_language_service",
    "rust_analyzer",
    -- JS/TS stuff
    "tsserver",
    "jsonls",
    "eslint",
    "html",
    "cssls",
    "volar",
    -- OTHER --
    "clangd",
  },
  automatic_installation = true,
})

capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Capabilities required for the visualstudio lsps (css, html, etc)
capabilities.textDocument.completion.completionItem.snippetSupport = true


local lspconfig = require("lspconfig")
local util = require("lspconfig/util")
-------------------------------------------------------------------------------------
-- server setuping
-------------------------------------------------------------------------------------
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
require('language-servers/golang')
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lspconfig.dockerls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lspconfig.docker_compose_language_service.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lspconfig.rust_analyzer.setup({
  -- filetypes = { "rs" },
  -- root_dir = util.root_pattern("Cargo.toml"),
  on_attach = on_attach,
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
lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
})


-- JS/TS stuff

lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lspconfig.jsonls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lspconfig.html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lspconfig.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lspconfig.eslint.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lspconfig.volar.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
