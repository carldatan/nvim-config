vim.cmd 'set expandtab'
vim.cmd 'set tabstop=2'
vim.cmd 'set softtabstop=2'
vim.cmd 'set shiftwidth=2'
vim.g.mapleader = ' '
vim.opt.number = true
vim.cmd 'colorscheme habamax'
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = ' ', nbsp = '␣' }
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local keymap = vim.keymap
-- debugging
keymap.set('n', '<leader>b', "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
keymap.set('n', '<leader>bc', "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
keymap.set('n', '<leader>bl', "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
keymap.set('n', '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>")
keymap.set('n', '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>')
keymap.set('n', '<F5>', "<cmd>lua require'dap'.continue()<cr>")
keymap.set('n', '<F11>', "<cmd>lua require'dap'.step_over()<cr>")
keymap.set('n', '<F8>', "<cmd>lua require'dap'.step_into()<cr>")
keymap.set('n', '<F9>', "<cmd>lua require'dap'.step_out()<cr>")
keymap.set('n', '<F7>', function()
  require('dap').disconnect()
  require('dapui').close()
end)
keymap.set('n', '<leader>dt', function()
  require('dap').terminate()
  require('dapui').close()
end)
keymap.set('n', '<leader>dr', "<cmd>lua require'dap'.repl.toggle()<cr>")
keymap.set('n', '<leader>dl', "<cmd>lua require'dap'.run_last()<cr>")
keymap.set('n', '<leader>di', function()
  require('dap.ui.widgets').hover()
end)
keymap.set('n', '<leader>d?', function()
  local widgets = require 'dap.ui.widgets'
  widgets.centered_float(widgets.scopes)
end)
keymap.set('n', '<leader>df', '<cmd>Telescope dap frames<cr>')
keymap.set('n', '<leader>dh', '<cmd>Telescope dap commands<cr>')
keymap.set('n', '<leader>de', function()
  require('telescope.builtin').diagnostics { default_text = ':E:' }
end)
