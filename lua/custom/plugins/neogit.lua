return {
  'TimUntersberger/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('neogit').setup {}
  end,
  cmd = 'Neogit',
  keys = {
    { '<leader>gg', '<cmd>Neogit<CR>', desc = 'Open Neogit' },
  },
}
