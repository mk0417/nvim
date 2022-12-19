return function()
    local bufferline = require("bufferline")

    bufferline.setup({
        options = {
            mode = "tabs",
            numbers = "ordinal",
            separator_style = 'thick',
            always_show_bufferline = false,
            show_buffer_close_icons = false,
            show_close_icon = false,
            color_icons = true,
            indicator = {
                style = 'underline'
            }
        },
        highlights = {
            separator = {
                fg = '#073642',
                bg = '#002b36'
            },
            separator_selected = {
                fg = '#073642'
            },
            background = {
                fg = '#657b83',
                bg = '#002b36'
            },
            buffer_selected = {
                fg = '#fdf6e3',
                bold = true
            },
            fill = {
                bg = '#073642'
            }
        }
    })
end
