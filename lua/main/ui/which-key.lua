local wk = require('which-key')

wk.setup({
    triggers = {
        { "<leader>", mode = { "n", "v" } }
    }
});

-- Snacks Picker
wk.add({ "<leader>f", group = "Find" })
wk.add({ "<leader>ff", function() Snacks.picker.files() end, desc = "Find File" })
wk.add({ "<leader>fg", function() Snacks.picker.grep() end, desc = "Find Text" })
wk.add({ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Find Buffer" })
wk.add({ "<leader>fe", function() Snacks.picker.explorer() end, desc = "File Explorer" })
wk.add({ "<leader>fd", function() Snacks.picker.diagnostics_buffer() end, desc = "Find Diagnostics" })
wk.add({ "<leader>fi", function() Snacks.picker.lsp_references() end, desc = "Find References" })
wk.add({ "<leader>fp", function() Snacks.picker.projects() end, desc = "Find Projects" })

-- Terminal
wk.add({ "<leader>t", group = "Terminal" })
wk.add({ "<leader>tt", function() Snacks.terminal.toggle() end, desc = "Toggle Terminal" })

-- Window 
wk.add({ "<leader>w", group = "Window" })
wk.add({ "<leader>wv", "<cmd>vsplit<cr>", desc = "Split Vertically" })
wk.add({ "<leader>wh", "<cmd>split<cr>", desc = "Split Horizontally" })
wk.add({ "<leader>wx", "<cmd>q<cr>", desc = "Close Window" })

-- Alt
wk.add({ "<A>", group = "Window Managment" })
vim.api.nvim_set_keymap( --Left
    'n',
    '<A-Left>',
    ":wincmd h<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap( --Up
    'n',
    '<A-Up>',
    ":wincmd k<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap( --Right
    'n',
    '<A-Right>',
    ":wincmd l<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap( --Down
    'n',
    '<A-Down>',
    ":wincmd j<CR>",
    { noremap = true, silent = true }
)

-- Move
vim.api.nvim_set_keymap( --Left
    'n',
    '<A-S-Left>',
    ":vertical resize -10<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap( --Up
    'n',
    '<A-S-Up>',
    ":horizontal resize -10<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap( --Right
    'n',
    '<A-S-Right>',
    ":vertical resize +10<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap( --Down
    'n',
    '<A-S-Down>',
    ":horizontal resize +10<CR>",
    { noremap = true, silent = true }
)
