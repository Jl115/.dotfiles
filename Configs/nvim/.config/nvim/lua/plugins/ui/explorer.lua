return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    explorer = {
      -- your explorer configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
          exclude = { "node_modules", ".DS_Store" },
          follow_file = true,
          auto_close = false,
          focus = "list",
          layout = {
            preset = "sidebar",
            preview = true,
          },
        },
      },
    },
  },
}
