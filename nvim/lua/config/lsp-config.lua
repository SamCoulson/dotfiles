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

-- rust-analyzer config (the server itself is enabled by mason-lspconfig)
-- Use clippy instead of `cargo check` for flycheck diagnostics. rust-analyzer
-- saves the buffer before checking, so diagnostics come from cargo-clippy,
-- which ships with the rustup clippy component.
vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      check = {
        command = "clippy",
      },
    },
  },
})

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
    local opts = { buffer = ev.buf, silent = true, desc = "Toggle inlay hints" }

    -- Inlay hints on for any buffer that has an LSP client
    vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })

    vim.keymap.set("n", "<leader>ih", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
    end, opts)

    -- Telescope integration if available
    local ok, tb = pcall(require, "telescope.builtin")
    if ok then
      vim.keymap.set("n", "gd", tb.lsp_definitions, { buffer = ev.buf, silent = true, desc = "Go to definition" })
      vim.keymap.set("n", "gr", tb.lsp_references, { buffer = ev.buf, silent = true, desc = "References" })
      vim.keymap.set("n", "gi", tb.lsp_implementations, { buffer = ev.buf, silent = true, desc = "Go to implementation" })
      vim.keymap.set("n", "<leader>ds", tb.lsp_document_symbols,
        { buffer = ev.buf, silent = true, desc = "Document symbols" })
      vim.keymap.set("n", "<leader>fw", tb.lsp_dynamic_workspace_symbols,
        { buffer = ev.buf, silent = true, desc = "Workspace symbols" })
    else
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, silent = true, desc = "Go to definition" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, silent = true, desc = "References" })
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation,
        { buffer = ev.buf, silent = true, desc = "Go to implementation" })
    end

    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, silent = true, desc = "Hover docs" })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, silent = true, desc = "Rename symbol" })
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,
      { buffer = ev.buf, silent = true, desc = "Code action" })

    -- Neovim 0.11+ diagnostic navigation (replaces goto_prev/goto_next)
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.jump({ count = -1 })
    end, { buffer = ev.buf, silent = true, desc = "Previous diagnostic" })

    vim.keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = 1 })
    end, { buffer = ev.buf, silent = true, desc = "Next diagnostic" })

    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float,
      { buffer = ev.buf, silent = true, desc = "Show line diagnostics" })
  end,
})
