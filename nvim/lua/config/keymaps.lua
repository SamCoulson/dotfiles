local map = vim.keymap.set

-- n = Normal, v = Visual, i - Insert
-- leader = space
-- C-w = Ctrl
-- M = Alt
map("i", "jk", "<Esc>", { noremap = true, silent = true })
map("n", "<leader>w", "<cmd>w<cr>") -- save
map("n", "<leader>wa", "<cmd>wa<cr>") -- save all
map("n", "<leader>q", "<cmd>q<cr>") -- quit
map("n", "<leader>h", "<C-w>h") -- move to left pane
map("n", "<leader>l", "<C-w>l") -- move to right pane

map("n", "<M-j>", ":m .+1<CR>==", { silent = true }) -- shift line down
map("n", "<M-k>", ":m .-2<CR>==", { silent = true }) -- shift line up
map("v", "<M-j>", ":m '>+1<CR>gv=gv", { silent = true }) -- shift selected block down
map("v", "<M-k>", ":m '<-2<CR>gv=gv", { silent = true }) -- shift selected block up
map("n", "<Esc>", "<cmd>nohlsearch<CR>") -- clear highglights on search
