return {
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    -- theme = 'modus-vivendi',
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = true,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    }
                },
                sections = {
                    lualine_a = { 'filename' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = { 'filesize', 'fileformat', 'filetype' },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }
        end
    },

    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        opts = {
            options = {
                mode = "tabs",
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local icon = level:match("error") and " " or " "
                    return " " .. icon .. count
                end,
                indicator = {
                    icon = '▎', -- this should be omitted if indicator style is not 'icon'
                    -- style = 'icon' | 'underline' | 'none',
                    style = "icon",
                },
                show_buffer_close_icons = false,
                show_close_icon = false,
                enforce_regular_tabs = true,
                show_duplicate_prefix = false,
                tab_size = 16,
                padding = 0,
                separator_style = "thick",
            }
        }
    },

    {
        "lukas-reineke/virt-column.nvim",
        config = function()
            vim.cmd "highlight clear ColorColumn"
            require "virt-column".setup {char = "│"}
            vim.cmd "highlight VirtColumn guifg=#2f2f30"
        end
    },

    {
        'DanilaMihailov/beacon.nvim',
        config = function()
            vim.g.beacon_shrink = 0
            vim.g.beacon_fade = 0
            vim.g.beacon_timeout = 200
        end
    }
}
