
return {
    "vim-scripts/vim-auto-save",
    config = function ()
        vim.cmd([[
            let g:auto_save = 1                     " autosave
            let g:auto_save_in_insert_mode = 0      " only autosave after leaving insert
        ]])
    end,
}
