return function()
    local cmp = require('cmp')

    local kind_icons = {
        Text = "",
        Method = "m",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = ""
    }

    cmp.setup({
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true
            }),
        }),
        sources = cmp.config.sources({
            {name = 'nvim_lsp'},
            {name = 'buffer'},
            {name = 'path'}
        }),
        formatting = {
            fields = {'kind', 'abbr', 'menu'},
            format = function(entry, vim_item)
                vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
                vim_item.menu = ({
                    lsp = '[LSP]',
                    buffer = '[Buffer]',
                    path = '[Path]'
                })[entry.source.name]
                return vim_item
            end
        }
    })
    
    vim.cmd [[
    set completeopt=menuone,noinsert,noselect
    highlight! default link CmpItemKind CmpItemMenuDefault
    ]]
end
