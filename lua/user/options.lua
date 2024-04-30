-- stylua: ignore start
-- NOTE: see `:help vim.opt`, and `:help option-list`

vim.g.have_nerd_font = true     -- Set to true if you have a Nerd Font installed and selected in the terminal

vim.opt.number = true           -- set numbered lines
vim.opt.numberwidth = 4         -- minimal number of columns to use for the line number {default 4}
vim.opt.relativenumber = false
vim.opt.signcolumn = 'yes'      -- always show the sign column, otherwise it would shift the text each time
vim.opt.list = true             --  `:help 'list'`
vim.opt.listchars = {           -- whitespace characters, see `:help 'listchars'` 
  tab = '» ',
  trail = '·',
  nbsp = '␣'
}
vim.opt.fillchars.eob = ' '     -- show empty lines at the end of a buffer as ` ` {default `~`}
vim.opt.inccommand = 'split'    -- Preview substitutions live, as you type!
vim.opt.cursorline = false      -- Show which line your cursor is on
vim.opt.scrolloff = 10          -- Min num screen lines to keep above/below cursor
vim.opt.showmode = false        -- don't show the mode, it's already in the status line

vim.opt.mouse = 'a'             -- allow the mouse to be used in neovim
vim.opt.mousemodel = 'extend'   -- no mouse right click

vim.opt.clipboard = 'unnamedplus'   -- allow nvim to access sys clipboard, remove to keep OS clipboard independent.

vim.opt.breakindent = true      -- enable break indent
vim.opt.linebreak = true

vim.opt.undofile = false        -- save undo history (off)
vim.opt.backup = false          -- creates a backup file
vim.opt.writebackup = false     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

vim.opt.ignorecase = true       -- ignore case in search pattern UNLESS \C or one or more capital letters in the search term
vim.opt.smartcase = true

vim.opt.updatetime = 300        -- faster completion (4000ms default)
vim.opt.timeoutlen = 800        -- time to wait for a mapped sequence to complete (in milliseconds)

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.cmdheight = 1           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = {         -- mostly just for cmp
  'menuone',
  'noselect'
}
vim.opt.conceallevel = 0        -- so that `` is visible in markdown files
vim.opt.fileencoding = 'utf-8'  -- the encoding written to a file
vim.opt.hlsearch = true         -- highlight all matches on previous search pattern
vim.opt.pumheight = 10          -- pop up menu height
vim.opt.showtabline = 1         -- always show tabs

vim.opt.smartindent = true      -- make indenting smarter again
vim.opt.splitbelow = true       -- force all horizontal splits to go below current window
vim.opt.splitright = true       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false        -- creates a swapfile

vim.opt.termguicolors = true      -- set term gui colors (most terminals support this)
vim.opt.guifont = 'monospace:h17' -- the font used in graphical neovim applications

vim.opt.expandtab = true        -- convert tabs to spaces
vim.opt.shiftwidth = 2          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2             -- insert 2 spaces for a tab

vim.opt.laststatus = 3          -- only the last window will always have a status line
vim.opt.showcmd = false         -- hide (partial) command in the last line of the screen (for performance)
vim.opt.ruler = false           -- hide the line and column number of the cursor position
vim.opt.wrap = false            -- display lines as one long line
vim.opt.scrolloff = 8           -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8       -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`

vim.opt.shortmess:append 'c'                    -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
vim.opt.whichwrap:append '<,>,[,],h,l'          -- keys allowed to move to the previous/next line when the beginning/end of line is reached
vim.opt.iskeyword:append '-'                    -- treats words with `-` as single words
vim.opt.formatoptions:remove { 'c', 'r', 'o' }  -- This is a sequence of letters which describes how automatic formatting is to be done
vim.opt.winbar = '%f'
-- stylua: ignore end
