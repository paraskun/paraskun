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

    vim.keymap.set("n", "<leader>pf", telescope.find_files, {})
    vim.keymap.set("n", "<leader>pg", telescope.live_grep, {})
  end
}
