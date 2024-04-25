function CheckoutFromMain(commit_id)
  -- Determine the HEAD of the main branch if commit_id is not provided
  if commit_id == nil or commit_id == '' then
    -- Get the HEAD of the 'main' branch using git command
    local handle = io.popen 'git rev-parse main'
    commit_id = handle:read('*a'):gsub('\n', '')
    handle:close()
  end

  -- Get the current file path
  local current_file = vim.fn.expand '%:p'

  -- Print the command for debugging (optional)
  print('Checking out file from commit ID: ' .. commit_id)
  print('Current file path: ' .. current_file)

  -- Execute the git checkout command to checkout the file from the specified commit ID
  local command = string.format('git checkout %s -- "%s"', commit_id, current_file)
  print(command)
  local result = vim.fn.system(command)

  -- Print the result of the git checkout command (optional)
  print(result)

  vim.cmd ':e!'
end

vim.cmd ':command! CheckoutFromMain lua CheckoutFromMain(<f-args>)'
