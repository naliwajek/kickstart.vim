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
        desc = 'Chat (CodeCompanion)',
      },
      {
        '<leader>ah',
        function()
          require('codecompanion').actions.explain_code()
        end,
        mode = { 'v' },
        desc = 'Ask about highlighted code',
      },
      {
        '<leader>ak',
        function()
          require('codecompanion').inline.suggest()
        end,
        desc = 'Inline Suggest',
      },
    },
    config = function()
      require('codecompanion').setup {
        adapters = {
          -- openai = {
          --   api_key = os.getenv 'OPENAI_API_KEY',
          -- },
          ollama = {
            model = 'codestral',
          },
          -- copilot = {
          --   enabled = true, -- seamlessly uses Copilot as a backend
          -- },
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
