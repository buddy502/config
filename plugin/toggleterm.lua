require("toggleterm").setup({
  size = 20,
  border = 'double',
  direction = 'vertical',
  function(term)
    if term.direction == "horizontal" then
      return 20
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.7
    end
  end,
})
