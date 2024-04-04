require("theprimeagen.set")
require("theprimeagen.remap")
require("theprimeagen.packer")

-- Define a function to save changes and copy the file to the desired location
function SaveAndCopy()
    -- Save changes
    vim.cmd(":w")

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

