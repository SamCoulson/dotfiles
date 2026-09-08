return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    })
    vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>")
    vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>")
    vim.keymap.set("n", "<leader>bd", ":bdelete<CR>")
    vim.keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>")
    vim.keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>")
    vim.keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>")
    vim.keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>")
    vim.keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>")
    vim.keymap.set("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>")
    vim.keymap.set("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>")
    vim.keymap.set("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>")
    vim.keymap.set("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>")
  end,
}
