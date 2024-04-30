-- vim.cmd [[
-- "imap <silent><script><expr> <C-N> <Plug>(copilot-next)
-- imap <silent><script><expr> <C-space> copilot#Accept("\<CR>")
-- let g:copilot_no_tab_map = v:true
-- let g:copilot_assume_mapped = v:true
-- ]]

-- example config here:
-- https://github.com/zbirenbaum/copilot-cmp/issues/75#issuecomment-1603606574
return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    -- build = ':Copilot auth',
    -- module = 'copilot',
    -- NOTE: below are all default opts, from https://github.com/zbirenbaum/copilot.lua
    opts = {
      -- recommended to set suggestion and panel to false for copilot_cmp
      panel = { enabled = false },
      suggestion = { enabled = false },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ['.'] = false,
      },
      copilot_node_command = 'node', -- Node.js version must be > 18.x
    },
  },
  {
    'zbirenbaum/copilot-cmp',
    config = function()
      require('copilot_cmp').setup()
    end,
  },
}
