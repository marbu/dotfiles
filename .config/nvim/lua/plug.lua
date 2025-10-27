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

-- https://github.com/lewis6991/gitsigns.nvim
require('gitsigns').setup({
  signcolumn = true,   -- Toggle with `:Gitsigns toggle_signs`
  numhl      = true,   -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false,  -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false,  -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  auto_attach = true,
  max_file_length = 50000,
  signs_staged_enable = true,
  attach_to_untracked = false,
})

-- https://github.com/Shatur/neovim-ayu.git
local colors = require('ayu.colors')
colors.generate() -- Pass `true` to enable mirage
require('ayu').setup({
  mirage = false,   -- don't use `mirage` instead of `dark` for dark background
  terminal = false, -- set to `false` to let terminal manage its own colors
  overrides = {
    Comment = { italic = false },
    LineNr = { fg = colors.comment },
  },
})
require('ayu').colorscheme()

-- https://github.com/ethanholz/nvim-lastplace
require('nvim-lastplace').setup({
  lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
  lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
  lastplace_open_folds = true
})
