return {
  'neanias/everforest-nvim',
  version = false,
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  -- Optional; default configuration will be used if setup isn't called.
  config = function()
    require('everforest').setup {
      -- "hardness" of background. "soft", "medium" or "hard".
      -- background = 'hard',
      ---How much of the background should be transparent. 2 will have more UI components be transparent (e.g. status line background)
      transparent_background_level = 1, -- 2
    }
  end,
  -- init = function()
  --   -- Load the colorscheme here.
  --   vim.cmd.colorscheme 'everforest'
  -- end,
}
-- local colorscheme = "modest"
