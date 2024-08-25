
local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function Nmap(shortcut, command)
  map('n', shortcut, command)
end

function Imap(shortcut, command)
  map('i', shortcut, command)
end

function Vmap(shortcut, command)
  map('v', shortcut, command)
end
