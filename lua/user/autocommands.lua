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

-- Set fold options
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'vim', 'txt', 'python', 'tex', 'rmd', 'lua' },
  callback = function()
    vim.opt_local.foldmethod = 'marker'
    vim.opt_local.foldmarker = '{{{,}}}'
  end,
  group = vim.api.nvim_create_augroup('FoldOptions', { clear = true }),
  desc = 'Set folding options for specific file types',
})

-- Reapply highlight overrides after any colorscheme is loaded
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    vim.api.nvim_set_hl(0, 'Folded', { ctermbg = 'NONE', ctermfg = 67 })
    -- hi String ctermfg=65
    -- hi TabLine ctermbg=236 guibg=#303030
    -- hi TabLineFill ctermfg=236 ctermbg=NONE guifg=#303030
    -- hi StatusLine ctermfg=236 ctermbg=255
    -- hi StatusLineNC ctermfg=236 ctermbg=255
    -- hi Normal guibg=NONE ctermbg=NONE
    -- hi Pmenu ctermbg=238
    -- hi Visual guibg=#343434
    -- hi WildMenu ctermbg=23
    -- hi Statement ctermfg=71
    -- hi Underlined ctermbg=23
    -- hi DiffAdd ctermbg=23
    -- hi DiffChange ctermbg=101
    --
    -- " git diffs: from https://stackoverflow.com/a/43937957/8196202
    -- hi diffAdded cterm=bold ctermfg=DarkGreen
    -- hi diffRemoved cterm=bold ctermfg=DarkRed
    --
    -- hi diffFile cterm=NONE ctermfg=DarkBlue
    -- hi gitcommitDiff cterm=NONE ctermfg=DarkBlue
    -- hi diffIndexLine cterm=NONE ctermfg=DarkBlue
    -- hi diffLine cterm=NONE ctermfg=DarkBlue
    -- set nocursorline
  end,
  group = vim.api.nvim_create_augroup('CustomHighlightSettings', { clear = true }),
  desc = 'Apply custom highlight settings after loading a colorscheme',
})
