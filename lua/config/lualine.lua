return function()

  --require('lualine').setup(
  --  {
  --    options = {
  --      theme = "modus vivendi",
  --      icons_enabled = true,
  --      component_separators = {left = '', right = ''},
  --      section_separators = {left = '', right = ''}
  --    },
  --    sections = {
  --      lualine_a = {'mode'},
  --      lualine_b = {'branch', 'diff'},
  --      lualine_c = {'filename', 'filetype'},
  --      lualine_x = {'encoding'},
  --      lualine_y = {'progress'},
  --      lualine_z = {
  --        {function () return '' end},
  --        {'location'}
  --      }
  --    }
  --                        })

  --end

  require('lualine').setup({
      options = {
          icons_enabled = true,
          theme = 'modus-vivendi',
          section_separators = {left = '', right = ''},
          component_separators = {left = '', right = ''},
          disabled_filetypes = {}
      },
      sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch'},
          lualine_c = {
              {
                  'filename',
                  -- displays file status (readonly status, modified status)
                  file_status = true,
                  -- 0 = just filename, 1 = relative path, 2 = absolute path
                  path = 0
              }
          },
          lualine_x = {
              {'diagnostics', sources = {"nvim_diagnostic"}, symbols = {error = ' ', warn = ' ', info = ' ',
              hint = ' '}
          },
          'encoding',
          'filetype'
      },
      lualine_y = {'progress'},
      lualine_z = {'location'}
  },
  inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
          {
              'filename',
              file_status = true,
              path = 1
          }
      },
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
  },
  tabline = {},
  extensions = {'fugitive'}
  })
end
