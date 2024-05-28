require('lazy').setup({
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',

  -- theme
  {
    'projekt0n/github-nvim-theme',
    -- priority = 1000,
    -- config = function()
    --   vim.cmd('colorscheme github_dark_dimmed')
    -- end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd('colorscheme tokyonight')
    end
  },

  -- tree
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require('config.nvimtree')
    end
  },

  -- comment
  {
    'numToStr/Comment.nvim',
    opts = {}
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    -- branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      {
        -- telescope sorter to significantly improve sorting performance
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
      },
      {
        -- telescope file browser
        'nvim-telescope/telescope-file-browser.nvim',
        dependencies = {
          'nvim-lua/plenary.nvim'
        }
      }
    },
    config = function()
      require('config.telescope')
    end
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- auto install daps
      'jay-babu/mason-nvim-dap.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      -- Useful status updates for LSP.
      {
        'j-hui/fidget.nvim',
        opts = {
          progress = {
            ignore = { 'pylsp' }
          }
        }
      }
    },
    config = function()
      require('config.lsp')
    end
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets
          -- This step is not supported in many windows environments
          -- Remove the below condition to re-enable on windows
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
      },

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',

      -- If you want to add a bunch of pre-configured snippets,
      --    you can use this plugin to help you. It even has snippets
      --    for various frameworks/libraries/etc. but you will have to
      --    set up the ones that are useful for you.
      'rafamadriz/friendly-snippets',
    },
    config = function()
      require('config.nvimcmp')
    end
  },

  -- HIGHLIGHT, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
	  'bash',
  	  'dockerfile',
	  'go',
	  'html',
	  'javascript',
	  'json',
	  'lua',
	  'python',
	  'typescript'
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true }
      })
    end
  },

  -- Indent
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {}
  },

   -- Adds git related signs to the gutter, as well as utilities for managing changes
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
      },
    },
  },

  -- statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    opts = {
      options = {
        disabled_filetypes = { 'NvimTree' }
      }
    }
  },

  -- lazygit
  {
    'kdheepak/lazygit.nvim',
    dependencies =  {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('telescope').load_extension('lazygit')
      vim.keymap.set('n', '<leader>gg', '<Cmd>LazyGit<CR>', { desc = 'Lazy[G]it', silent = true })
    end,
  },

  -- Autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true
  },

  -- notifications
  {
    'rcarriga/nvim-notify'
  },

  -- workflow practices
  {
    'm4xshen/hardtime.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim'
    },
    opts = {
      max_count = 5
    }
  },

  -- tabs
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'BufReadPre',
    opts = {
      options = {
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'Nvim Tree',
            separator = true,
            text_align = 'left'
          }
        }
      }
    }
  },

  -- debug
  {
    'mfussenegger/nvim-dap',
    config = function()
      require('config.dap')
    end,
    dependencies = {
      {
        'microsoft/vscode-js-debug',
        build = 'npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out',
        version = '1.*'
      },
      {
        'mxsdev/nvim-dap-vscode-js',
        config = function()
          require('dap-vscode-js').setup({
                        -- Path of node executable. Defaults to $NODE_PATH, and then "node"
            -- node_path = "node",

            -- Path to vscode-js-debug installation.
            debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),

            -- Command to use to launch the debug server. Takes precedence over "node_path" and "debugger_path"
            -- debugger_cmd = { "js-debug-adapter" },

            -- which adapters to register in nvim-dap
            adapters = {
              "chrome",
              "pwa-node",
              "pwa-chrome",
              "pwa-msedge",
              "pwa-extensionHost",
              "node-terminal",
            },

            -- Path for file logging
            -- log_file_path = "(stdpath cache)/dap_vscode_js.log",

            -- Logging level for output to file. Set to false to disable logging.
            -- log_file_level = false,

            -- Logging level for output to console. Set to false to disable console output.
            -- log_console_level = vim.log.levels.ERROR,
          })
        end
      },
      {
        'rcarriga/nvim-dap-ui',
        opts = {},
        dependencies = {
          'nvim-neotest/nvim-nio'
        }
      },
      {
        'theHamsta/nvim-dap-virtual-text',
        opts = {}
      }
    }
  },

  -- show keys
  {
    'folke/which-key.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },

  {
    'folke/zen-mode.nvim',
    opts = {}
  },

  {
    'wakatime/vim-wakatime',
    lazy = false
  },
  
  -- formatter
  {
    'stevearc/conform.nvim',
    opts = {
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end,
      formatters_by_ft = {
        javascript = { 'prettier' },
        typescript = { 'prettier' }
      }
    }
  },

  -- folding
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async'
    },
    opts = {
      provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
      end
    }
  },

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  }
})
