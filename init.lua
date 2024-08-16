

-- ---------------------------------------------------
-- Plugins
-- ---------------------------------------------------

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- colorscheme
Plug('junegunn/seoul256.vim')
Plug('https://github.com/junegunn/vim-easy-align.git')

-- fzf
Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })
Plug('junegunn/fzf.vim')

--autosave
Plug('vim-scripts/vim-auto-save')

-- the tim pope collection
Plug('tpope/vim-vinegar')
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
Plug('neovim/nvim-lspconfig')
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')

-- autocomplete
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/nvim-cmp')

-- snippets
Plug('SirVer/ultisnips')
Plug('quangnguyen30192/cmp-nvim-ultisnips')

-- other
Plug('kdheepak/lazygit.nvim')
Plug('junegunn/vim-peekaboo')
Plug('kalekundert/vim-coiled-snddake')

vim.call('plug#end')


-- ---------------------------------------------------
-- Colorscheme
-- ---------------------------------------------------

vim.cmd([[
    " Range 252 (darkest) - 256 (listest)
    " Default 253
    let g:seoul256_background = 254
    silent! colorscheme seoul256-light

    " status line
    hi StatusLine ctermbg=2 ctermfg=250
    hi StatusLineNC ctermbg=253 ctermfg=248
    set statusline=
    set statusline+=\ %f
    set statusline+=%=
    set statusline+=%{fugitive#statusline()}
    set statusline+=%=
    set statusline+=\ %l:%c

    " popup menu
    hi Pmenu ctermbg=253 ctermfg=5
    hi PmenuSel ctermbg=5 ctermfg=253

    let g:auto_save = 1                     " autosave
    let g:auto_save_in_insert_mode = 0      " only autosave after leaving insert

]])


-- ---------------------------------------------------
-- Settings
-- ---------------------------------------------------

vim.g.auto_save = 1
vim.g.auto_save_in_insert_mode = 0

vim.g.UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"

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
Nmap("<leader>so", ":source %<cr>")
Nmap("<leader>es", ":e ~/.config/nvim/UltiSnips<cr>")

-- save as root
vim.cmd([[
    command W :execute! ':silent w !sudo tee % > /dev/null' | :edit!
]])

-- auto close pairs when on separate lines
Nmap("{<cr>", "{<cr>}<esc>O")
Nmap("[<cr>", "[<cr>]<esc>O")
Nmap("(<cr>", "(<cr>)<esc>O")

-- lazygit
Nmap("<leader>lg", ":LazyGit<cr>")

-- fzf
Nmap("<leader>f", ":Files<cr>")
Nmap("<leader>b", ":Buffers<cr>")
Nmap("<leader>r", ":Rg<cr>")



-- ---------------------------------------------------
-- Mason
-- ---------------------------------------------------

require('mason').setup({})
require('mason-lspconfig').setup({
handlers = {
    function(server_name)
	    require('lspconfig')[server_name].setup({})
    end
}
})


-- ---------------------------------------------------
-- Autocomplete
-- ---------------------------------------------------

local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
local cmp = require('cmp')
local source_map = {
    buffer = "Buffer",
    nvim_lsp = "LSP",
    path = "Path",
}
cmp.setup({
    snippet = {
        expand = function(args)
          vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    sources = {
        { name = "ultisnips" },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lsp' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({select = false}),

        ['<C-Space>'] = cmp.mapping.complete(),

        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
            end
        end, {"i", "s"}),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                cmp_ultisnips_mappings.jump_backwards(fallback)
            end
        end, {"i", "s"}),
    }),
})
