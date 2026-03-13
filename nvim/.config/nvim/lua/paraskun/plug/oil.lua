return {
  "stevearc/oil.nvim",

  dependencies = {
    { "nvim-mini/mini.icons" }
  },

  config = function ()
    require("oil").setup({
      view_options = {
        show_hidden = true,
      },

      keymaps = {
        ["h"] = { "actions.parent", mode = "n" },
        ["l"] = { "actions.select", mode = "n" },
      },
    })

    vim.keymap.set("n", "<leader>pe", "<CMD>Oil<CR>", {})
  end
}
