return {
  {
    "princejoogie/dir-telescope.nvim",

    dependecies = {
      "nvim-telescope/telescope.nvim",
    },

    config = function()
      require("dir-telescope").setup({
        hidden = true,
        no_ignore = false,
        show_preview = true,
        follow_symlinks = false,
      })

      local telescope = require("telescope")

      telescope.load_extension("dir")

      vim.keymap.set("n", "<leader>dg", telescope.extensions.dir.live_grep, {})
      vim.keymap.set("n", "<leader>df", telescope.extensions.dir.find_files, {})
    end
  },
  {
    "nvim-telescope/telescope.nvim",

    dependecies = {
      "nvim-lua/plenary.nvim",
    },

    config = function()
      require("telescope").setup({})

      local telescope = require("telescope.builtin")

      vim.keymap.set("n", "<leader>pf", function()
        telescope.find_files({
          hidden = true
        })
      end, {})

      vim.keymap.set("n", "<leader>pg", telescope.live_grep, {})
      vim.keymap.set("n", "<leader>fg", function()
        telescope.live_grep({
          search_dirs = { vim.fn.expand("%:p") }
        })
      end, {})
    end
  },
}
