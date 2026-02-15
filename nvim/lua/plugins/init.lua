return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "eslint-lsp",
        "json-lsp",
        "prettier",
        "html-lsp",
        "css-lsp",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
      },
    },
  },
  {
    "default-anton/llm-sidekick.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("llm-sidekick").setup({
        providers = {
          gemini = {
            api_key = "AIzaSyCZVOPgv_CTqmRLC-Bos_pQ1t9x3N2duko",
            model = "gemini-3-pro-preview",
          },
        },
        default_provider = "gemini",
      })
    end
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "TodoTelescope", "TodoLocList", "TodoQuickFix" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("todo-comments").setup(require "configs.todo")
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
   opts = {
      git = {
        enable = true,
      },

      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        },
      },
      filters = {
        dotfiles = false,
        git_ignored = false,
      },
    },
  },
}
