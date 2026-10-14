return {
  -- Mason lsp config allows automatic install and updates of lsp servers and bridges between Mason and nvim-lspconfig, this way we can ensure that out lsp servers are always installed
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "lua_ls",
      "stylua",
      "html",
      "clangd",
    },
    -- roslyn.nvim manages the C# server itself
    automatic_enable = { exclude = { "roslyn_ls", "roslyn" } },
  },
  dependencies = {
    {
      -- both of these must load before mason-lspconfig
      "mason-org/mason.nvim",
      opts = {
        -- the second registry provides the Roslyn language server package
        registries = {
          "github:mason-org/mason-registry",
          "github:Crashdummyy/mason-registry",
        },
        ui = {
          icons = {
            package_installed = "✔",
            package_pending = "",
            package_uninstalled = "✘",
          },
        },
      },
    },

    -- nvim-lspconfig tells Neovim how to talk to the lsp server
    -- See https://io/doc/user/lsp.html#lsp-config for key bindings
    -- these are a collection of commnuity driven configs for lsp servers
    -- this saves us from having to define a config for each lsp
    "neovim/nvim-lspconfig",
  },
}
