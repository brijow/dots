return {
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    lazy = true,
    -- build = "cd app && yarn install",
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
      vim.g.mkdp_echo_preview_url = '1'
      vim.g.mkdp_port = '8001'
      vim.g.mkdp_theme = 'light'
    end,
  },
}
