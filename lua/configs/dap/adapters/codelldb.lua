-- Usando como guia esto: https://github.com/kelvin-van-vuuren/nvim/blob/main/configs/dap/adapters/lldb.lua
local M = {}

M.adapter = {
  type = "server",
  port = "${port}",
  executable = {
    command = "/home/Archurrito/.local/share/nvim/mason/bin/codelldb",
    args = { "--port", "${port}" },
  },
}

M.config = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = true,
  },
}

return M
