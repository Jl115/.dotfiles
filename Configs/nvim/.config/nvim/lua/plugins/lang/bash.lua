return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- The LSP server is typically named 'bashls', not 'shfmt'
      bashls = {
        settings = {
          bashIde = {
            shfmt = {
              -- We explicitly tell it NOT to ignore the config file
              ignoreEditorconfig = false,
              -- IMPORTANT: We removed "indent = 2" here.
              -- Leaving this empty allows shfmt to look for .editorconfig
            },
          },
        },
      },
    },
  },
}
