(setq org-todo-keywords
      '((sequence "TODO" "NEXT" "|" "DONE" "WAITING" "CANCELED")))

(setq org-refile-targets
      '(("~/org/notes.org" :maxlevel . 1)
        ("~/org/gtd.org" :maxlevel . 1)
        ("~/org/calendar.org" :maxlevel . 1)
        ("~/org/someday.org" :maxlevel . 1)
        ("~/org/archive.org" :maxlevel . 1)))

(setq org-agenda-files (list "~/org/notes.org" "~/org/gtd.org" "~/org/calendar.org"))
