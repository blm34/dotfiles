-- Set indent size
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4

-- Set keymaps for running python files
local runner = require("runners.python")

vim.keymap.set("n", "<leader>RR", runner.run_current_file,
    { buffer = true, desc = "Run current python file" })

vim.keymap.set("n", "<leader>RF", runner.pick_register_and_run,
    { buffer = true, desc = "Run python file from register" })

vim.keymap.set("n", "<leader>RS", runner.save_current_file_to_register,
    { buffer = true, desc = "Save current file path into a register" })
