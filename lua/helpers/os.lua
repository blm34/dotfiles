local M = {}

-- Check if OS is windows
local uname = vim.loop.os_uname().sysname
M.is_windows = (vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 or uname == "Windows_NT")

return M
