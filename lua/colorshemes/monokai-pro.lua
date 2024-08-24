require("monokai-pro").setup({
  transparent_background = true,
  filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
  background_clear = {
    -- "float_win",
    "toggleterm",
    "telescope",
    -- "which-key",
    "renamer",
    "notify",
    "nvim-tree",
    -- "neo-tree",
    "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
  },              -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
})
