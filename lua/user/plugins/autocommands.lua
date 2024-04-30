vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'qf', 'help', 'man', 'lspinfo', 'spectre_panel' },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]]
  end,
})

vim.cmd [[
function! MyHighlights() abort
    " String: for vim docstrings in the vim-modest colorscheme
    hi String ctermfg=65
    hi TabLine ctermbg=236 guibg=#303030
    hi TabLineFill ctermfg=236 ctermbg=NONE guifg=#303030
    hi StatusLine ctermfg=236 ctermbg=255
    hi StatusLineNC ctermfg=236 ctermbg=255
    hi Normal guibg=NONE ctermbg=NONE
    hi Pmenu ctermbg=238
    hi Visual guibg=#343434
    hi WildMenu ctermbg=23
    hi Statement ctermfg=71
    hi Underlined ctermbg=23
    hi DiffAdd ctermbg=23
    hi DiffChange ctermbg=101

    " git diffs: from https://stackoverflow.com/a/43937957/8196202
    hi diffAdded cterm=bold ctermfg=DarkGreen
    hi diffRemoved cterm=bold ctermfg=DarkRed

    hi diffFile cterm=NONE ctermfg=DarkBlue
    hi gitcommitDiff cterm=NONE ctermfg=DarkBlue
    hi diffIndexLine cterm=NONE ctermfg=DarkBlue
    hi diffLine cterm=NONE ctermfg=DarkBlue
    set nocursorline
    " hi CursorLine guifg=NONE ctermfg=NONE guibg=#32302f ctermbg=236 gui=NONE cterm=NONE
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * ++nested call MyHighlights()
augroup END
]]

vim.cmd [[
augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi link illuminatedWord CursorLine
augroup END
]]

vim.cmd [[
augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
augroup END
]]

vim.cmd [[
augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi illuminatedCurWord cterm=italic gui=italic
augroup END
]]

vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'gitcommit' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'markdown' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

-- vim.api.nvim_create_autocmd({ "VimResized" }, {
-- 	callback = function()
-- 		vim.cmd("tabdo wincmd =")
-- 	end,
-- })

vim.api.nvim_create_autocmd({ 'CmdWinEnter' }, {
  callback = function()
    vim.cmd 'quit'
  end,
})

vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
  callback = function()
    vim.highlight.on_yank { higroup = 'Visual', timeout = 200 }
  end,
})

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  pattern = { '*.java' },
  callback = function()
    vim.lsp.codelens.refresh()
  end,
})

vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  callback = function()
    vim.cmd 'hi link illuminatedWord LspReferenceText'
  end,
})

-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
-- 	callback = function()
-- 	local line_count = vim.api.nvim_buf_line_count(0)
-- 		if line_count >= 5000 then
-- 			vim.cmd("IlluminatePauseBuf")
-- 		end
-- 	end,
-- })
--
vim.cmd [[
augroup presentation
    autocmd!
    au Filetype markdown nnoremap <buffer> <F10> :PresentingStart<CR>
    au Filetype markdown nnoremap <buffer> <F12> :.!toilet -w 200 -f term -F border<CR>
augroup end
]]
