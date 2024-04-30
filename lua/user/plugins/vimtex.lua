return {
  {
    'lervag/vimtex',
    -- Use init for configuration, don't use the more common "config".
    init = function()
      vim.g.vimtex_view_method = 'skim'
      vim.g.tex_flavor = 'latex'
      vim.g.vimtex_quickfix_mode = 2

      vim.g.vimtex_compiler_latexmk = {
        -- continuous = 1
        -- out_dir = GetOutputDir,
        options = {
          '-xelatex',
          '-file-line-error',
          '-synctex=1',
          '-interaction=nonstopmode',
          '-shell-escape',
          -- "-verbose",
        },
      }

      -- vim.g.vimtex_compiler_method = 'latexmk'

      -- vim.g.vimtex_compiler_latexmk = {
      --   continuous = 1
      --   out_dir = GetOutputDir,
      --   options = {
      --     "-verbose",
      --     "-file-line-error",
      --     "-synctex=1",
      --     "-shell-escape",
      --     "-interaction=nonstopmode",
      --   },
      -- }
      -- https://github.com/lervag/vimtex/issues/2902#issuecomment-2009212089
      -- vim.api.nvim_create_autocmd("User", {
      --     pattern = "VimtexEventQuit",
      --     group = vim.api.nvim_create_augroup("init_vimtex", {}),
      --     command = "VimtexClean"
      -- })
    end,
  },
}
-- "{{{ vimtex
-- let g:tex_flavor='latex'
-- let g:vimtex_view_method='skim'
-- let g:vimtex_quickfix_mode=2
--
-- let g:vimtex_compiler_latexmk = {
--         \ 'executable' : 'latexmk',
--         \ 'options' : [
--         \   '-xelatex',
--         \   '-file-line-error',
--         \   '-synctex=1',
--         \   '-interaction=nonstopmode',
--         \ ],
--         \}
--
-- augroup vimtex_event_1
-- au!
-- au User VimtexEventQuit     VimtexClean
-- "au User VimtexEventInitPost VimtexCompile
-- augroup END
-- "}}}
-- "{{{ tex-conceal
-- "set conceallevel=1
-- "let g:tex_conceal="abdmg"
-- "}}}
