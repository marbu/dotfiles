--
-- ftplugin/python.lua
--

local root_paths = vim.fs.find(
    { 'setup.py', 'setup.cfg', 'pyproject.toml', 'Pipfile', 'requirements.txt', '.git' },
    { upward = true, stop = vim.env.HOME }
)
local root_dirname = vim.fs.dirname(root_paths[1])

-- assuming that pylsp is installed via python3-lsp-server
if root_dirname then
  vim.lsp.start({
    name = 'pylsp',
    cmd = {'pylsp'},
    root_dir = root_dirname,
  })
end
