
-- ---------------------------------------------------
-- Settings
-- ---------------------------------------------------

vim.g.have_nerd_font = true                             -- if nerdfont is installed
vim.opt.laststatus = 2                                  -- always show status line
vim.opt.cursorline = true                               -- alwaysvim.opt.cursor line
vim.opt.ignorecase = true                               -- ignore case
vim.opt.smartcase = true                                -- except when an upper case character is used
vim.opt.swapfile = false                                -- no swap fileunknown option: --bashs
vim.opt.splitright =true                                -- open splits on the right
vim.opt.splitbelow = true                               -- open splits on bottom
vim.opt.foldmethod = "indent"                           -- fold behavior
vim.opt.foldlevel = 99                                  -- folds closed by default
vim.opt.expandtab = true                                -- inserts spaces when tab key is pressed
vim.opt.tabstop = 4                                     -- sets for spaces for tabs
vim.opt.softtabstop = 4                                 -- number of spaces removed by backspace key
vim.opt.shiftwidth = 4                                  -- sets number of spaces to insert/remove using indentation commands
vim.opt.shiftround = true                               -- use multiple of shiftwidth when indenting with '<' and '>'
vim.opt.undofile = true                                 -- persistent undo history
vim.opt.signcolumn = "number"                           -- prevent signs from opening another gutter
vim.opt.number = true                                   -- always show line numbers
vim.opt.relativenumber = true                           -- use relative line numbers
vim.opt.wrap = false                                    -- wrap lines
vim.opt.linebreak = true                                -- break at whitespace not words
vim.opt.scrolloff = 3                                   -- keep at least 5 lines visible above/below cursor



-- ---------------------------------------------------
-- Autocommands
-- ---------------------------------------------------

vim.cmd([[
    " auto remove trailing whitespace
    augroup whitespace
        " autocmd BufWritePre * :%s/\s\+$//e
    augroup end

    " tabs for css and html
    augroup css
        autocmd BufRead,BufNewFile *.html,*.css setlocal tabstop=2 shiftwidth=2 softtabstop=2
    augroup end

    " html mode
    augroup html
        autocmd BufRead,BufNewFile *.html setlocal filetype=htmldjango foldmethod=indent
    augroup end
]])


-- ---------------------------------------------------
-- Keymaps
-- ---------------------------------------------------

-- mapleaders
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require('maps')

-- escaping
Imap("jj", "<esc>")
Imap("jk", "<esc>")

-- exit vim
Nmap("<C-d>", ":q!<cr>")

-- scroll down
Nmap("<C-m>", "<C-d>")

-- close buffer
Nmap("<S-k>", ":bd<cr>")

-- window navigation
Nmap("<leader>v", ":vsp<cr>")
Nmap("<tab>", "<C-w>w")
Nmap("<S-tab>", "<C-w>W")
Nmap("<C-p>", "<C-i>")

-- clear highlighted search text until next explicit search or n/N
-- <silent> - so as to not print :noh on last line when invoked
Nmap("<esc>", ":noh<cr>")

-- vimgrep I like better than FZF ripgrep
Nmap("<C-f>", ":vimgrep '' **/*<left><left><left><left><left><left>")

-- quickfix window
Nmap("<leader>c", ":copen 10<cr>")
Nmap("[q", ":cprevious<cr>zz")
Nmap("]q", ":cnext<cr>zz")

-- code folding
Nmap(",", "za")

-- search for word under cursor, including first word
Nmap("*", "*N")

-- center search results as they come into focus
Nmap("n", "nzz")
Nmap("N", "Nzz")

-- search for visually selected text
vim.cmd([[
vnoremap * y/\V<C-R>=escape(@",'/\')<cr><cr>N
]])

-- shortcuts to edit configuation files
Nmap("<leader>ev", ":e $MYVIMRC<cr>")
Nmap("<leader>ep", ":e ~/.config/nvim/lua/plugins<cr>")
Nmap("<leader>es", ":e ~/.config/nvim/UltiSnips<cr>")

-- save as root
vim.cmd([[
    command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!
]])

-- lazygit
Nmap("<leader>lg", ":LazyGit<cr>")

-- fzf
-- Nmap("<leader>f", ":Files<cr>")
-- Nmap("<leader>b", ":Buffers<cr>")
-- Nmap("<leader>r", ":Rg<cr>")

require("config.lazy")
