-- which-key shows a popup listing the keys available under a prefix (space,
-- g, ...), so you don't have to memorise them.
--
-- Labels come from the `desc` field passed to `vim.keymap.set` - NOT from Lua
-- comments. Trailing `-- comments` are invisible to which-key and :map.
--
-- `group` entries below name prefixes that are not mappings themselves, so the
-- popup reads "Find" / "Code" instead of showing bare keys.
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "classic",
      spec = {
        -- Prefixes that exist only because of longer mappings. which-key
        -- otherwise labels them "+1 keymap" or borrows the mapping's own desc.
        { "<leader>b",  group = "Buffer" },
        { "<leader>c",  group = "Code" },
        { "<leader>d",  group = "Document" },
        { "<leader>f",  group = "Find" },
        { "<leader>g",  group = "Format" },
        { "<leader>i",  group = "Inlay hints" },
        { "<leader>r",  group = "Rename" },
        -- No `<leader>w` group: it is now a real mapping, so which-key should
        -- show "Save file" rather than turning it into a group.
      },
    },
  },
}
