require("toggleterm").setup({
  size = 10,
  border = 'double',
  direction = 'horizontal',
  function(term)
    if term.direction == "horizontal" then
      return 10
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.6
    end
  end,
})
