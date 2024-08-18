

return {
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
}
