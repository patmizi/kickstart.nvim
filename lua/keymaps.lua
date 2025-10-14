-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- limit line wrapping using remaps
vim.keymap.set('n', '<C-Right>', function()
  local line_num = vim.fn.line '.'
  local col = vim.fn.col '.'
  local line = vim.fn.getline '.'
  local line_len = vim.fn.strlen(line)

  if col >= line_len then
    return
  end

  -- Save position and try the movement
  local save_pos = vim.fn.getpos '.'
  vim.cmd 'normal! w'

  local new_line_num = vim.fn.line '.'
  local new_col = vim.fn.col '.'

  -- If we jumped to a different line, restore and move to end of current line
  if new_line_num ~= line_num then
    vim.fn.setpos('.', save_pos)
    vim.cmd 'normal! $'
  end
end, { noremap = true, silent = true })

vim.keymap.set('i', '<C-Right>', function()
  local line_num = vim.fn.line '.'
  local col = vim.fn.col '.'
  local line = vim.fn.getline '.'
  local line_len = vim.fn.strlen(line)

  if col >= line_len then
    return
  end

  local save_pos = vim.fn.getpos '.'
  vim.cmd 'normal! <C-o>w'

  local new_line_num = vim.fn.line '.'

  if new_line_num ~= line_num then
    vim.fn.setpos('.', save_pos)
    vim.cmd 'normal! <C-o>$'
  end
  vim.cmd 'startinsert!'
end, { noremap = true, silent = true })

vim.keymap.set('n', '<C-Left>', function()
  local line_num = vim.fn.line '.'
  local col = vim.fn.col '.'

  if col <= 1 then
    return
  end

  local save_pos = vim.fn.getpos '.'
  vim.cmd 'normal! b'

  local new_line_num = vim.fn.line '.'

  if new_line_num ~= line_num then
    vim.fn.setpos('.', save_pos)
    vim.cmd 'normal! 0'
  end
end, { noremap = true, silent = true })

vim.keymap.set('i', '<C-Left>', function()
  local line_num = vim.fn.line '.'
  local col = vim.fn.col '.'

  if col <= 1 then
    return
  end

  local save_pos = vim.fn.getpos '.'
  vim.cmd 'normal! <C-o>b'

  local new_line_num = vim.fn.line '.'

  if new_line_num ~= line_num then
    vim.fn.setpos('.', save_pos)
    vim.cmd 'normal! <C-o>0'
  end
  vim.cmd 'startinsert!'
end, { noremap = true, silent = true })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
