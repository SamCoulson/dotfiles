return {
  -- The nvim-treesitter plugin provides, a way to install parsers for many different file types. Parsers provide syntax highlighting an indenting
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- keep parsers up-to-date
  lazy = false,       -- only load when file is opened
  config = function()
    local treesitter = require("nvim-treesitter.config")
    treesitter.setup({
      ensure_installed = {
        "lua",
        "c_sharp",
        "c",
        "cpp",
        "rust",
        "vimdoc",
        "bash",
        "json",
        "yaml",
        "toml",
        "markdown",
        "markdown_inline",
      },
      install_dir = vim.fn.stdpath("data") .. "/site",
      sync_install = false,
      highlight = { enable = true },
    })

    --  treesitter.install({ "lua", "vim", "vimdoc", "bash", "json", "yaml", "toml", "markdown", "markdown_inline", "c_sharp", "rust" })
  end,
}
