return {
  { 'williamboman/mason.nvim', opts = {} },
  'mfussenegger/nvim-jdtls',
  ft = 'java',

  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'saghen/blink.cmp' },
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = { 'lua_ls' },
      }
    end,
  },
  'WhoIsSethDaniel/mason-tool-installer.nvim',

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      -- Mason must be loaded before its dependents so we need to set it up here.
      -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
      { 'williamboman/mason.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', opts = {} },
    },

    config = function()
      local lspconfig = require 'lspconfig'
      lspconfig.lua_ls.setup {}
      lspconfig.jdtls.setup {}
    end,
  },
}
