--
-- opts.lua
--

-- vim.opt behaves like :set
-- see also `:help option-list`
-- based on my old vim confing and:
-- https://mattermost.com/blog/how-to-install-and-set-up-neovim-for-code-editing/

local opt = vim.opt

-- Disabling modelines
-- https://neovim.io/doc/user/usr_21.html#21.6
-- https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
opt.modelines = 0                -- int: how many lines (at the start or the end) are inspected
opt.modeline = false             -- bool: toggle of modeline feature

-- Context
opt.wrap = true                  -- bool: Wrap lines by default
opt.breakindent = true           -- bool: Wrapped line repeats indent
opt.colorcolumn = '80'           -- str:  Show col for max line length
opt.number = true                -- bool: Show line numbers
opt.relativenumber = true        -- bool: Show relative line numbers
opt.scrolloff = 0                -- int:  Min num lines of context
opt.signcolumn = "no"            -- str:  Show the sign column
opt.showcmd = true               -- bool: Display incomplete commands (command mode)
opt.ruler = true                 -- bool: Show the line and column number of the cursor

-- Mouse handling
opt.mouse = 'v'                  -- str: visual mode only

-- Filetypes
opt.encoding = 'utf8'            -- str:  String encoding to use
opt.fileencoding = 'utf8'        -- str:  File encoding to use

-- Theme
opt.syntax = "ON"                -- str:  Allow syntax highlighting
opt.termguicolors = true         -- bool: If term supports ui color then enable

-- Search
opt.hlsearch = true              -- bool: Highlight search matches
opt.incsearch = true             -- bool: Use incremental search
opt.ignorecase = true            -- bool: Ignore case in search patterns
opt.smartcase = true             -- bool: Override ignorecase if search contains capitals

-- Whitespace
opt.tabstop = 4                  -- num:  Number of spaces tabs count for
opt.shiftwidth = 4               -- num:  Size of an indent
opt.expandtab = true             -- bool: Use spaces instead of tabs
opt.softtabstop = 4              -- num:  Number of spaces tabs count for in insert mode

-- Splits
opt.splitright = true            -- bool: Place new window to right of current one
opt.splitbelow = true            -- bool: Place new window below the current one

-- Temp files
opt.backup = true
-- opt.backupdir = '$HOME/.cache/nvim/backup'
