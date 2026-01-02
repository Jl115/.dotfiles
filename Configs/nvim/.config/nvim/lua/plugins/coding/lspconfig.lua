return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
  },
  --- `LazyVim.lsp.on_attach` is deprecated. Please use `Snacks.util.lsp.on` instead

  -- add tsserver and setup with typescript.nvim instead of lspconfig
}
