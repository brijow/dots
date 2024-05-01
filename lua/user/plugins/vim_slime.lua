return {
  'jpalardy/vim-slime',
  init = function()
    vim.g.slime_no_mappings = 1

    -- vim.g.slime_python_ipython = 1
    vim.g.slime_bracketed_paste = 1  -- this is better than slime_python_ipython when in tmux

    vim.g.slime_target = 'tmux'
    vim.g.slime_default_config = { socket_name = 'default', target_pane = '2' }
  end,
  config = function()
    vim.api.nvim_set_keymap('x', '<leader>cv', '<Plug>SlimeRegionSend', { noremap = true })
    vim.api.nvim_set_keymap('n', '<leader>cv', '<Plug>SlimeParagraphSend', { noremap = true })
  end,
}
