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
  ------------- LSP -------------
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

  -------------------------------
  ------- autocompletion --------
  -------------------------------
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    config = function()
      require("plugins/autocomp")
    end,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "hrsh7th/cmp-buffer",
  },
  {
    "hrsh7th/cmp-path",
  },
  {
    "saadparwaiz1/cmp_luasnip",
  },
  {
    "L3MON4D3/LuaSnip",
    lazy = false,
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode") --.lazy_load()
    end
  },
  {
    "windwp/nvim-autopairs",
    lazy = false,
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require("nvim-ts-autotag").setup({})
    end,
    lazy = false,
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
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 100000,
    config = function()
      require("plugins/colorscheme")
    end
  },
  'slugbyte/lackluster.nvim',
  "neanias/everforest-nvim",
  "rebelot/kanagawa.nvim",
  "fynnfluegge/monet.nvim",
  'ellisonleao/gruvbox.nvim',
  "folke/tokyonight.nvim",
  "killitar/obscure.nvim",
  "sainnhe/sonokai",
  "vague2k/vague.nvim",
  "scottmckendry/cyberdream.nvim",
  { "rose-pine/neovim", name = "rose-pine" },
  "EdenEast/nightfox.nvim",
  'aliqyan-21/darkvoid.nvim',
  "0xstepit/flow.nvim",
  'projekt0n/github-nvim-theme',
  {
    url = "https://codeberg.org/jthvai/lavender.nvim",
    branch = "stable", -- versioned tags + docs updates from main
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.lavender = {
        transparent = {
          background = true, -- do not render the main background
          float      = true, -- do not render the background in floating windows
          popup      = true, -- do not render the background in popup menus
          sidebar    = true, -- do not render the background in sidebars
        },
      }
    end
  },
  {
    'RRethy/base16-nvim',
    --config = function()
    --  require('base16-colorscheme').setup({
    --    base00 = 'NONE',
    --    base01 = '#2c313c',
    --    base02 = '#3e4451',
    --    base03 = '#6c7891',
    --    base04 = '#565c64',
    --    base05 = '#00d3dd',
    --    base06 = '#FFFFFF',
    --    base07 = '#FF0000',
    --    base08 = '#fdfdfd',
    --    base09 = '#c9184a',
    --    base0A = '#6ae4b9',
    --    base0B = '#669bbc',
    --    base0C = '#ff5f5f',
    --    base0D = '#feacd0',
    --    base0E = '#9d4edd',
    --    base0F = '#dfdfdf',
    --  })
    --end
  },
  -------------------------------------------------------------
  -- ui stuff: file explorer, lualine, tabs, highlights, etc --
  -------------------------------------------------------------
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons", },
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
      require("plugins/bufferline")
    end,
  },

  -------------------------
  -- other usefull stuff --
  -------------------------
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    config = function()
      require('plugins/blankline')
    end,
  },
  {
    'brenoprata10/nvim-highlight-colors',
    lazy = false,
    config = function()
      require('nvim-highlight-colors').setup({})
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
      require("gitsigns").setup({})
    end,
  },
  {
    'wfxr/protobuf.vim',
  },
  {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      "BurntSushi/ripgrep",
      'nvim-telescope/telescope-fzf-native.nvim',
    },
    config = function()
      require('plugins/telescope')
    end
  },
})
