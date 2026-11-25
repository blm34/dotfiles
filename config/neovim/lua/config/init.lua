-- Disable netrw in favour of nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Load configs
require("config.options")
require("config.remap")
require("config.autocmds")
require("config.lazy")
