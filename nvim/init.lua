-- Core globals
vim.g.mapleader = " "
vim.g.maplocalleader = "//"

-- Load core config - control editor behaviour
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Bootstrap plugins

-- load the lazy.vim package manager (this is not LazyVim)
require("config.lazy")
require("config.lsp-config")
