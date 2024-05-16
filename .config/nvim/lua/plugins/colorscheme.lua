return {
  -- "craftzdog/solarized-osaka.nvim",
  -- lazy = true,
  -- priority = 1000,
  -- opts = function()
  --   return {
  --     transparent = true,
  --   }
  -- end,
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   opts = function()
  --     return {
  --       transparent_background = true,
  --     }
  --   end,
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     style = "moon",
  --     transparent = true,
  --   },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  }, -- }, -- },
}
