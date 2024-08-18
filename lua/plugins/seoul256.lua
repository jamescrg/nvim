

return {
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
}
