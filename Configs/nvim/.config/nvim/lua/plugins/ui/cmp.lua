return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  dependencies = { "L3MON4D3/LuaSnip" },

  opts = function(_, opts)
    return {
      snippets = {
        preset = "luasnip",
      },
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
      },
      completion = {
        accept = { auto_brackets = { enabled = true } },
        menu = { draw = { treesitter = { "lsp" } } },
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
        ghost_text = { enabled = vim.g.ai_cmp },
      },
      sources = {
        default = { "snippets", "lsp", "path", "buffer" },
      },
      cmdline = {
        enabled = true,
      },
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<C-y>"] = { "select_and_accept" },
      },
    }
  end,
}
