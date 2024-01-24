vim.opt.relativenumber = true

lvim.colorscheme = 'github_dark_dimmed'
lvim.plugins = {
  { 'projekt0n/github-nvim-theme' },
  { 'wakatime/vim-wakatime' }
}

lvim.format_on_save = true

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "eslint",
    filetypes = { "typescript" }
  }
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "typescript" }
  }
}
