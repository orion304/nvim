function ConvertTablesToFieldGroupDivs()
  vim.cmd '%s#<table.\\{-}>#<div class="FieldGroup">#g'
  vim.cmd '%s#</table>#</div>#g'
end

function ConvertTableRowsToRowWrapperDivs()
  vim.cmd '%s#<tr.\\{-}>#<div class="RowWrapper">#g'
  vim.cmd '%s#</tr>#</div>#g'
end

function DeleteTableDetails()
  vim.cmd '%s#</\\{-}td.\\{-}>##g'
end

vim.keymap.set('n', '<leader>pt', ':lua ConvertTablesToFieldGroupDivs()<CR>')
vim.keymap.set('n', '<leader>pr', ':lua ConvertTableRowsToRowWrapperDivs()<CR>')
vim.keymap.set('n', '<leader>pd', ':lua DeleteTableDetails()<CR>')
