local mason = require "mason"
local mason_lspconfig = require "mason-lspconfig"

mason.setup()

mason_lspconfig.setup()

mason_lspconfig.setup_handlers {

  function(server_name)
    local on_attach = require("nvchad.configs.lspconfig").on_attach
    local capabilities = require("nvchad.configs.lspconfig").capabilities
    local lspconfig = require "lspconfig"
    lspconfig[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,
  ["tailwindcss"] = function() end,
  ["cssls"] = function()
    local on_attach = require("nvchad.configs.lspconfig").on_attach
    local capabilities = require("nvchad.configs.lspconfig").capabilities
    local lspconfig = require "lspconfig"
    lspconfig.cssls.setup {
      settings = {
        css = {
          validate = true,
          lint = {
            unknownAtRules = "ignore",
          },
        },
        less = {
          validate = true,
          lint = {
            unknownAtRules = "ignore",
          },
        },
        scss = {
          validate = true,
          lint = {
            unknownAtRules = "ignore",
          },
        },
      },
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,
  ["arduino_language_server"] = function()
    local lspconfig = require "lspconfig"
    lspconfig.arduino_language_server.setup {
      cmd = {
        "arduino-language-server",
        "-cli",
        "/opt/brew/bin/arduino-cli",
        "-cli-config",
        "/home/Archurrito/.arduino15/arduino-cli.yaml",
        "-clangd",
        "/usr/bin/clangd",
        "-fqbn",
        "esp32:esp32:esp32",
      },
      filetypes = {
        "arduino",
        "c",
        "cpp",
      },
    }
  end,
  ["clangd"] = function()
    -- local lspconfig = require "lspconfig"
    -- lspconfig.clangd.setup {
    --   cmd = {
    --     vim.fn.stdpath "data" .. "/mason/bin/clangd",
    --     "--offset-encoding=utf-16",
    --   },
    -- }
  end,
}
