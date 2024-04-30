return {
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})
  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {
        mappings = { basic = false, extra = false },
      }
      vim.keymap.set('n', '<leader>c<Space>', "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>")
      vim.keymap.set('x', '<leader>c<Space>', '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')
    end,
    -- opts = {
    --   -- toggler = { line = '<leader>c<Space>' },
    --   mappings = { basic = false, extra = false },
    -- },
  },
}
