require "nvchad.mappings"
-- -@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>fg"] = {
      function()
        local input_string = vim.fn.input "Search for > "
        if input_string == "" then
          return
        end
        require("telescope.builtin").grep_string {
          search = input_string,
        }
      end,
      "Search global",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.trouble = {
  n = {
    ["<leader>tt"] = { "<cmd> TroubleToggle <CR>", "Trouble" },
  }
}

M.markdown = {
  n = {
    ["<leader>mia"] = { "<cmd> MDListItemAbove <CR>", "Insert item in list above" },
    ["<leader>mib"] = { "<cmd> MDListItemBelow <CR>", "Insert item in list below" },
    ["<leader>met"] = { "<cmd> ExportTable <CR>", "Export table" },
    ["<leader>mit"] = { "<cmd> EasyTablesImportThisTable <CR>", "Edit current table" },
    ["<leader>mct"] = {
      function()
        local input = vim.fn.input "Table dimensions: "
        local pattern = "(%d%d?)[%sxX](%d%d?)"
        local rows, columns = string.match(input, pattern)
        if (not (rows and colums)) then
          print("Error with input!")
        end
        local command = string.format("EasyTablesCreateNew %sx%s", columns, rows)
        vim.cmd(command)
      end,
      "Create a new table to insert need to call ExportTable"
    }
  }
}

M.nvim_dap = {
  n = {
    ["<leader>dl"] = { "<cmd>lua require'dap'.step_into()<CR>", "debugger setp into" },
    ["<leader>dj"] = { "<cmd>lua require'dap'.step_over()<CR>", "debugger step over" },
    ["<leader>dk"] = { "<cmd>lua require'dap'.step_out()<CR>", "debugger step out" },
    ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<CR>", "debugger continue" },
    ["<leader>dbp"] = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "debugger toggle breakpoint" },
    ["<leader>dd"] = {
      "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
      "debugger set conditional breakpoint",
    },
    ["<leader>de"] = { "<cmd>lua require'dap'.terminate()<CR>", "debugger reset" },
    ["<leader>dr"] = { "<cmd>lua require'dap'.run_last()<CR>", "debugger reset" },
  },
}

M.jupynium = {
  n = {
    ["<leader>ji"] = { "<cmd>JupyniumStartSync<CR>", "Init Jupynium sync" },
    ["<leader>jc"] = { "<cmd>JupyniumStopSync<CR>", "Stop Jupynium sync" },
    ["<leader>jx"] = { "<cmd>JupyniumExecuteSelectedCells<CR>", "Jupynium Excute selected cells" },
  },
}

M.mason_nvim_dap = {
  n = {
    ["<leader>di"] = { "<cmd>Lazy load mason-nvim-dap.nvim<CR>", "Load debugger installer" },
  },
}

M.flutter = {
  n = {
    ["<leader>fc"] = { "<cmd>Telescope flutter commands<CR>", "Flutter commands" },
    ["<leader>fe"] = { "<cmd>FlutterEmulators<CR>", "Start flutter emulator" },
  },
}

M.flutter_bloc = {
  n = {
    ["<leader>fl"] = {
      function()
        local bloc = require("bloc")
        bloc.setup()

        local input = vim.fn.input("Bloc name (snake_case): ")
        if (input == "") then
          print "Invalid input for Bloc creation!"
          return;
        end
        local path = vim.fn.expand("%:p:h") .. "/"
        bloc.create_bloc(input, path)
      end,
      "Create a Bloc"
    },
    ["<leader>fq"] = {
      function()
        local bloc = require("bloc")
        bloc.setup()

        local input = vim.fn.input("cubit name (snake_case): ")
        if (input == "") then
          print "Invalid input for cubit creation!"
          return;
        end
        local path = vim.fn.expand("%:p:h") .. "/"
        bloc.create_cubit(input, path)
      end,
      "Create a Cubit"
    }
  }
}

-- more keybinds!

return M
