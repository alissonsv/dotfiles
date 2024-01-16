vim.g.mapleader = " "

-- move text using ALT
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv-gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv-gv")
vim.keymap.set("n", "<A-k>", "<Esc>:m .-2<CR>==")
vim.keymap.set("n", "<A-j>", "<Esc>:m .+1<CR>==")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set('n', '<C-Up>', ':resize -2<cr>')
vim.keymap.set('n', '<C-Down>', ':resize +2<cr>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<cr>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<cr>')

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set('', '<C-h>', '<C-w>h')
vim.keymap.set('', '<C-l>', '<C-w>l')

vim.keymap.set('', '<leader>n', ':bnext<cr>')
vim.keymap.set('', '<leader>p', ':bprevious<cr>')
vim.keymap.set('', '<leader>d', ':bdelete<cr>')

vim.keymap.set('n', '<leader>t', ':ToggleTerm<cr>')

vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
vim.keymap.set("n", "<C-e>", function() vim.diagnostic.open_float() end)
