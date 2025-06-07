return {
  {
    "catppuccin/nvim",

    lazy = false,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = os.getenv("FLAVOUR"),
        transparent_background = true,
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
