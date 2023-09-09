local plugins = {
  {
    "ludovicchabant/vim-gutentags",
    lazy = false,
    config = function()
      require "custom.plugins.configs.vim-gutentags"
    end
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  },
}

return plugins
