--{{{ ASCII Greeting
-- =====================================================================
-- ==================== READ THIS BEFORE CONTINUING ====================
-- =====================================================================
-- ========                                    .-----.          ========
-- ========         .----------------------.   | === |          ========
-- ========         |.-""""""""""""""""""-.|   |-----|          ========
-- ========         ||                    ||   | === |          ========
-- ========         ||        NVIM        ||   |-----|          ========
-- ========         ||                    ||   | === |          ========
-- ========         ||                    ||   |-----|          ========
-- ========         ||:Tutor              ||   |:::::|          ========
-- ========         |'-..................-'|   |____o|          ========
-- ========         `"")----------------(""`   ___________      ========
-- ========        /::::::::::|  |::::::::::\  \ no mouse \     ========
-- ========       /:::========|  |==hjkl==:::\  \ required \    ========
-- ========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
-- ========                                                     ========
-- =====================================================================
-- =====================================================================
-- - https://learnxinyminutes.com/docs/lua/
-- - https://neovim.io/doc/user/lua-guide.html
-- - :Tutor
-- - :help
-- - :help lua-guide
-- - :help lazy.nvim-lazy.nvim-structuring-your-plugins
--}}}

vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Setting options {{{
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.mouse = 'a' -- useful for resizing splits for example!
vim.opt.showmode = false -- Don't show the mode, since it's already in the status line

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

vim.opt.breakindent = true -- Enable break indent
vim.opt.undofile = false -- Save undo history (off)

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes' -- Keep signcolumn on by default
vim.opt.updatetime = 250 -- Decrease update time

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

-- whitespace characters
vim.opt.list = true --  `:help 'list'`
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } --  `:help 'listchars'`

vim.opt.inccommand = 'split' -- Preview substitutions live, as you type!
vim.opt.cursorline = false -- Show which line your cursor is on
vim.opt.scrolloff = 10 -- Min num screen lines to keep above/below cursor

-- }}}

-- Basic Keymaps {{{
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- }}}

-- Key mapping for toggling folds
vim.api.nvim_set_keymap('n', '<space>', 'za', { noremap = true, silent = true })

-- Highlight settings for folded text
-- vim.api.nvim_set_hl(0, 'Folded', { ctermbg = 'NONE', ctermfg = 67, fg = 'NONE' })

-- Basic Autocommands {{{
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Autocommand for setting fold options
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'vim', 'txt', 'python', 'tex', 'rmd', 'lua' },
  callback = function()
    vim.opt_local.foldmethod = 'marker'
    vim.opt_local.foldmarker = '{{{,}}}'
  end,
  group = vim.api.nvim_create_augroup('FoldOptions', { clear = true }),
  desc = 'Set folding options for specific file types',
})

-- Setup autocommand to reapply highlight settings after any colorscheme is loaded
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    vim.api.nvim_set_hl(0, 'Folded', { ctermbg = 'NONE', ctermfg = 67 })
  end,
  group = vim.api.nvim_create_augroup('CustomHighlightSettings', { clear = true }),
  desc = 'Apply custom highlight settings after loading a colorscheme',
})

-- }}}

-- [[ Install `lazy.nvim` plugin manager, then configure and install plugins ]]
--
--  To check the current status of your plugins, run :Lazy
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run :Lazy update
--
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- NOTE: Plugins can be added with a link
  -- (or for a github repo: 'owner/repo' link).
  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  require 'user.plugins.vim_sleuth',
  require 'user.plugins.comment',
  require 'user.plugins.telescope',
  require 'user.plugins.nvim_lspconfig',
  require 'user.plugins.conform',
  require 'user.plugins.nvim_cmp',
  require 'user.plugins.tokyonight',
  require 'user.plugins.todo_comments', -- Highlight todo, notes, etc in comments
  require 'user.plugins.mini',
  require 'user.plugins.nvim_treesitter',
  -- require 'user.plugins.debug',
  -- require 'user.plugins.indent_line',
  -- require 'user.plugins.lint',
  -- require 'user.plugins.autopairs',
  require 'user.plugins.neo-tree',
  require 'user.plugins.gitsigns', -- adds gitsigns recommended keymaps
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
