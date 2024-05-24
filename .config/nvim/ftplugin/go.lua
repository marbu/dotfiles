--
-- ftplugin/go.lua
--

local root_paths = vim.fs.find(
    { 'go.mod', 'go.work', '.git' },
    { upward = true, stop = vim.env.HOME }
)
local root_dirname = vim.fs.dirname(root_paths[1])

-- assuming that gopls is installed via golang-x-tools-gopls package
if root_dirname then
  vim.lsp.start({
    name = 'gopls',
    cmd = {'gopls'},
    root_dir = root_dirname,
  })
end
