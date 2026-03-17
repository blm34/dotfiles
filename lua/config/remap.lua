-- Set leader and local leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Move selected text up and down with J and K in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move visual selection down" })
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv", { desc = "Move visual selection up" })

-- Stay in visual mode when indenting blocks
vim.keymap.set("v", ">", ">gv", { desc = "Increase indent" })
vim.keymap.set("v", "<", "<gv", { desc = "Decrease indent" })

-- Recenter screen and open folds when searching
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search match" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search match" })

-- <leader>p to paste from system clipboard
vim.keymap.set({ "n", "x" }, "<leader>p", "\"+p", { desc = "Paste below from system clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>P", "\"+P", { desc = "Paste above from system clipboard" })

-- <leader>y to copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y", { desc = "Yank to system clipboard" })

-- <C-j> to go to next item in qfl
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz", { desc = "Go to next item in QFL" })
-- <C-k> to go to previous item in qfl
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz", { desc = "Go to previous item in QFL" })
-- <leader>j to go to next item in location list
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz", { desc = "Go to next item in location list" })
-- <leader>k to go to previous item in location list
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz", { desc = "Go to previous item in location list" })

-- Move between windows with Alt+direction
vim.keymap.set("n", "<M-h>", "<C-w>h", { desc = "Move to window to left" })
vim.keymap.set("n", "<M-l>", "<C-w>l", { desc = "Move to window to right" })
vim.keymap.set("n", "<M-j>", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<M-k>", "<C-w>k", { desc = "Move to window above" })

-- Resize windows with Ctrl+Alt+direction
vim.keymap.set("n", "<CM-h>", function() vim.cmd("vertical resize -1") end, { desc = "Decrease window width" })
vim.keymap.set("n", "<CM-l>", function() vim.cmd("vertical resize +1") end, { desc = "Increase window width" })
vim.keymap.set("n", "<CM-j>", function() vim.cmd("resize -1") end, { desc = "Decrease window height" })
vim.keymap.set("n", "<CM-k>", function() vim.cmd("resize +1") end, { desc = "Increase window height" })

-- Exit terminal mode with <ESC>
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Move between windows with Alt+direction in terminal mode
vim.keymap.set("t", "<M-h>", "<C-\\><C-n><C-w>h", { desc = "Move to window to left" })
vim.keymap.set("t", "<M-j>", "<C-\\><C-n><C-w>j", { desc = "Move to window to right" })
vim.keymap.set("t", "<M-k>", "<C-\\><C-n><C-w>k", { desc = "Move to window below" })
vim.keymap.set("t", "<M-l>", "<C-\\><C-n><C-w>l", { desc = "Move to window above" })
