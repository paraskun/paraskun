return {
  {
    "catppuccin/nvim",

    lazy = false,
    name = "catppuccin",

    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false,
        no_italic = true,

        integrations = {
          cmp = true,
          treesitter = true,
        },
      })

      -- vim.cmd.colorscheme("catppuccin")
    end
  },
  {
    "folke/tokyonight.nvim",

    lazy = false,
    priority = 1000,

    config = function()
      require("tokyonight").setup({})

      -- vim.cmd.colorscheme("tokyonight-night")
    end
  },
  {
    "projekt0n/github-nvim-theme",

    config = function()
      require("github-theme").setup({})

      -- vim.cmd.colorscheme("github_dark_default")
    end
  },
  {
    "rebelot/kanagawa.nvim",

    config = function()
      require("kanagawa").setup({})

      vim.cmd.colorscheme("kanagawa")
    end
  }
}
