return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "hrsh7th/cmp-nvim-lsp"
    },

    config = function()
      local caps = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("*", { capabilities = caps })

      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gs", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>gi", vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>ga', vim.lsp.buf.code_action, {})

      vim.keymap.set("n", "<leader>n", function()
        vim.diagnostic.jump({ count = 1, float = true })
      end, {})

      vim.keymap.set("n", "<leader>e", function()
        vim.diagnostic.open_float({})
      end, {})
    end
  },
  {
    "williamboman/mason.nvim",

    dependencies = {
      "williamboman/mason-lspconfig.nvim"
    },

    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          "gopls",
          "zls",
          "lua_ls",
          "pylsp",
          "tinymist",
        },

        handlers = {
          function(name)
            vim.lsp.enable(name)
          end
        }
      })
    end
  },
  {
    "jjo/vim-cue",
  },
}
