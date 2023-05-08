--[[
-- This is a trash workaround for copying from wsl to windows clipboard.
-- For me (ie. with this config), pasting from windows clipboard to wsl work fine. 
-- But copying from wsl to windows clipboard doesn't work.
--
-- This is a workaround for that. Also yeah, vim's solution doesn't work.
-- Since powershell.exe causes rendering issues while pasting text.
--]]
function _G.copy_to_clipboard()
  -- Grab the current position
  -- getpos returns: []
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  -- Grab the current line.
  -- The lines are in the form of an array, ["", ""]
  local lines = vim.fn.getline(start_pos[2], end_pos[2])
  if lines ~= nil and #lines > 0 then
    lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
    lines[1] = string.sub(lines[1], start_pos[3])
    local text = table.concat(lines, "\n")
    -- todo: make it system aware. :
    vim.fn.system('clip.exe', text)
  end
end


-- This is the caller for the helper function copy_to_clipboard().
  vim.cmd([[
  augroup CopyToClipboard
  autocmd!
  autocmd TextYankPost * if v:event.operator == 'y' && v:event.visual | execute 'lua copy_to_clipboard()' | endif
  augroup END
  ]])


