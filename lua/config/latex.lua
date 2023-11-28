return {
    'lervag/vimtex',

    config = function()
        local g = vim.g
        local map = vim.api.nvim_set_keymap

        g.vimtex_view_enabled = 1
        g.vimtex_view_method = 'skim'
        g.vimtex_compiler_latexmk = { options = { '-shell-escape' } }

        map('n', ';tt', ':VimtexCompile<CR>', {})
        map('n', ';tv', ':VimtexView<CR>', {})
    end
}
