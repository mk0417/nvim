return function()
  local iron = require('iron.core')

  iron.setup {
      config = {
          scratch_repl = false,
          repl_definition = {
              python = {
                  command = "ipython --no-autoindent"
              }
          },
          repl_open_cmd = 'belowright 30 split'
      },
      keymaps = {
          visual_send = ";jr",
          send_line = ";je",
          cr = ";jk",
          interrupt = ";jI",
          exit = ";jq",
          clear = ";jc",
      },
      -- ignore blank lines when sending visual select lines
      ignore_blank_lines = false
  }
end
