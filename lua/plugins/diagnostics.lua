return {
  vim.diagnostic.config {
    severity_sort = true,
    float = { border = 'rounded', source = 'if_many' },
    underline = { severity = vim.diagnostic.severity.ERROR },
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = ' ',
        [vim.diagnostic.severity.WARN] = ' ',
        [vim.diagnostic.severity.INFO] = ' ',
        [vim.diagnostic.severity.HINT] = ' ',
      },
    } or {},
    virtual_text = {
      source = 'if_many',
      spacing = 2,
      format = function(diagnostic)
        local prefixes = {
          [vim.diagnostic.severity.ERROR] = 'ERROR: ',
          [vim.diagnostic.severity.WARN] = 'WARN: ',
          [vim.diagnostic.severity.INFO] = 'INFO: ',
          [vim.diagnostic.severity.HINT] = 'HINT: ',
        }
        return prefixes[diagnostic.severity] .. diagnostic.message
      end,
    },
  },
}
