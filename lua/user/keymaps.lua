--  See `:help vim.keymap.set()`
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>E', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- window navigation, see `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- buffer navigation
vim.keymap.set('n', 'gb', ':bnext<CR>')
vim.keymap.set('n', 'gB', ':bprevious<CR>')

-- Key mapping for toggling folds
vim.api.nvim_set_keymap('n', '<space>', 'za', { noremap = true, silent = true })
-- vim.api.nvim_set_hl(0, 'Folded', { ctermbg = 'NONE', ctermfg = 67, fg = 'NONE' })

-- source vimrc
-- vim.keymap.set('n', '<leader>so', ':source ~/.config/nvim/init.lua<CR>')

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- better paste
-- keymap('v', 'p', '"_dP')

vim.cmd [[
nnoremap <silent> <leader>ss
    \ :let _p = getpos(".") <Bar>
    \  let _s = (@/ != '') ? @/ : '' <Bar>
    \  %s/\s\+$//e <Bar>
    \  let @/ = _s <Bar>
    \  nohlsearch <Bar>
    \  unlet _s <Bar>
    \  call setpos('.', _p) <Bar>
    \  unlet _p <CR>
]]

-- vim.keymap.set('v', '<leader>cc', ':OSCYankVisual<CR>')
-- vim.keymap.set('n', 'S', 'diw"0Pb')

-- vim.cmd [[
-- augroup save_cursor_position
--    autocmd!
--    autocmd BufReadPost * call setpos(".", getpos("'\""))
-- augroup END
-- ]]
