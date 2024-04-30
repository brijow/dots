-- Neovim getting started tips {{{
-- - https://learnxinyminutes.com/docs/lua/
-- - https://neovim.io/doc/user/lua-guide.html
-- - :Tutor
-- - :help
-- - :help lua-guide
-- - :help lazy.nvim-lazy.nvim-structuring-your-plugins
-- }}}
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
require 'user.options'
require 'user.keymaps'
require 'user.autocommands'

-- require 'user.health'
  -- use({
  --   "iamcco/markdown-preview.nvim",
  --   run = function() vim.fn["mkdp#util#install"]() end,
  -- })
  -- use 'github/copilot.vim'
  -- use 'jpalardy/vim-slime'
  -- use 'simrat39/symbols-outline.nvim'
  -- use 'stevearc/aerial.nvim'
  -- use 'sbdchd/neoformat'
  -- use {
  --   "norcalli/nvim-colorizer.lua",
  --   cmd = "ColorizerToggle",
  --   config = function()
  --     require("colorizer").setup()
  --   end,
  -- }
  --
  -- use "EdenEast/nightfox.nvim" -- Packer
  -- use 'SirVer/ultisnips'
  -- use 'ojroques/vim-oscyank'
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
  -- use "matveyt/vim-modest"
  -- use "raimon49/requirements.txt.vim"

-- Lazy.nvim tips {{{
--  Check the current status of your plugins:  :Lazy
--  Update plugins: :Lazy update
--  See help: `:help lazy.nvim.txt`
-- }}}
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  require 'user.plugins.vim_sleuth',
  require 'user.plugins.comment',
  require 'user.plugins.telescope',
  require 'user.plugins.nvim_lspconfig',
  require 'user.plugins.conform',
  require 'user.plugins.nvim_cmp',

  -- require 'user.plugins.tokyonight',
  -- require 'user.plugins.everforest',
  require 'user.plugins.nightfox',


  require 'user.plugins.todo_comments', -- Highlight todo, notes, etc in comments
  -- require 'user.plugins.mini',
  require 'user.plugins.nvim_treesitter',
  -- require 'user.plugins.debug',
  -- require 'user.plugins.indent_line',
  -- require 'user.plugins.lint',
  -- require 'user.plugins.autopairs',
  require 'user.plugins.neo-tree',
  require 'user.plugins.vimtex',
  require 'user.plugins.gitsigns', -- adds gitsigns recommended keymaps
  require 'user.plugins.illuminate',
  -- require 'user.plugins.markdown_preview',  -- currently this is not working for me
  require 'user.plugins.copilot',
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
