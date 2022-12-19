return function()
    local actions = require('telescope.actions')
    local builtin = require("telescope.builtin")
    local fb_actions = require "telescope".extensions.file_browser.actions
    local function telescope_buffer_dir()
        return vim.fn.expand('%:p:h')
    end
    local map = vim.keymap.set

    require('telescope').setup({
        defaults = {
            initial_mode = "normal",
            mappings = {
                n = {
                    ["q"] = actions.close,
                    ["<C-g>"] = actions.close
                },
                i = {
                    ["<C-g>"] = actions.close
                }
            }
        },
        extensions = {
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
            }
        }
    })

    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("project")

    map("n", "<leader>ff", function()
        require 'telescope'.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = {height = 30}
        })
    end)
    map('n', '<leader>f.',
    function()
        builtin.find_files({
            no_ignore = false,
            hidden = true
        })
    end)
    map('n', '<leader>fr', function() builtin.oldfiles() end)
    map('n', ';;', function() builtin.resume() end)
    map('n', '<leader>bb', function() builtin.buffers() end)
    map('n', '<leader>sp', function() builtin.live_grep() end)
    map('n', '<leader>sa', function() builtin.grep_string() end)
end
