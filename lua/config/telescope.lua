local m = { noremap = true, nowait = true }
local M = {}
local map = vim.keymap.set

M.config = {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "LukasPietzschmann/telescope-tabs",
                config = function()
                    local tstabs = require('telescope-tabs')
                    tstabs.setup({
                    })
                    map('n', '<leader>tt', tstabs.list_tabs, {})
                end
            },
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            "nvim-telescope/telescope-file-browser.nvim"
        },
        config = function()
            local builtin = require('telescope.builtin')
            map('n', '<leader>fr', builtin.oldfiles, m)
            map('n', '<leader>ss', builtin.current_buffer_fuzzy_find, m)
            map('n', '<leader>bb', builtin.buffers, m)
            map('n', '<leader>sp', builtin.live_grep, m)
            map('n', '<leader>sa', builtin.grep_string, m)
            map('n', '<leader>pf', builtin.git_files, m)
            map('n', '<leader>gs', builtin.git_status, m)
            map('n', ';;', builtin.resume, m)

            -- vim.keymap.set('n', 'gd', builtin.lsp_definitions, m)
            -- vim.keymap.set('n', '<c-t>', builtin.lsp_document_symbols, {})

            local ts = require('telescope')
            local actions = require('telescope.actions')
            local fb_actions = require "telescope".extensions.file_browser.actions
            M.ts = ts
            ts.setup({
                defaults = {
                    preview = false,
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--fixed-strings",
                        "--smart-case",
                        "--trim",
                    },
                    layout_config = {
                        width = 0.7,
                        height = 0.3,
                    },
                    initial_mode = "insert",
                    mappings = {
                        n = {
                            ["q"] = actions.close,
                            ["<C-g>"] = actions.close
                        },
                        i = {
                            ["<C-h>"] = "which_key",
                            ["<C-g>"] = "close",
                        }
                    },
                    color_devicons = true,
                    prompt_prefix = "🔍 ",
                    selection_caret = " ",
                    path_display = { "truncate" },
                },
                pickers = {
                    buffers = {
                        show_all_buffers = true,
                        sort_lastused = true,
                        mappings = {
                            i = {
                                ["<c-d>"] = actions.delete_buffer,
                            },
                        }
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                    file_browser = {
                        theme = "dropdown",
                        -- Disables netrw and use telescope-file-browser in its place
                        hijack_netrw = true,
                        mappings = {
                            ["i"] = {
                                ["<C-w>"] = function() vim.cmd('normal vbd') end
                            },
                            ["n"] = {
                                ["N"] = fb_actions.create,
                                ["h"] = fb_actions.goto_parent_dir,
                                ["/"] = function()
                                    vim.cmd('startinsert')
                                end
                            }
                        }
                    },
                    command_palette = command_palette,
                }
            })

            ts.load_extension("file_browser")
            ts.load_extension('telescope-tabs')
            ts.load_extension('fzf')
            ts.load_extension("command_center")

            local function telescope_buffer_dir()
                return vim.fn.expand('%:p:h')
            end
            map("n", "<leader>ff", function()
                require 'telescope'.extensions.file_browser.file_browser({
                    path = "%:p:h",
                    cwd = telescope_buffer_dir(),
                    respect_gitignore = false,
                    hidden = true,
                    grouped = true,
                    previewer = false,
                    initial_mode = "insert",
                    layout_config = {
                        height = 0.3,
                        width = 0.7
                    }
                })
            end)

        end
    },

    {
        "FeiyouG/command_center.nvim",
        dependencies = "nvim-telescope/telescope.nvim",
        config = function()
            local command_center = require("command_center")
            map('n', '<leader>gd', ":Telescope command_center<CR>", m)
            command_center.add({
                {
                    desc = "Git diff",
                    cmd = "<CMD>Telescope git_status<CR>",
                },
            })
        end
    }
}

return M
