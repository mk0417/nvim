return {
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end
    },

    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup {}
        end
    },

    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup {}
        end
    }
}
