return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = { event = "notify", find = "No information available" },
        opts = { skip = true },
      })

      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 10000,
    },
  },
  {
    "b0o/incline.nvim",
    dependencies = { "folke/tokyonight.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("tokyonight.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.dark3, guifg = colors.red },
            InclineNormalNC = { guibg = colors.dark3, guifg = colors.blue1 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = { cursorline = true },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+]" .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)

          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },

  --- animations
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },

  -- logo
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
       /$$   /$$ /$$$$$$  /$$$$$$   /$$$$$$        /$$$$$$$  /$$$$$$$$ /$$    /$$
      | $$  /$$/|_  $$_/ /$$__  $$ /$$__  $$      | $$__  $$| $$_____/| $$   | $$
      | $$ /$$/   | $$  | $$  \__/| $$  \ $$      | $$  \ $$| $$      | $$   | $$
      | $$$$$/    | $$  | $$ /$$$$| $$  | $$      | $$  | $$| $$$$$   |  $$ / $$/
      | $$  $$    | $$  | $$|_  $$| $$  | $$      | $$  | $$| $$__/    \  $$ $$/ 
      | $$\  $$   | $$  | $$  \ $$| $$  | $$      | $$  | $$| $$        \  $$$/  
      | $$ \  $$ /$$$$$$|  $$$$$$/|  $$$$$$/      | $$$$$$$/| $$$$$$$$   \  $/   
      |__/  \__/|______/ \______/  \______//$$$$$$|_______/ |________/    \_/    
                                          |______/                           
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
