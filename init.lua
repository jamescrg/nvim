
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
Nmap("<leader>so", ":source %<cr>")
Nmap("<leader>es", ":e ~/.config/nvim/UltiSnips<cr>")

-- save as root
vim.cmd([[
    command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!
]])

-- lazygit
Nmap("<leader>lg", ":LazyGit<cr>")

-- fzf
Nmap("<leader>f", ":Files<cr>")
Nmap("<leader>b", ":Buffers<cr>")
Nmap("<leader>r", ":Rg<cr>")


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    {
        'junegunn/seoul256.vim' ,
        lazy = false,
        priority = 1000,
        config = function()
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

            ]])
        end
    },
    { 'sainnhe/everforest' },
    {
        'nvim-telescope/telescope.nvim',
        config = function()
            require("telescope").setup {
                pickers = {
                    find_files = {
                    theme = "ivy",
                    }
                },
            }
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>f', builtin.find_files, {})
            vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>b', builtin.buffers, {})
        end
    },
    {
        'vim-scripts/vim-auto-save',
        config = function()
            vim.g.auto_save = 1
            vim.g.auto_save_in_insert_mode = 0
        end
    },
    {
        'stevearc/oil.nvim',
        config = function ()
            require("oil").setup({
                default_file_explorer = true,
                columns = {
                    "icon",
                    -- "permissions",
                    -- "size",
                    -- "mtime",
                },
                view_options = {
                    show_hidden = true,
                },
                skip_confirm_for_simple_edits = true,
            })
            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        end
    },
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-commentary' },
    { 'tpope/vim-surround' },
    { 'tpope/vim-repeat' },
    { 'tpope/vim-abolish' },
    { 'tpope/vim-dadbod' },
    { 'kristijanhusak/vim-dadbod-ui' },
    { 'kristijanhusak/vim-dadbod-completion' },
    { 'neovim/nvim-lspconfig' },
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup({})
            require('mason-lspconfig').setup({
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end
            }
            })
        end
    },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
            local cmp = require('cmp')
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
            end,
    },
    {
        'SirVer/ultisnips',
        config = function ()
            vim.g.UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"
        end
    },
    { 'quangnguyen30192/cmp-nvim-ultisnips' },
    { 'kdheepak/lazygit.nvim' },
    { 'junegunn/vim-peekaboo' },
    { 'nvim-tree/nvim-web-devicons' },
    {
        'windwp/nvim-autopairs',
        config = function ()
            require("nvim-autopairs").setup {}
        end
    },
    { 'kalekundert/vim-coiled-snake' },
    { 'nvim-treesitter/nvim-treesitter' },
  },

  install = { colorscheme = { "seoul256-light" } },

  -- automatically check for plugin updates
  checker = { enabled = true },
})
