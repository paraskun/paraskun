return {
  "hrsh7th/nvim-cmp",

  dependencies = {
    "hrsh7th/cmp-buffer",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip"
  },

  config = function()
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end
      },

      mapping = cmp.mapping.preset.insert({
        ["<A-j>"] = cmp.mapping.select_next_item(),
        ["<A-k>"] = cmp.mapping.select_prev_item(),
        ["<A-o>"] = cmp.mapping.confirm(),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }
      }, {
        { name = "buffer" }
      })
    })
  end
}
