return {
  "L3MON4D3/LuaSnip",
  -- dependencies = { "rafamadriz/friendly-snippets" }, -- Already in LazyVim core, but safe to keep

  -- Use the opts from LazyVim defaults
  config = function(_, opts)
    -- 1. Run the standard LazyVim setup first
    require("luasnip").setup(opts)

    -- 2. Load friendly-snippets (Community snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    -- 3. Load YOUR custom snippets
    -- Make sure this path matches your actual filename (check for typos like 'loadder' vs 'loader')
    require("config.helpers.luasnip-loadder").load_vscode_snippets()
  end,
}
