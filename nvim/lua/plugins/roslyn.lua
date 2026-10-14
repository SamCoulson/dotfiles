-- C# language server (Roslyn) via roslyn.nvim; install the server with :MasonInstall roslyn
return {
  "seblyng/roslyn.nvim",
  ft = { "cs", "razor" },
  dependencies = { "mason-org/mason.nvim" },
  opts = {},
  config = function(_, opts)
    vim.lsp.config("roslyn", {
      settings = {
        ["csharp|inlay_hints"] = {
          csharp_enable_inlay_hints_for_implicit_object_creation = true,
          csharp_enable_inlay_hints_for_implicit_variable_types = true,
        },
        ["csharp|completion"] = {
          dotnet_show_completion_items_from_unimported_namespaces = true,
          dotnet_show_name_completion_suggestions = true,
        },
        ["csharp|code_lens"] = {
          dotnet_enable_references_code_lens = true,
        },
      },
    })
    require("roslyn").setup(opts)
  end,
}
