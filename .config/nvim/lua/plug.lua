--
-- plug.lua
--

-- https://github.com/nvim-orgmode/orgmode
require('orgmode').setup({
   org_agenda_files = '~/orgfiles/**/*',
   org_default_notes_file = '~/orgfiles/refile.org',
   org_adapt_indentation = false,
   org_cycle_separator_lines = 0,
})
