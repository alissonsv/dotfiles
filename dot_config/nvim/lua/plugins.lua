return {
	{ 
		'projekt0n/github-nvim-theme',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd('colorscheme github_dark_dimmed')
		end
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' },
		init = function()
			require 'config.telescope'
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		init = function()
			require 'config.treesitter'
		end
	},
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require 'config.gitsigns'
		end
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		priority = 1000,
		branch = 'v3.x',
	},
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'hrsh7th/cmp-path'},
	{'hrsh7th/cmp-nvim-lua'},
	{'hrsh7th/cmp-buffer'},
	{
    'L3MON4D3/LuaSnip',
    dependencies = {
      'friendly-snippets'
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  },
  {
    'rafamadriz/friendly-snippets',
    lazy = true
  },
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require('config.nvim_tree')
		end,
	},
	{ 'wakatime/vim-wakatime' },
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup {
				options = { theme = 'ayu_mirage' }
			}
		end
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 1000
		end,
		opts = {
			mode = "n",
			prefix = "<leader>",
			buffer = nil,
			silent = true,
			noremap = true,
			nowait = true
		},
		vopts = {
			mode = "v",
			prefix = "<leader>",
			buffer = nil,
			silent = true,
			noremap = true,
			nowait = true
		}
	},
	{
		'ahmedkhalf/project.nvim',
		opts = {
			manual_mode = false
		},
		event = 'VeryLazy',
		config = function (_, opts)
			opts.detection_methods = { "lsp", "pattern" }
			opts.patterns = {
				".git",
				".hg",
				".svn",
			}
			require("project_nvim").setup(opts)
			require("telescope").load_extension("projects")
		end,
		keys = {
			{ "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
		},
	},
	{'akinsho/toggleterm.nvim', version = "*", config = true},
	{
		'akinsho/bufferline.nvim',
		version = '*',
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
		config = function()
			require("config.bufferline")
		end
	},
	{
		'RRethy/vim-illuminate'
	},
	{
		'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
	},
  {
    'lukas-reineke/indent-blankline.nvim',
    branch = '2.20.4',
    config = function()
      require 'config.indent_blankline'
    end
  }
}
