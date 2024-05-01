-- Neovim getting started tips {{{
-- - https://learnxinyminutes.com/docs/lua/
-- - https://neovim.io/doc/user/lua-guide.html
-- - :Tutor
-- - :help
-- - :help lua-guide
-- - :help lazy.nvim-lazy.nvim-structuring-your-plugins
--==================================================
--==================================================
--==                               .-----.        ==
--==    .----------------------.   | === |        ==
--==    |.-""""""""""""""""""-.|   |-----|        ==
--==    ||                    ||   | === |        ==
--==    ||        NVIM        ||   |-----|        ==
--==    ||                    ||   | === |        ==
--==    ||                    ||   |-----|        ==
--==    ||:Tutor              ||   |:::::|        ==
--==    |'-..................-'|   |____o|        ==
--==    `"")----------------(""`   ___________    ==
--==   /::::::::::|  |::::::::::\  \ no mouse \   ==
--==  /:::========|  |==hjkl==:::\  \ required \  ==
--== '""""""""""""'  '""""""""""""'  '""""""""""' ==
--==                                              ==
--==================================================
--==================================================
-- }}}
-- Lazy.nvim tips {{{
--  Check the current status of your plugins:  :Lazy
--  Update plugins: :Lazy update
--  See help: `:help lazy.nvim.txt`
-- }}}

require 'user.options'
require 'user.keymaps'
require 'user.autocommands'
-- require 'user.health'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  require 'user.plugins.telescope',
  -- use({
  --   "princejoogie/dir-telescope.nvim",
  --   -- telescope.nvim is a required dependency
  --   requires = {"nvim-telescope/telescope.nvim"},
  --   config = function()
  --     require("dir-telescope").setup({
  --       hidden = true,
  --       respect_gitignore = true,
  --     })
  --   end,
  -- })
  require 'user.plugins.nvim_lspconfig',
  require 'user.plugins.nvim_cmp',
  require 'user.plugins.nvim_treesitter',

  require 'user.plugins.conform',
  -- use 'sbdchd/neoformat'

  require 'user.plugins.gitsigns', -- adds gitsigns recommended keymaps

  require 'user.plugins.comment',
  require 'user.plugins.todo_comments',
  -- require 'user.plugins.nvim_colorizer',
  -- require 'user.plugins.symbols_outline',
  require 'user.plugins.aerial',
  require 'user.plugins.illuminate',
  require 'user.plugins.neo-tree',

  -- require 'user.plugins.tokyonight',
  -- require 'user.plugins.everforest',
  -- require 'user.plugins.vim_modest',
  require 'user.plugins.nightfox',

  require 'user.plugins.vim_sleuth',
  -- require 'user.plugins.mini',
  -- require 'user.plugins.debug',
  -- require 'user.plugins.lint',
  -- require 'user.plugins.autopairs',

  require 'user.plugins.vimtex',
  require 'user.plugins.markdown_preview',

  require 'user.plugins.copilot',

  require 'user.plugins.vim_slime',
  -- require 'user.plugins.ultisnips',
  -- require 'user.plugins.vim_oscyank',
  -- require 'user.plugins.requirements_txt',
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
