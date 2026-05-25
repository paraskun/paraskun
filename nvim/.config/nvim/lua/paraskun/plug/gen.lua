return {
  "David-Kunz/gen.nvim",

  config = function()
    local gen = require("gen")

    gen.setup({
      model = "gemma2:2b",
      display_mode = "float",
      quit_map = "q",
      accept_map = "<A-cr>"
    })

    gen.prompts["Fix"] = {
      prompt = "You are a precise, automated text editor. Correct all spelling, grammar, "
          .. "punctuation, and typos in the following text. Preserve the original language "
          .. "(Russian or English). If it is a mixed sentence, fix both naturally. Do not "
          .. "rewrite the stylistic tone unless it is broken. Output ONLY the corrected text "
          .. "without any explanations or markdown wrappers.\n\nText:\n$text",
      replace = false,
    }

    vim.keymap.set({ "n", "v" }, "<leader>sp", ":Gen Fix<CR>", {})
  end
}
