-- clear highlight
vim.keymap.set('n', '<leader>h', '<cmd>nohlsearch<CR>')

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

--resize
vim.keymap.set('n', '+', '<cmd>vertical resize +5<cr>', { desc = 'Increase window size' })
vim.keymap.set('n', '-', '<cmd>vertical resize -5<cr>', { desc = 'Decrease window size' })

-- buffers
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<cr>')
vim.keymap.set('n', '<leader>bb', '<cmd>bprev<cr>')
vim.keymap.set('n', '<leader>c', '<cmd>bp | sp | bn | bd<cr>', { desc = 'Close current buffer '})

-- debug
vim.keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end, { desc = 'Set breakpoint'})
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
-- F17 = <S-F5>
vim.keymap.set('n', '<F17>', function() require('dap').disconnect() require('dap').close() end)

vim.keymap.set('n', '<leader>ldi', '<cmd>lua vim.diagnostic.open_float()<cr>', { desc = 'Open D[i]agnostic'})
vim.keymap.set('n', '<leader>ldn', '<cmd>lua vim.diagnostic.goto_next()<cr>', { desc = 'Go to [N]ext'})
vim.keymap.set('n', '<leader>ldp', '<cmd>lua vim.diagnostic.goto_prev()<cr>', { desc = 'Go to [P]rev'})

-- file browser
-- vim.api.nvim_set_keymap(
--   'n',
--   '<leader>e',
--   ':Telescope file_browser<CR>',
--   { noremap = true, desc = 'Telescope File Browser', silent = true }
-- )

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
