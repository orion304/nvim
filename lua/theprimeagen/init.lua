require("theprimeagen.set")
require("theprimeagen.remap")

if not vim.g.vscode then
    require("theprimeagen.packer")
end

-- Define a function to save changes and copy the file to the desired location
function SaveAndCopy()
    -- Save changes if this isn't running in VSCode
    if not vim.g.vscode then
        vim.cmd(":w")
    end

    -- Get the current file path
    local current_file = vim.fn.expand('%:p')

    -- Define the destination path relative to the current file
    local destination = current_file:gsub('/', '\\')
    destination = destination:gsub('C:\\source\\repos\\technical%-consulting%-vista%-web\\', '\\\\pds-web02\\PDS\\Vista\\KCDC\\KCDCTEST\\Web\\')

    -- Print the command
    --print("Copying file from: " .. current_file .. " to: " .. destination)

    -- Copy the file to the destination
    vim.cmd("!copy \"" .. current_file .. "\" \"" .. destination .. "\"")
end

-- Define a custom command to call the function
vim.cmd(":command! SaveAndCopy lua SaveAndCopy()")
