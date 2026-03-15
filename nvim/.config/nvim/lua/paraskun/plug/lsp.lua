return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "hrsh7th/cmp-nvim-lsp"
  },

  config = function()
    local caps = require("cmp_nvim_lsp").default_capabilities()

    vim.lsp.config("clangd", {
      capabilities = caps,
    })

    vim.lsp.config("gopls", {
      capabilities = caps,
    })

    vim.lsp.config("lua_ls", {
      capabilities = caps,
    })

    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {
      noremap = true,
      silent = true,
    })

    vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next, {})

    vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>',
      { noremap = true, silent = true })
  end
}
