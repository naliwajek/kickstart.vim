vim.keymap.set('n', '<leader>1', ':only<CR>', { desc = 'only one window' })
vim.keymap.set('n', '<leader>2', ':split<CR>', { desc = 'split horizontal' })
vim.keymap.set('n', '<leader>3', ':vsplit<CR>', { desc = 'split vertical' })
vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { desc = 'toggle tree' })

-- Auto-open Telescope oldfiles on startup
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    -- Small delay to ensure Telescope is loaded
    vim.defer_fn(function()
      -- Only open if no arguments were passed to nvim
      if vim.fn.argc() == 0 then
        require('telescope.builtin').oldfiles()
      end
    end, 100)
  end,
})

-- floating terminal
vim.keymap.set('n', '<leader>`', function()
  local buf = vim.api.nvim_create_buf(false, true)

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })

  vim.fn.termopen(vim.o.shell or '/bin/bash', {
    on_exit = function()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end,
  })

  vim.cmd 'startinsert'
end, { desc = 'terminal' })

-- Return empty table for plugin specifications
return {}
