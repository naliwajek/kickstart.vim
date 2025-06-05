return {
  'nvim-telescope/telescope-file-browser.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').load_extension 'file_browser'
  end,
  keys = {
    {
      '<leader>fb',
      ':Telescope file_browser path=%:p:h select_buffer=true<CR>',
      desc = 'Floating File Browser',
    },
  },
}
