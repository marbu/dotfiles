--
-- new file skeleton templates
--

local skeleton = vim.api.nvim_create_augroup('skeleton', { clear = true })

vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = '*.[a-zA-Z0-9]\\+',
  callback = function(ev)
    command = 'silent! 0r ' .. vim.fn.expand('$HOME') .. '/.vim/skeleton/skeleton.' .. vim.fn.expand('<amatch>:t:e')
    vim.cmd(command)
  end,
  group = skeleton,
})
