--
-- keys.lua
--

-- Leader keys
-- https://learnvimscriptthehardway.stevelosh.com/chapters/06.html
vim.g.mapleader   = ","
vim.g.localleader = "\\"

-- un-highligt search results
vim.keymap.set("n", "<leader>f", ":noh<cr>")

-- clipboard management (ctrl-c,p)
-- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/
vim.keymap.set({'n', 'x'}, 'gy', '"+y')
vim.keymap.set({'n', 'x'}, 'gp', '"+p')
