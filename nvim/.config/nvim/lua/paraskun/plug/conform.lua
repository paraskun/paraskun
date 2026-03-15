return {
  "stevearc/conform.nvim",

  config = function ()
    require("conform").setup({
      formatters_by_ft = {
        markdown = { "prettier" },
      },

      default_format_opts = {
        lsp_format = "fallback",
      },
    })

    vim.keymap.set("n", "<leader>ff", function ()
      require("conform").format({ lsp_fallback = true })
    end, {})
  end
}
