vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<cr>", {silent = true, noremap = true})

local function on_attach(bufnr)
  local api = require 'nvim-tree.api'

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  local function edit_or_open()
    local node = api.tree.get_node_under_cursor()
    api.node.open.edit()
  end

  local function collapse_dirs()
    local node = api.tree.get_node_under_cursor()
    api.node.navigate.parent_close()
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "l", edit_or_open, opts("Edit Or Open"))
  vim.keymap.set("n", "h", collapse_dirs,        opts("Close"))
end

require('nvim-tree').setup({
  git = {
    enable = true,
    ignore = false
  },
  on_attach = on_attach
})
