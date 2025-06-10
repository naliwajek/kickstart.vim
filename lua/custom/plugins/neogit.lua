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
    { '<leader>gs', '<cmd>Neogit<CR>', desc = 'Open Neogit' },
  },
}
