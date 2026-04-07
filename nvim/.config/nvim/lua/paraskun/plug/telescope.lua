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
  {
    "ThePrimeagen/harpoon",

    dependecies = {
      "nvim-lua/plenary.nvim",
    },

    config = function()
      require("harpoon").setup({
        mark_branch = true,
        tabline = false,
      })

      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file, {})
      vim.keymap.set("n", "<leader>q", ui.toggle_quick_menu, {})
      vim.keymap.set("n", "<leader>j", ui.nav_prev, {})
      vim.keymap.set("n", "<leader>k", ui.nav_next, {})

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "harpoon",
        group = vim.api.nvim_create_augroup("Harpoon", { clear = true }),
        callback = function()
          vim.keymap.set("n", "s", function()
            local cur = vim.api.nvim_get_current_line()
            local cwd = vim.fn.getcwd() .. "/"

            vim.cmd("vs")
            vim.cmd("e " .. cwd .. cur)
          end, { buffer = true, noremap = true, silent = true })
        end
      })
    end
  },
}
