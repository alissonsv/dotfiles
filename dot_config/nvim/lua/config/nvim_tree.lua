vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set('n', 'l', api.node.open.edit, opts('open'))
	vim.keymap.set('n', 'o', api.node.open.edit, opts('open'))
	vim.keymap.set('n', '<CR>', api.node.open.edit, opts('open'))
	vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
	vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
	vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts('CD'))
end

require("nvim-tree").setup({
	on_attach = on_attach,
	sort_by = 'name',
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
		debounce_delay = 15,
		update_root = true,
		ignore_list = {},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	renderer = {
		group_empty = true,
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				item = "│ ",
				none = "  ",
			},
		},
		icons = {
			webdev_colors = true,
			show = {
				file = true,
				folder = true,
				folder_arrow = false,
				git = true
			},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "", -- 
					staged = "",
					unmerged = "",
					renamed = "➜",
					untracked = "",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		show_on_open_dirs = true,
		debounce_delay = 50,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		dotfiles = false,
	},
	filesystem_watchers = {
		enable = true,
		debounce_delay = 50,
		ignore_dirs = {},
	},
})
