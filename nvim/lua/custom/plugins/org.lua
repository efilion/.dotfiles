local plugins = {
  {
    "efilion/orgmode",
    init = function()
      require('orgmode').setup_ts_grammar()
    end,
    opts = {
      org_default_notes_file = "~/org/inbox.org",
      org_agenda_files = { "~/org/inbox.org", "~/org/gtd.org", "~/org/someday.org", "~/org/chess-engine.org", "topics.org" },
      org_todo_keywords = { 'TODO(t)', 'NEXT(n)', 'WAITING(w)', '|', 'DONE(d)', 'CANCELED(c)' },
      org_agenda_custom_commands = {
        {"x", "agenda"}
      }
    },
    dependencies = {
      "akinsho/org-bullets.nvim",
      "lukas-reineke/headlines.nvim",
    }
  },
  {
    "akinsho/org-bullets.nvim",
    config = true
  },
  {
    "lukas-reineke/headlines.nvim",
    opts = function ()
      local org = {
        headline_highlights = { "LazyH1", "Headline", "default" },
        fat_headlines = false
      }
      return { org = org }
    end,
    dependencies = "nvim-treesitter/nvim-treesitter"
  },
  {
    "dhruvasagar/vim-table-mode",
    lazy = false
  },
}

return plugins
