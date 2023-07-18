return {
    "dccsillag/magma-nvim",
    build = "UpdateRemotePlugins",

    config=function()
        local g = vim.g
        local map = vim.api.nvim_set_keymap

        map('n', ';jj', ':MagmaInit<CR>', {})
        map('n', ';jr', ':MagmaEvaluateLine<CR>', {})
        map('x', ';jr', ':<C-u>MagmaEvaluateVisual<CR>', {})
        map('n', ';jo', ':MagmaShowOutput<CR>', {})
        map('n', ';jI', ':MagmaInterrupt', {})
        map('n', ';ji', ':noautocmd MagmaEnterOutput', {})
    end
}

