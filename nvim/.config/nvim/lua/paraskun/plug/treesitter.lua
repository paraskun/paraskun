return {
  "nvim-treesitter/nvim-treesitter",

  config = function()
    require("nvim-treesitter.config").setup {
      ensure_installed = {
        "c",
        "cpp",
        "go",
        "lua",
        "markdown",
        "markdown_inline",
        "latex",
        "cue",
      },
      auto_install = true,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }
  end
}
