

return {
    'vim-scripts/vim-auto-save',
    config = function()
        vim.g.auto_save = 1
        vim.g.auto_save_in_insert_mode = 0
    end
}
