local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings to magical LSP functions!
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  --  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  --    vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, bufopts)
  --    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  --    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>fr', function() vim.lsp.buf.format { async = true } end, bufopts)
end

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

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Capabilities required for the visualstudio lsps (css, html, etc)
capabilities.textDocument.completion.completionItem.snippetSupport = true

-------------------------------------------------------------------------------------
-- server setuping
-------------------------------------------------------------------------------------
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lspconfig.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
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
