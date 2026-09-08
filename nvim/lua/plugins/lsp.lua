return {
  {
    "hrsh7th/cmp-nvim-lsp", -- this allows the completion engine to use completions in lsp servers, see lsp-config.lua
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local capabilities = cmp_nvim_lsp.default_capabilities()

      vim.lsp.config("*", {
        capabilities = capabilities,
      })
    end,
  },
  {
    "folke/lazydev.nvim",
    opts = {
      enabled = function()
        return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
      end,
    },
  },
}
