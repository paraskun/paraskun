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

      vim.cmd.colorscheme "catppuccin"
    end
  },
}
