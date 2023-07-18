return {
    "folke/which-key.nvim",

    config=function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300

        local wk = require("which-key")

        wk.setup({
            plugins = {
                marks = false,
                registers = false,
                presets = {
                    operators = false, -- adds help for operators like d, y, ...
                    motions = false, -- adds help for motions
                    text_objects = false, -- help for text objects triggered after entering an operator
                    windows = true, -- default bindings on <c-w>
                    nav = true, -- misc bindings to work with windows
                    z = false, -- bindings for folds, spelling and others prefixed with z
                    g = false, -- bindings for prefixed with g
                },
            },
            triggers_blacklist = {
                i,
                v,
                c
            },
        }
        )
    end
}
