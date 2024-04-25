print 'Hello from orion304'

vim.opt.colorcolumn = '150'

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open Netrw Explorer' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('x', '<leader>p', '"_dP', { desc = '[P]aste without copying to register' })

vim.keymap.set('n', '<leader>y', '"+y', { desc = '[Y]ank to system register (clipboard)' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = '[Y]ank to system register (clipboard)' })
vim.keymap.set('n', '<leader>Y', '"+Y', { desc = '[Y]ank to system register (clipboard)' })

vim.keymap.set('n', '<leader>o', 'o<Esc>', { desc = 'Insert line after cursor, stay in normal mode' })
vim.keymap.set('n', '<leader>O', 'O<Esc>', { desc = 'Insert line before cursor, stay in normal mode' })

vim.keymap.set('i', '<C-c>', '<Esc>')

--vim.keymap.set("n", "<leader>/", ":noh<CR>")
vim.keymap.set('n', '<leader>m', ':set filetype=mason<CR>', { desc = 'Set Filetype to [M]ason' })

vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = '[B]uffer: [N]ext Buffer' })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = '[B]uffer: [P]revious Buffer' })
vim.keymap.set('n', '<leader>bl', ':b#<CR>', { desc = '[B]uffer: [L]ast Buffer' })
