require 'file_copy'
local conkc_test_path = '\\\\qa-web\\PDS\\vista\\conkc\\Web\\'
local pacy_test_path = '\\\\hostweb2\\PDS\\vista\\PACY\\PACYTEST\\Web\\'
local kcdc_test_path = '\\\\pds-web02\\PDS\\Vista\\KCDC\\KCDCTEST\\Web\\'
local kcdc_prod_path = '\\\\pds-web02\\PDS\\Vista\\KCDC\\KCDCPROD\\Web\\'
local bhs_test_path = '\\\\hostweb2\\PDS\\Vista\\BHS\\BHSDEVL\\Web\\'
local cpu_test_path = '\\\\pds-web03\\PDS\\Vista\\CPU\\CPUTEST\\Web\\'
local remote_path = kcdc_prod_path

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

function GetCurrentFileAndDestinationPath()
  -- Get the current file path
  local current_file = vim.fn.expand '%:p'
  current_file = current_file:gsub('/', '\\')

  -- Define the destination path relative to the current file
  local destination = current_file
  destination = destination:gsub('C:\\source\\repos\\technical%-consulting%-vista%-web\\', remote_path)

  return current_file, destination
end

function TestPath()
  local current_file, destination = GetCurrentFileAndDestinationPath()

  -- Check if the destination file exists
  local file_exists = vim.fn.filereadable(destination) == 1

  -- Print the destination path and whether the file exists
  print(destination, file_exists and 'exists' or 'does not exist')
end

-- Define a function to save changes and copy the file to the desired location
function PullFromRemote()
  local current_file, destination = GetCurrentFileAndDestinationPath()

  -- Check if the destination file exists
  local file_exists = vim.fn.filereadable(destination) == 1

  if not file_exists then
    print('File ' .. destination .. ' does not exist.')
  else
    -- Copy the file to the destination
    vim.cmd('!copy "' .. destination .. '" "' .. current_file .. '"')

    vim.cmd ':e!'
  end
end

-- Define a function to save changes and copy the file to the desired location
function SaveAndCopy()
  -- Save changes if this isn't running in VSCode
  if not vim.g.vscode then
    vim.cmd ':w'
  end

  local current_file, destination = GetCurrentFileAndDestinationPath()

  -- Copy the file to the destination
  vim.cmd('!copy "' .. current_file .. '" "' .. destination .. '"')
end

-- Define a function to save changes and copy the file to the desired location
function TempSaveAndCopyTo()
  -- Save changes if this isn't running in VSCode
  if not vim.g.vscode then
    vim.cmd ':w'
  end

  local temp_path = 'C:\\temp\\live_code\\'

  -- Get the current file path
  local current_file = vim.fn.expand '%:p'
  current_file = current_file:gsub('/', '\\')

  -- Define the destination path relative to the current file
  local destination = current_file
  destination = destination:gsub('C:\\source\\repos\\technical%-consulting%-vista%-web\\', temp_path)

  -- Print the command
  --print("Copying file from: " .. current_file .. " to: " .. destination)

  -- Delete all directories in the temp path
  local destination_directory = destination:gsub('\\[^\\]*$', '')
  local cmd1 = 'del /s /q ' .. temp_path
  local cmd2 = 'rmdir /s /q ' .. temp_path
  local cmd3 = 'mkdir "' .. destination_directory .. '"'
  local cmd4 = 'copy "' .. current_file .. '" "' .. destination_directory .. '\\"'
  local cmd = '!' .. cmd1 .. ' && ' .. cmd2 .. ' && ' .. cmd3 .. ' && ' .. cmd4

  vim.cmd(cmd)
end

-- Define a custom command to call the function
vim.cmd ':command! SaveAndCopy lua SaveAndCopy()'
vim.cmd ':command! PullFromRemote lua PullFromRemote()'
vim.cmd ':command! TempSaveAndCopyTo lua TempSaveAndCopyTo()'
vim.cmd ':command! TestPath lua TestPath()'
vim.cmd ':command! CheckoutFromMain lua CheckoutFromMain(<f-args>)'
