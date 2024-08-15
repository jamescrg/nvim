
-- mapleaders
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- escaping
vim.api.nvim_set_keymap("i", "jj", "<esc>",{ noremap = true })
vim.api.nvim_set_keymap("i", "jk", "<esc>",{ noremap = true })

-- exit vim
vim.api.nvim_set_keymap("n", "<C-d>", ":q!<cr>", { noremap = true })

-- scroll down
vim.api.nvim_set_keymap("n", "<C-m>", "<C-d>", { noremap = true })

-- close buffer
vim.api.nvim_set_keymap("n", "<S-k>", ":bd<cr>", { noremap=true })

-- window navigation
vim.api.nvim_set_keymap("n", "<leader>v", ":vsp<cr>", { noremap=true })
vim.api.nvim_set_keymap("n", "<tab>", "<C-w>w", { noremap=true })
vim.api.nvim_set_keymap("n", "<S-tab>", "<C-w>W", { noremap=true })
vim.api.nvim_set_keymap("n", "<C-p>", "<C-i>", { noremap=true })

-- clear highlighted search text until next explicit search or n/N
-- <silent> - so as to not print :noh on last line when invoked
vim.api.nvim_set_keymap("n", "<esc>", ":noh<cr>", { noremap=true, silent=true })

-- vimgrep I like better than FZF ripgrep
vim.api.nvim_set_keymap("n", "<C-f>", ":vimgrep '' **/*<left><left><left><left><left><left>", { noremap=true })

-- quickfix window
vim.api.nvim_set_keymap("n", "<leader>c", ":copen 10<cr>", { noremap=true })
vim.api.nvim_set_keymap("n", "[q", ":cprevious<cr>zz", { noremap=true })
vim.api.nvim_set_keymap("n", "]q", ":cnext<cr>zz", { noremap=true })

-- code folding
vim.api.nvim_set_keymap("n", ",", "za", { noremap=true })

-- search for word under cursor, including first word
vim.api.nvim_set_keymap("n", "*", "*N", { noremap=true })

-- center search results as they come into focus
vim.api.nvim_set_keymap("n", "n", "nzz", { noremap=true })
vim.api.nvim_set_keymap("n", "N", "Nzz", { noremap=true })

-- search for visually selected text
vim.cmd([[
vnoremap * y/\V<C-R>=escape(@",'/\')<cr><cr>N
]])

-- shortcuts to edit configuation files
vim.api.nvim_set_keymap("n", "<leader>ev", ":e $MYVIMRC<cr>", { noremap=true })
vim.api.nvim_set_keymap("n", "<leader>ek", ":e ~/.config/nvim/lua/keymaps.lua<cr>", { noremap=true })
vim.api.nvim_set_keymap("n", "<leader>es", ":e ~/.config/nvim/lua/settings.lua<cr>", { noremap=true })
vim.api.nvim_set_keymap("n", "<leader>ep", ":e ~/.config/nvim/lua/plugins<cr>", { noremap=true })

-- save as root
vim.cmd([[
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
]])

-- auto close pairs when on separate lines
vim.api.nvim_set_keymap("n", "{<cr>", "{<cr>}<esc>O", { noremap=true })
vim.api.nvim_set_keymap("n", "[<cr>", "[<cr>]<esc>O", { noremap=true })
vim.api.nvim_set_keymap("n", "(<cr>", "(<cr>)<esc>O", { noremap=true })

-- insert a breakpoint
vim.api.nvim_set_keymap("n", "<leader>p", "oimport pudb; pu.db<esc>", { noremap=true })
