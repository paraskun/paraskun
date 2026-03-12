return {
  "nvim-telescope/telescope.nvim",
  
  dependecies = { 
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },

  config = function()
    local telescope = require("telescope.builtin")

    require("telescope").setup{
      extensions = {
        file_browser = {
          theme = "ivy",
          hijack_netrw = true,
        },
      },
    }

    vim.keymap.set("n", "<leader>pf", function ()
      telescope.find_files({
        hidden = true
      })
    end, {})

    vim.keymap.set("n", "<leader>pg", telescope.live_grep, {})
    vim.keymap.set("n", "<leader>fg", function ()
      telescope.live_grep({
        search_dirs = { vim.fn.expand("%:p") }
      })
    end, {})
  end
}
