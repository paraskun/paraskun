return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "hrsh7th/cmp-nvim-lsp"
  },

  config = function()
    local caps = require("cmp_nvim_lsp").default_capabilities()

    require("lspconfig").clangd.setup({
      capabilities = caps
    })

    require("lspconfig").gopls.setup({
      capabilities = caps
    })

    require("lspconfig").lua_ls.setup({
      capabilities = caps
    })

    vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format)
    vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next, {})
    vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
  end
}
