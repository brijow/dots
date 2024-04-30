-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap comma as leader key
keymap('', ',', '<Nop>', opts)
vim.g.mapleader = ','

--Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- source vimrc
keymap('n', '<leader>so', ':source ~/.config/nvim/init.lua<CR>', opts)

-- window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- buffer navigation
keymap('n', 'gb', ':bnext<CR>', opts)
keymap('n', 'gB', ':bprevious<CR>', opts)

-- resize windows with control + arrow keys
keymap('n', '<C-Up>', ':resize -2<CR>', opts)
keymap('n', '<C-Down>', ':resize +2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- clear highlights
keymap('n', '<leader>h', '<cmd>nohlsearch<CR>', opts)

-- close buffers
-- keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- press jk fast to escape
keymap('i', 'jk', '<ESC>', opts)

-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- better paste
keymap('v', 'p', '"_dP', opts)

-- folds
keymap('n', '<space>', 'za', opts)

------------------------ plugin keymaps  ---------------------------

-- NvimTree
keymap('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- Git
-- keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap('n', '<leader>c<Space>', "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap('x', '<leader>c<Space>', '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- DAP
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
-- keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
-- keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
-- keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
-- keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Telescope
keymap('n', '<leader>tf', "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy({}))<cr>", opts)
keymap('n', '<leader>tg', "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({}))<cr>", opts)
keymap('n', '<leader>ts', "<cmd>lua require('telescope.builtin').grep_string(require('telescope.themes').get_ivy({}))<cr>", opts)
keymap('n', '<leader>th', "<cmd>lua require('telescope.builtin').help_tags(require('telescope.themes').get_ivy({}))<cr>", opts)
keymap('n', '<leader>tk', "<cmd>lua require('telescope.builtin').keymaps(require('telescope.themes').get_ivy({}))<cr>", opts)
keymap('n', '<leader>tr', '<cmd>Telescope lsp_references theme=ivy show_line=false trim_text=true<CR>', opts)
keymap('n', '<leader>tv', "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy({search_dirs = {'~/.config/nvim'}}))<cr>", opts)
keymap(
  'n',
  '<leader>tV',
  "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy({search_dirs = {'~/.config/nvim-brijow'}}))<cr>",
  opts
)
keymap('n', '<leader>k', [[<Cmd>lua require'brijow.telescope'.browse_notes()<CR>]], opts)
keymap('n', '<leader>tR', ':Telescope resume<CR>', opts)
keymap('n', '<leader>td', "<cmd>lua require('telescope').extensions.dir.live_grep(require('telescope.themes').get_ivy({}))<cr>", opts)

-- keymap("n", "<leader>tb", ":Telescope buffers<CR>", opts)
--keymap("n", "<leader>tc", "<cmd>lua require('telescope.builtin').quickfix(require('telescope.themes').get_ivy({}))<cr>", opts)
--keymap("n", "<leader>tt", "<cmd>lua require('telescope.builtin').treesitter(require('telescope.themes').get_ivy({}))<cr>", opts)
---- telescope keymap for lsp
--keymap("n", "<leader>tl", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols(require('telescope.themes').get_ivy({}))<cr>", opts)
---- telescope keymap for  buffers
--keymap("n", "<leader>tb", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_ivy({}))<cr>", opts)
---- telescope keymap for  git
--keymap("n", "<leader>tg", "<cmd>lua require('telescope.builtin').git_status(require('telescope.themes').get_ivy({}))<cr>", opts)
---- telescope keymap for command history
--keymap("n", "<leader>th", "<cmd>lua require('telescope.builtin').command_history(require('telescope.themes').get_ivy({}))<cr>", opts)
---- telescope keymap for oldfiles
--keymap("n", "<leader>to", "<cmd>lua require('telescope.builtin').oldfiles(require('telescope.themes').get_ivy({}))<cr>", opts)
---- telescope keymap for registers
--keymap("n", "<leader>tr", "<cmd>lua require('telescope.builtin').registers(require('telescope.themes').get_ivy({}))<cr>", opts)
---- telescope keymap for lsp code actions
--keymap("n", "<leader>ta", "<cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_ivy({}))<cr>", opts)
---- telescope keymap for lsp references
keymap(
  'n',
  '<leader>tr',
  "<cmd>lua require('telescope.builtin').lsp_references(require('telescope.themes').get_ivy({fname_width=80, show_line=false}))<cr>",
  opts
)
-- keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

---- telescope keymap for lsp document symbols
--keymap("n", "<leader>td", "<cmd>lua require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_ivy({}))<cr>", opts)
---- telescope keymap for lsp workspace symbols
--keymap("n", "<leader>tw", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols(require('telescope.themes').get_ivy({}))<cr>", opts)
---- telescope keymap for lsp document diagnostics
--keymap("n", "<leader>td", "<cmd>lua require('telescope.builtin').lsp_document_diagnostics(require('telescope.themes').get_ivy({}))<cr>", opts)
---- telescope keymap for lsp workspace diagnostics
--keymap("n", "<leader>tw", "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics(require('telescope.themes').get_ivy({}))<cr>", opts)
---- telescope keymap for neovim config
--keymap("n", "<leader>tv", "<cmd>lua require('telescope.builtin').find_files({search_dirs = {'~/.config/nvim'}})<cr>", opts)
---- telescope keymap for neovim config with ivy
--keymap("n", "<leader>tfw", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy({search_dirs = {'~/work'}}))<cr>", opts)
--keymap("n", "<leader>tgw", "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({search_dirs = {'~/work'}}))<cr>", opts)

-- Keymaps to user defined functions that wrap telescope functions (all defined in user/telescope.lua)

-- search for word under cursor
--keymap('n', '<leader>s', '*<C-R><C-W><CR>', opts)
-- search for word under cursor no <leader>s /<C-R>=expand("<cword>")<CR><CR>
--keymap('n', '<leader>s', '<C-R>=expand("<cword>")<CR><CR>', opts)

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

-- vim.cmd([[
--   imap <silent><script><expr> <C-j> copilot#Accept("\<CR>")
-- ]])

keymap('n', 'gD', '<cmd>tab split | lua vim.lsp.buf.definition()<CR>', opts)
keymap('n', 'gV', '<cmd>vsplit | lua vim.lsp.buf.definition()<CR>', opts)
keymap('n', '<leader>so', '<cmd>source $MYVIMRC<CR>', opts)
keymap('n', '<leader>vt', '<cmd>tabnew $MYVIMRC<CR>', opts)
keymap('n', 'S', 'diw"0Pb', opts)

keymap('v', '<leader>cc', ':OSCYankVisual<CR>', opts)

vim.cmd [[

augroup save_cursor_position
   autocmd!
   autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
  
]]

-- autocmd FileType vim,txt,python setlocal foldmethod=marker
-- autocmd FileType tex,rmd setlocal foldmethod=marker foldmarker={{{{,}}}}
-- nnoremap <space> za
-- hi Folded ctermbg=NONE ctermfg=67
