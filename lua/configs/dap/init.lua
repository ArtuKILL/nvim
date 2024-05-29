local dap = require "dap"

require "configs.dap.ui"

local codelldb = require "configs.dap.adapters.codelldb"

dap.adapters.codelldb = codelldb.adapter

dap.configurations.c = codelldb.config
dap.configurations.cpp = codelldb.config
dap.configurations.rust = codelldb.config
