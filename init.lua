
-- -------------------------------------------------------
-- Mapleaders
-- -------------------------------------------------------

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


-- -------------------------------------------------------
-- Settings
-- -------------------------------------------------------

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
vim.opt.scrolloff = 5                       -- keep at least 5 lines visible above/below cursor

-- -------------------------------------------------------
-- Core Keymaps
-- -------------------------------------------------------

-- -- escaping
vim.api.nvim_set_keymap("i", "jj", "<esc>",{ noremap = true })
vim.api.nvim_set_keymap("i", "jk", "<esc>",{ noremap = true })

-- exit vim
vim.api.nvim_set_keymap("n", "<C-d>", ":q!<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "QQ", ":q!<cr>", { noremap = true })

-- close buffer
vim.api.nvim_set_keymap("n", "<S-k>", ":bd<cr>", { noremap=true })

-- window navigation
vim.api.nvim_set_keymap("n", "<leader>v", ":vsp<cr>", { noremap=true })
vim.api.nvim_set_keymap("n", "<tab>", "<C-w>w", { noremap=true })
vim.api.nvim_set_keymap("n", "<S-tab>", "<C-w>W", { noremap=true })

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
vim.api.nvim_set_keymap("n", ", ", "za", { noremap=true })

-- search for word under cursor, including first word
vim.api.nvim_set_keymap("n", "*", "*N", { noremap=true })

-- center search results as they come into focus
vim.api.nvim_set_keymap("n", "n", "nzz", { noremap=true })
vim.api.nvim_set_keymap("n", "N", "Nzz", { noremap=true })

-- search for visually selected text
-- vnoremap * y/\V<C-R>=escape(@",'/\')<cr><cr>N
vim.api.nvim_set_keymap("n", "*", "", { noremap=true })

-- shortcuts to edit configuation files
vim.api.nvim_set_keymap("n", "<leader>ev", ":e $MYVIMRC<cr>", { noremap=true })
vim.api.nvim_set_keymap("n", "<leader>eV", ":e ~/.vim/vimrc<cr>", { noremap=true })
vim.api.nvim_set_keymap("n", "<leader>so", ":so %<cr>", { noremap=true })
vim.api.nvim_set_keymap("n", "<leader>ed", ":e ~/.dotfiles<cr>", { noremap=true })

-- save as root
vim.cmd([[
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
]])

-- search for visually selected text
vim.cmd([[
vnoremap * y/\V<C-R>=escape(@",'/\')<cr><cr>N
]])

-- auto close pairs when on separate lines
vim.api.nvim_set_keymap("n", "{<cr>", "{<cr>}<esc>O", { noremap=true })
vim.api.nvim_set_keymap("n", "[<cr>", "[<cr>]<esc>O", { noremap=true })
vim.api.nvim_set_keymap("n", "(<cr>", "(<cr>)<esc>O", { noremap=true })

-- insert a breakpoint
vim.api.nvim_set_keymap("n", "<leader>p", "oimport pudb; pu.db<esc>", { noremap=true })


-- -------------------------------------------------------
-- Plugins
-- -------------------------------------------------------

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
    -- add your plugins here
    { "tpope/vim-vinegar" },
    { "tpope/vim-fugitive" },
    { "tpope/vim-commentary" },
    { "tpope/vim-surround" },
    { "tpope/vim-repeat" },
    { "tpope/vim-abolish" },
    { "valloric/MatchTagAlways" },
    { "kalekundert/vim-coiled-snake" },
    {
        "vim-scripts/vim-auto-save",
        config = function ()
            vim.cmd([[
                let g:auto_save = 1                     " autosave
                let g:auto_save_in_insert_mode = 0      " only autosave after leaving insert
            ]])
        end,
    },
    {
        "junegunn/seoul256.vim",
        lazy = false,
        priority = 10000,
        config = function ()
            vim.cmd([[

                " Range 252 (darkest) - 256 (listest)
                " Default 253
                let g:seoul256_background = 254
                colorscheme seoul256-light

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
        end,
    },
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
      },
        config = function ()
            require('telescope').setup {
                -- You can put your default mappings / updates / etc. in here
                --  All the info you're looking for is in `:help telescope.setup()`
                --
                -- defaults = {
                --   mappings = {
                --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
                --   },
                -- },
                -- pickers = {}
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown(),
                    },
                },
            }

            -- Enable Telescope extensions if they are installed
            pcall(require('telescope').load_extension, 'fzf')
            pcall(require('telescope').load_extension, 'ui-select')
            vim.cmd([[
                nnoremap <leader>f <cmd>Telescope find_files<cr>
                nnoremap <leader>r <cmd>Telescope live_grep<cr>
                nnoremap <leader>b <cmd>Telescope buffers<cr>
            ]])
        end,

    },
  },

  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "seoul256-light" } },

  -- automatically check for plugin updates
  checker = { enabled = true },

})

