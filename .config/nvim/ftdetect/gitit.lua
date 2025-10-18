--  set filetype of a gitit wikipage file (*.page)
--  based on pandoc metadata in the file
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.page",
  callback = function()
    local first_line = vim.fn.getline(1)
    if first_line:match("^%-%-%-$") then
      local second_line = vim.fn.getline(2)
      if second_line:match("^format:%s?[mM]arkdown$") then
        vim.bo.filetype = "markdown"
      elseif second_line:match("^format:%s?latex$") then
        vim.bo.filetype = "tex"
      elseif second_line:match("^format:%s?org$") then
        vim.bo.filetype = "org"
      elseif second_line:match("^format:%s?rst$") then
        vim.bo.filetype = "rst"
      end
    else
      -- default file type of gitit wikipage
      vim.bo.filetype = "markdown"
    end
  end,
})
