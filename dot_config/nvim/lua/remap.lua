-- clear highlight
vim.keymap.set('n', '<leader>h', '<cmd>nohlsearch<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

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

-- file browser
vim.api.nvim_set_keymap(
  'n',
  '<leader>e',
  ':Telescope file_browser path=%:p:h select_buffer=true<CR>',
  { noremap = true, desc = 'Telescope File Browser', silent = true }
)

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
