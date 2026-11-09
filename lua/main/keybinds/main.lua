local ls = require("luasnip");

-- Code --
-- Luasnip
vim.api.nvim_set_keymap(
    'i',
    '<C-k>',
    '<Esc>:ADLuasnipJumpF<CR>',
    { noremap = false, silent = true }
)

vim.api.nvim_set_keymap(
    'i',
    '<C-j>',
    '<Esc>:ADLuasnipJumpB<CR>',
    { noremap = false, silent = true }
)
