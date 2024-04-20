return {
  {
    'lervag/vimtex',
    init = function()
      -- Use init for configuration, don't use the more common "config".
      -- vim.g.vimtex_view_method = 'zathura'
      --       vim.g.vimtex_compiler_method = 'latexmk'
      --  vim.g.vimtex_compiler_latexmk = {
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
