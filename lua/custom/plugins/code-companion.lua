return {
  -- 1. Code Companion LLM controller
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'MunifTanjim/nui.nvim',
    },
    cmd = 'CodeCompanion',
    keys = {
      {
        '<leader>ac',
        function()
          require('codecompanion').chat()
        end,
        mode = { 'n' },
        desc = '[C]hat',
      },
      {
        '<leader>ac',
        function()
          vim.cmd ":'<,'>CodeCompanion /chat<CR>"
        end,
        mode = { 'v' },
        desc = '[C]hat',
      },
      {
        '<leader>aa',
        function()
          require('codecompanion').actions() -- works even though LSP errors
        end,
        mode = { 'v' },
        desc = 'Open [A]ctions',
      },
      {
        '<leader>aa',
        function()
          require('codecompanion').actions() -- works even though LSP errors
        end,
        mode = { 'n' },
        desc = 'Open [A]ctions',
      },
      {
        '<leader>ag',
        function()
          vim.cmd ':CodeCompanion /commit<CR>'
        end,
        mode = { 'n' },
        desc = '[G]it message',
      },
      {
        '<leader>ah',
        function()
          vim.cmd ":'<,'>CodeCompanion /explain<CR>"
        end,
        mode = { 'v' },
        desc = 'Explain [h]ighlighted code',
      },
      {
        '<leader>af',
        function()
          vim.cmd ":'<,'>CodeCompanion /fix<CR>"
        end,
        mode = { 'v' },
        desc = '[F]ix Code',
      },
      {
        '<leader>ak',
        function()
          vim.fn.feedkeys(":'<,'>CodeCompanion /buffer ", 'n')
        end,
        mode = { 'v' },
        desc = 'Inline change',
      },
    },
    config = function()
      require('codecompanion').setup {
        strategies = {
          inline = {
            keymaps = {
              accept_change = {
                modes = { n = 'ga' },
                description = 'Accept the suggested change',
              },
              reject_change = {
                modes = { n = 'gr' },
                description = 'Reject the suggested change',
              },
            },
          },
          chat = {
            roles = {
              ---The header name for the LLM's messages
              ---@type string|fun(adapter: CodeCompanion.Adapter): string
              llm = function(adapter)
                return 'AI (' .. adapter.formatted_name .. ')'
              end,

              ---The header name for your messages
              ---@type string
              user = 'Me',
            },
          },
        },
        adapters = {
          copilot = function()
            return require('codecompanion.adapters').extend('copilot', {
              schema = {
                model = {
                  default = 'claude-sonnet-4',
                },
              },
            })
          end,
        },
      }
    end,
  },

  -- 2. GitHub Copilot plugin (recommended Lua version)
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
      }
    end,
  },
}
