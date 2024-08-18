

return {
    'stevearc/oil.nvim',
    enabled = false,
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
}
