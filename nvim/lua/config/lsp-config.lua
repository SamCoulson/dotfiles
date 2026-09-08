-- lua-language-server config
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim", "require" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

-- Enable the server
vim.lsp.enable("lua_ls")

-- Diagnostics UI (global)
local severity = vim.diagnostic.severity

vim.diagnostic.config({
  signs = {
    text = {
      -- https://www.nerdfonts.com/cheat-sheet
      [severity.ERROR] = " ",
      [severity.WARN] = " ",
      [severity.HINT] = " 󰠠",
      [severity.INFO] = " ",
    },
  },
  virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- =========================
-- Universal LSP keymaps
-- =========================
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }

    -- Telescope integration if available
    local ok, tb = pcall(require, "telescope.builtin")
    if ok then
      vim.keymap.set("n", "gd", tb.lsp_definitions, opts)
      vim.keymap.set("n", "gr", tb.lsp_references, opts)
      vim.keymap.set("n", "gi", tb.lsp_implementations, opts)
      vim.keymap.set("n", "<leader>ds", tb.lsp_document_symbols, opts)
      vim.keymap.set("n", "<leader>ws", tb.lsp_dynamic_workspace_symbols, opts)
    else
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    end

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    -- Neovim 0.11+ diagnostic navigation (replaces goto_prev/goto_next)
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.jump({ count = -1 })
    end, opts)

    vim.keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = 1 })
    end, opts)

    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
  end,
})
