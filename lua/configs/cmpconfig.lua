local cmp
require "cmp"
local compare = cmp.config.compare

cmp.setup {
  sources = {
    { name = "jupynium", priority = 1000 },
    { name = "nvim_lsp", priority = 100 },
  },
}
