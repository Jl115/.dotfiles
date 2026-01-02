return {
  "jl115/code-police.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = "BufReadPost",
  config = function()
    require("code-police").setup()
  end,
}
