local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright"
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "michaelb/sniprun",
    build = "sh ./install.sh",
    opts = {
      display = { "NvimNotify" },
      display_options = {
        notification_timeout = 7000 -- in milliseconds
      }
    }
  },
  {
    "folke/zen-mode.nvim",
    lazy = false
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    config = true
  }
}

local navigation = require "custom.plugins.navigation"; vim.list_extend(plugins, navigation)
local visual = require "custom.plugins.visual"; vim.list_extend(plugins, visual)
local org = require "custom.plugins.org"; vim.list_extend(plugins, org)
local javascript = require "custom.plugins.javascript"; vim.list_extend(plugins, javascript)
local typescript = require "custom.plugins.typescript"; vim.list_extend(plugins, typescript)
local python = require "custom.plugins.python"; vim.list_extend(plugins, python)

return plugins
