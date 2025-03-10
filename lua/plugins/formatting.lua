return {
  {
    'stevearc/conform.nvim',
    dependencies = { 'mason.nvim' },
    lazy = true,
    cmd = 'ConformInfo',
    keys = {
      {
        '<leader>cF',
        function()
          require('conform').format { formatters = { 'injected' }, timeout_ms = 3000 }
        end,
        mode = { 'n', 'v' },
        desc = 'Format Injected Langs',
      },
    },
    opts = function()
      local opts = {
        default_format_opts = {
          timeout_ms = 3000,
          async = false, -- not recommended to change
          quiet = false, -- not recommended to change
          lsp_format = 'fallback', -- not recommended to change
        },
        formatters_by_ft = {
          lua = { 'stylua' },
          fish = { 'fish_indent' },
          sh = { 'shfmt' },
        },
        -- The options you set here will be merged with the builtin formatters.
        -- You can also define any custom formatters here.
        formatters = {
          injected = { options = { ignore_errors = true } },
        },
      }
      return opts
    end,
  },
}
