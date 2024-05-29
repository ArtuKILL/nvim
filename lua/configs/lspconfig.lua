local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "tsserver",
  -- "clangd",
  --"tailwindcss",
  -- "phpactor",
  -- "emmet_language_server",
  "pylsp",
  "nginx_language_server",
  "eslint",
  -- "arduino_language_server",
  "jsonls",
  "rust_analyzer",
  "clangd",
}

-- lspconfig.tailwindcss.setup {}

-- lspconfig.arduino_language_server.setup {}

-- lspconfig.emmet_language_server.setup {}
--#region
--
lspconfig.pylsp.setup {}

lspconfig.luau_lsp.setup {}

lspconfig.nginx_language_server.setup {}

lspconfig.html.setup {
  init_options = {
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
  },
}

lspconfig.cssls.setup {
  settings = {
    css = {
      validate = true,
      lint = {
        unkownAtRules = "ignore",
      },
    },
    scss = {
      validate = true,
      lint = {
        unkownAtRules = "ignore",
      },
    },
    less = {
      validate = true,
      lint = {
        unkownAtRules = "ignore",
      },
    },
  },
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- lspconfig.arduino_language_server.setup {
--   cmd = {
--     "arduino-language-server",
--     "-cli-config",
--     "/home/Archurrito/.arduino15/arduino-cli.yaml",
--     "-fqbn",
--     "esp32:esp32:esp32",
--     "-cli",
--     "/home/Archurrito/bin/arduino-cli",
--     "-clangd",
--     "/usr/bin/clangd",
--   },
--   filetypes = {
--     "arduino",
--     "c",
--     "cpp",
--   },
-- }

lspconfig.clangd.setup {
  cmd = {
    vim.fn.stdpath "data" .. "/mason/bin/clangd",
    "--offset-encoding=utf-16",
  },
}

-- lspconfig.luau.setup {
--   sourcemap = {
--     enabled = true,
--     autogenerate = true,
--     rojo_project_file = "default.project.json",
--   },
--   types = {
--     roblox = true,
--     roblox_security_level = "PluginSecurity",
--   },
-- }
--
-- spconfig.pyright.setup { blabla}
