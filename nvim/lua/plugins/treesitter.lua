return {
  "nvim-treesitter/nvim-treesitter",

  -- Explicitly use the new implementation for Neovim 0.12+
  branch = "main",

  -- nvim-treesitter does not support lazy loading
  lazy = false,

  build = ":TSUpdate",

  config = function()
    local treesitter = require("nvim-treesitter")

    treesitter.setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    treesitter.install({
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
    })

    -- Highlight files for which we have an installed parser
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(event)
        local filetype = vim.bo[event.buf].filetype
        local lang = vim.treesitter.language.get_lang(filetype)

        if not lang then
          return
        end

        if vim.tbl_contains(treesitter.get_installed("parsers"), lang) then
          vim.treesitter.start(event.buf, lang)
        end
      end,
    })
  end,
}
