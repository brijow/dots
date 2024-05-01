return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>tf', builtin.find_files, { desc = '[t]elescope search [F]iles' })
      vim.keymap.set('n', '<leader>tg', builtin.live_grep, { desc = '[t]elescope search by [G]rep' })
      vim.keymap.set('n', '<leader>tS', builtin.builtin, { desc = '[t]elescope search [S]elect Telescope' })
      vim.keymap.set('n', '<leader>tw', builtin.grep_string, { desc = '[t]elescope search current [W]ord' })
      vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = '[t]elescope search [H]elp' })
      vim.keymap.set('n', '<leader>tk', builtin.keymaps, { desc = '[t]elescope search [K]eymaps' })
      vim.keymap.set('n', '<leader>tR', builtin.resume, { desc = '[t]elescope search [R]esume' })
      -- vim.keymap.set('n', '<leader>tr', '<cmd>Telescope lsp_references theme=ivy show_line=false trim_text=true<CR>')
      -- vim.keymap.set('n', '<leader>k', [[<Cmd>lua require'brijow.telescope'.browse_notes()<CR>]])
      -- vim.keymap.set('n', '<leader>td', "<cmd>lua require('telescope').extensions.dir.live_grep(require('telescope.themes').get_ivy({}))<cr>")

      -- NOTE: is it necessary to use a function here?
      vim.keymap.set('n', '<leader>tv', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[t]elescope search Neo[v]im files' })

      vim.keymap.set('n', '<leader>tD', builtin.diagnostics, { desc = '[t]elescope search [D]iagnostics' })
      vim.keymap.set('n', '<leader>t.', builtin.oldfiles, { desc = '[t]elescope search Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>t/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[t]elescope search [/] in Open Files' })

    end,
  },
}
