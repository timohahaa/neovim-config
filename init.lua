local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -------------------------------
  -- LSP, autocompletion, etc. --
  -------------------------------
  {
    "williamboman/mason.nvim",
    lazy = false,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require("plugins/lspconf")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    config = function()
      require("plugins/autocomp")
    end,
  },
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "saadparwaiz1/cmp_luasnip",
  {
    "L3MON4D3/LuaSnip",
    lazy = false,
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  },
  {
    "windwp/nvim-autopairs",
    lazy = false,
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  --------------------------------
  -- treesitter and colorscheme --
  --------------------------------
  {
    "nvim-treesitter/nvim-treesitter", 
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("plugins/treesitter")
    end,
  },
  {
    --'tanvirtin/monokai.nvim',
    --'frenzyexists/aquarium-vim',
    --"neanias/everforest-nvim",
    --"rebelot/kanagawa.nvim",
    --"kvrohit/mellow.nvim",
    "sainnhe/sonokai",
    --"nightsense/carbonized"
    --"catppuccin/nvim", name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("plugins/colorscheme")
    end
  },
  -------------------------------------------------------------
  -- ui stuff: file explorer, lualine, tabs, highlights, etc --
  -------------------------------------------------------------
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {"nvim-tree/nvim-web-devicons",},
    config = function()
      require("plugins/nvimtree")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function() 
      require("plugins/lualine")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    lazy = false,
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("plugins/tabline")
    end,
  },
  -------------------------
  -- other usefull stuff --
  -------------------------
  {
    "lukas-reineke/indent-blankline.nvim"
  },
  {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      "BurntSushi/ripgrep",
      'nvim-telescope/telescope-fzf-native.nvim',
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
      require("gitsigns").setup()	
    end,
  },
})

require("options")
require("mappings")
