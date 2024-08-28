

-- ---------------------------------------------------
-- Plugins
-- ---------------------------------------------------

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- colorscheme
Plug('junegunn/seoul256.vim')

-- fzf
Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })
Plug('junegunn/fzf.vim')

-- files
Plug('vim-scripts/vim-auto-save')
Plug('tpope/vim-vinegar')
Plug('farmergreg/vim-lastplace')

-- the tim pope collection
Plug('tpope/vim-fugitive')
Plug('tpope/vim-commentary')
Plug('tpope/vim-surround')
Plug('tpope/vim-repeat')
Plug('tpope/vim-abolish')

-- dadbod
Plug('tpope/vim-dadbod')
Plug('kristijanhusak/vim-dadbod-ui')
Plug('kristijanhusak/vim-dadbod-completion')

-- lsp
Plug('folke/lsp-colors.nvim')
Plug('neovim/nvim-lspconfig')
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')

-- autocomplete
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/nvim-cmp')

-- extra linting
Plug('dense-analysis/ale')

-- snippets
Plug('SirVer/ultisnips')
Plug('quangnguyen30192/cmp-nvim-ultisnips')

-- other
Plug('kdheepak/lazygit.nvim')
Plug('junegunn/vim-peekaboo')
Plug('kalekundert/vim-coiled-snake')
Plug('justinmk/vim-sneak')
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-lualine/lualine.nvim')
Plug('windwp/nvim-autopairs')
Plug('folke/which-key.nvim')
Plug('NvChad/nvim-colorizer.lua')
Plug('vim-test/vim-test')

vim.call('plug#end')


-- ---------------------------------------------------
-- Colorscheme
-- ---------------------------------------------------

vim.cmd([[
    " Range 252 (darkest) - 256 (listest)
    " Default 253
    set termguicolors
    let g:seoul256_background = 254
    silent! colorscheme seoul256-light

    " status line
    hi StatusLine guibg=#47447 guifg=#d5d5d5
    hi StatusLineNC guibg=#47447 guifg=#d5d5d5
    set statusline=
    set statusline+=\ %f
    set statusline+=%=
    set statusline+=%{fugitive#statusline()}
    set statusline+=%=
    set statusline+=\ %l:%c

    " popup menu
    hi Pmenu ctermbg=253 ctermfg=5
    hi PmenuSel ctermbg=5 ctermfg=253

]])


-- ---------------------------------------------------
-- Settings
-- ---------------------------------------------------


vim.g.have_nerd_font = true                             -- if nerdfont is installed
vim.opt.encoding = "utf-8"                              -- sets encoding
vim.opt.laststatus = 2                                  -- always show status line
vim.opt.cursorline = true                               -- alwaysvim.opt.cursor line
vim.opt.ignorecase = true                               -- ignore case
vim.opt.smartcase = true                                -- except when an upper case character is used
vim.opt.incsearch = true                                -- start searching as it is typed
vim.opt.hlsearch = true                                 -- highlight search patterns
vim.opt.mouse = "a"                                     -- enable mouse usage
vim.opt.swapfile = false                                -- no swap files
vim.opt.splitright =true                                -- open splits on the right
vim.opt.splitbelow = true                               -- open splits on bottom
vim.opt.foldmethod = "indent"                           -- fold behavior
vim.opt.foldlevel = 99                                  -- folds closed by default
vim.opt.expandtab = true                                -- inserts spaces when tab key is pressed
vim.opt.tabstop = 4                                     -- sets for spaces for tabs
vim.opt.softtabstop = 4                                 -- number of spaces removed by backspace key
vim.opt.shiftwidth = 4                                  -- sets number of spaces to insert/remove using indentation commands
vim.opt.autoindent = true                               -- autoindent
vim.opt.shiftround = true                               -- use multiple of shiftwidth when indenting with '<' and '>'
vim.opt.backspace = "indent,eol,start"                  -- backspace
vim.opt.ttimeoutlen = 50                                -- elminiate delay in escaping out of fzf
vim.opt.undofile = true                                 -- persistent undo history
vim.opt.signcolumn = "number"                           -- prevent signs from opening another gutter
vim.opt.number = true                                   -- always show line numbers
vim.opt.relativenumber = true                           -- use relative line numbers
vim.opt.wrap = false                                    -- wrap lines
vim.opt.linebreak = true                                -- break at whitespace not words
vim.opt.scrolloff = 3                                   -- keep at least 5 lines visible above/below cursor

vim.cmd([[
    set wildignore+=tags,.git/**
    set wildignore+=**/migrations/**
    set wildignore+=**/__pycache__/**
    set wildignore+=static/bootstrap-3.3.7/**,static/images/**
    set wildignore+=static/admin/**
    set wildignore+=logs/**
    set wildignore+=config/asgi.py
]])


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

    " return to last place in file
    "augroup lastplace
        "autocmd BufReadPost * silent! normal! g`"z 
    "augroup end

]])


-- ---------------------------------------------------
-- Keymaps
-- ---------------------------------------------------

-- mapleaders
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require('mapfunctions')

-- escaping
Imap("jj", "<esc>")
Imap("jk", "<esc>")

-- exit vim
Nmap("<C-d>", ":q!<cr>")
Nmap("<leader>q", ":q!<cr>")

-- faster movement
Nmap("H", "^")
Nmap("J", "<C-d>")
Nmap("K", "<C-u>")
Nmap("L", "$")
Vmap("H", "^")
Vmap("J", "<C-d>")
Vmap("K", "<C-u>")
Vmap("L", "$")

-- close buffer
Nmap("<leader>k", ":bd<cr>")

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
Nmap("<leader>so", ":source %<cr>")
Nmap("<leader>es", ":e ~/.config/nvim/UltiSnips<cr>")
Nmap("<leader>ed", ":e ~/.dotfiles<cr>")
Nmap("<leader>en", ":e ~/.config/nvim<cr>")

-- save as root
vim.cmd([[
    command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!
]])

-- auto close pairs when on separate lines
Nmap("{<cr>", "{<cr>}<esc>O")
Nmap("[<cr>", "[<cr>]<esc>O")
Nmap("(<cr>", "(<cr>)<esc>O")


-- ---------------------------------------------------
-- Plugin Customization
-- ---------------------------------------------------

-- Autosave
vim.g.auto_save = 1
vim.g.auto_save_in_insert_mode = 0

-- Mason
require('mason').setup({})
require('mason-lspconfig').setup({
handlers = {
    function(server_name)
	    require('lspconfig')[server_name].setup({})
    end
}
})

-- Autopairs
require("nvim-autopairs").setup({
     event = "InsertEnter",
    config = true
})

-- Cmp
require('autocomplete')

-- Lualine
require('lualinesetup')

-- Oil
-- require("oil").setup({
--     skip_confirm_for_simple_edits = true,
-- })
-- vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Fzf
Nmap("<leader>f", ":Files<cr>")
Nmap("<leader>b", ":Buffers<cr>")
Nmap("<leader>r", ":Rg<cr>")
Nmap("<leader>h", ":History<cr>")

-- Lazygit
Nmap("<leader>lg", ":LazyGit<cr>")

-- Ale
vim.g.ale_completion_enabled = 0
vim.g.ale_enabled = 0
vim.cmd([[
  autocmd BufEnter *.css ALEEnable
  autocmd BufEnter colors.css ALEDisable
]])

-- Ultisnips
vim.g.UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"

require 'colorizer'.setup()
