return {

    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup {}
        end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({})
        end
    },

    {
        'neovim/nvim-lspconfig',

        config=function()
            local nvim_lsp = require("lspconfig")
            local protocol = require('vim.lsp.protocol')
            local augroup_format = vim.api.nvim_create_augroup("Format", {clear = true})
            local enable_format_on_save = function(_, bufnr)
                vim.api.nvim_clear_autocmds({group = augroup_format, buffer = bufnr})
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup_format,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({bufnr = bufnr})
                    end
                })
            end
            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
            local on_attach = function(client, bufnr)
                local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
                -- Mappings.
                local opts = {noremap = true, silent = true}
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
                --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
                buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
                --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
            end
            -- Set up completion using nvim_cmp with LSP source
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- Disable Diagnostcs globally
            -- https://www.reddit.com/r/neovim/comments/gtta9p/neovim_lsp_how_to_disable_diagnostics/
            vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

            protocol.CompletionItemKind = {
                '', -- Text
                '', -- Method
                '', -- Function
                '', -- Constructor
                '', -- Field
                '', -- Variable
                '', -- Class
                'ﰮ', -- Interface
                '', -- Module
                '', -- Property
                '', -- Unit
                '', -- Value
                '', -- Enum
                '', -- Keyword
                '﬌', -- Snippet
                '', -- Color
                '', -- File
                '', -- Reference
                '', -- Folder
                '', -- EnumMember
                '', -- Constant
                '', -- Struct
                '', -- Event
                'ﬦ', -- Operator
                '', -- TypeParameter
            }

            nvim_lsp.pyright.setup {
                on_attach = on_attach,
                capabilities = capabilities
            }

            nvim_lsp.texlab.setup {
                on_attach = on_attach,
                capabilities = capabilities
            }
        end
    }
}
