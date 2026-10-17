local map = vim.keymap.set

-- n = Normal, v = Visual, i - Insert
-- leader = space
-- C-w = Ctrl
-- M = Alt
--
-- NOTE: `desc` is what which-key and :map display. A trailing `-- comment`
-- does NOT show up anywhere, so every mapping here carries a `desc`.

map("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })

map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
map("n", "<leader>W", "<cmd>wa<cr>", { desc = "Save all files" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit window" })
map("n", "<leader>h", "<C-w>h", { desc = "Go to left split" })
map("n", "<leader>l", "<C-w>l", { desc = "Go to right split" })

map("n", "<M-j>", ":m .+1<CR>==", { silent = true, desc = "Move line down" })
map("n", "<M-k>", ":m .-2<CR>==", { silent = true, desc = "Move line up" })
map("v", "<M-j>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection down" })
map("v", "<M-k>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection up" })

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search Highlight" })
