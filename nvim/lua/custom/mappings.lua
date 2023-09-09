local M = {}

M.general = {
  n = {
    -- Navigate seamlessly between tmux panes and vim splits
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },

    -- Open in system app
    ["gx"] = { "<Cmd>call jobstart(['xdg-open', expand('<cfile>')], {'detach': v:true})<CR>" },

    -- Snip Run
    ["<leader>sr"] = { "<cmd> SnipRun<CR>", "snip run" }
  }
}

return M

