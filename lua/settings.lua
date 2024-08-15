
vim.g.have_nerd_font = true                 -- if nerdfont is installed
vim.opt.encoding = "utf-8"                  -- sets encoding
vim.opt.laststatus = 2                      -- always show status line
vim.opt.cursorline = true                   -- alwaysvim.opt.cursor line
vim.opt.ignorecase = true                   -- ignore case
vim.opt.smartcase = true                    -- except when an upper case character is used
vim.opt.incsearch = true                    -- start searching as it is typed
vim.opt.hlsearch = true                     -- highlight search patterns
vim.opt.mouse = "a"                         -- enable mouse usage
vim.opt.swapfile = false                    -- no swap files
vim.opt.splitright =true                    -- open splits on the right
vim.opt.splitbelow = true                   -- open splits on bottom
vim.opt.foldmethod = "indent"               -- fold behavior
vim.opt.foldlevel = 99                      -- folds closed by default
vim.opt.expandtab = true                    -- inserts spaces when tab key is pressed
vim.opt.tabstop = 4                         -- sets for spaces for tabs
vim.opt.softtabstop = 4                     -- number of spaces removed by backspace key
vim.opt.shiftwidth = 4                      -- sets number of spaces to insert/remove using indentation commands
vim.opt.autoindent = true                   -- autoindent
vim.opt.shiftround = true                   -- use multiple of shiftwidth when indenting with '<' and '>'
vim.opt.backspace = "indent,eol,start"      -- backspace
vim.opt.ttimeoutlen = 50                    -- elminiate delay in escaping out of fzf
vim.opt.undofile = true                     -- persistent undo history
vim.opt.signcolumn = "number"               -- prevent signs from opening another gutter
vim.opt.number = true                       -- always show line numbers
vim.opt.relativenumber = true               -- use relative line numbers
vim.opt.wrap = false                        -- wrap lines
vim.opt.linebreak = true                    -- break at whitespace not words
vim.opt.scrolloff = 3                       -- keep at least 5 lines visible above/below cursor


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

