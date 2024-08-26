

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
    opts = {
        debounce = 20,
        throttle = 10,
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
