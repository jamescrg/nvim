
return {
    'neovim/nvim-lspconfig',
    dependencies = {
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
    },
    config = function ()
        require('mason').setup({})
        require('mason-lspconfig').setup({
        handlers = {
            function(server_name)
            require('lspconfig')[server_name].setup({})
            end,
        },
        })
    end
}
