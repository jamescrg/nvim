

return {
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason-lspconfig.nvim' },
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
    { 'folke/lsp-colors.nvim' }

}
