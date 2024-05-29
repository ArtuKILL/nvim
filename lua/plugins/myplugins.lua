local overrides = require "configs.overrides"

local plugins = {
  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "configs.null-ls"
        end,
      },
    },
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.mason-lspconfig"
      -- require "configs.lspconfig"
    end, -- Override to setup mason-lspconfig
    opts = {
      servers = {
        luau_lsp = {},
      },
      setup = {},
    },
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    require = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason").setup()
      -- require("mason-lspconfig").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>" },
      { "<leader>lr", ":Laravel routes<cr>" },
      { "<leader>lm", ":Laravel related<cr>" },
      {
        "<leader>lt",
        function()
          require("laravel.tinker").send_to_tinker()
        end,
        mode = "v",
        desc = "Laravel Application Routes",
      },
    },
    event = { "VeryLazy" },
    config = function()
      require("laravel").setup()
      require("telescope").load_extension "laravel"
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = { "VeryLazy" },
    keys = { "<leader>tt", "<cmd>TroubleToggle" },
    lazy = false,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end,
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
  },
  {

    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
    requires = { "mfussenegger/nvim-dap" },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    config = function()
      require("mason").setup()
      require("mason-nvim-dap").setup()
    end,
    requires = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
  },
  {
    "lopi-py/luau-lsp.nvim",
    ft = { "luau" },
    event = "LspAttach",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {},
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-tree.lua",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
  {
    "kiyoon/jupynium.nvim",
    build = "pip install --user .",
    config = function()
      require("jupynium").setup {
        default_notebook_URL = "localhost:8888/nbclassic",
      }
    end,
    event = "BufReadPre *.ju.py",
  },
  {
    "rcarriga/nvim-notify",
  },
  {
    "stevearc/dressing.nvim",
  },
  {
    "https://github.com/apple/pkl-neovim",
    lazy = true,
    event = "BufReadPre *.pkl",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    build = function()
      vim.cmd "TSInstall!, pkl"
    end,
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
  {
    'akinsho/flutter-tools.nvim',
    lazy = true, -- ver que evento puedo usar para ponerlo lazy
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    ft = { "dart" },
    config = function()
      require("flutter-tools").setup {
        fvm = true,
        event = { "VeryLazy" },
        lsp = {
          color = {
            enabled = true,
            background = true
          },
          debugger = {
            enabled = true,
            -- run_via_dap = true
          }
        },
        decorations = {
          statusline = {
            app_version = true,
            device = true,
          }
        }
      };
      require("bloc").setup()
    end
  },
  {
    "andweeb/presence.nvim",
    lazy = false,
    opts = {
      neovim_image_text = "Esto es solamente para que vean que uso NVIM XDXDXD",
      editing_text = "Editando %s ( ͡° ͜ʖ ͡°)",
      file_explorer_text = "Buscando un noseque en %s 🤔",
      reading_text = "Leyendo aki %s",
      workspace_text = "Trabajando en %s 😭",

    }
  },
  {
    "RobertPietraru/bloc.nvim",
    requires = {
      "jose-elias-alvarez/null-ls.nvim",
    },
  },
  {
    "Myzel394/easytables.nvim",
    ft = "markdown",
    opts = {}
  },
  {
    "tadmccorkle/markdown.nvim",
    ft = "markdown",
    opts = {}
  }
}

return plugins
