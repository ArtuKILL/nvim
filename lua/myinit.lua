-- Hyprlang LSP

vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { "*.hl", "hypr*.conf" },
  callback = function(event)
    -- print(string.format("starting hyprls for %s", vim.inspect(event)))
    vim.lsp.start {
      name = "hyprlang",
      cmd = { "hyprls" },
      root_dir = vim.fn.getcwd(),
    }
  end
})
--   luau_lsp = function()
--     require("luau-lsp").setup {
--       sourcemap = {
--         enable = true,
--         autogenerate = true,
--         rojo_project_file = "default.procject.json",
--       },
--       types = {
--         roblox = true,
--         roblox_security_level = "PluginSecurity",
--       },
--     }
--   end,
-- }
--
-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--

-- vim.cmd [[colorscheme monokai-pro]]
