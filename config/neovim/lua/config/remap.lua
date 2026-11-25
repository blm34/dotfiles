-- jk for escape from insert
vim.keymap.set("i", "jk", "<ESC>", { desc = "Escape insert mode" })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Escape insert mode" })

-- Move selected text up and down with J and K in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move visual selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move visual selection up" })

-- Stay in visual mode when indenting blocks
vim.keymap.set("v", ">", ">gv", { desc = "Increase indent" })
vim.keymap.set("v", "<", "<gv", { desc = "Decrease indent" })

-- Recenter screen and open folds when searching
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search match" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search match" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })

-- Copy and paste to/from system keyboard
vim.keymap.set({ "n", "x" }, "<leader>p", "\"+p", { desc = "Paste below from system clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>P", "\"+P", { desc = "Paste above from system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y", { desc = "Yank to system clipboard" })

-- Quick fix list navigation
vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz", { desc = "Go to next item in QFL" })
vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz", { desc = "Go to previous item in QFL" })
vim.keymap.set("n", "<leader>J", "<cmd>lnext<CR>zz", { desc = "Go to next item in location list" })
vim.keymap.set("n", "<leader>K", "<cmd>lprev<CR>zz", { desc = "Go to previous item in location list" })
vim.keymap.set("n", "<leader>qcq", function() vim.fn.setqflist({}, "r") end, { desc = "Clear the qfl" })
vim.keymap.set("n", "<leader>qcl", function() vim.fn.setloclist(0, {}, "r") end, { desc = "Clear the location list" })

-- Move between windows with ctrl hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to window to left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to window to right" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Move to window to left" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>j", { desc = "Move to window to right" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>k", { desc = "Move to window below" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>l", { desc = "Move to window above" })

-- Save changes
vim.keymap.set("n", "<C-s>", ":w<cr>", { desc = "Save current buffer" })
vim.keymap.set("n", "<C-S-s>", ":wa<cr>", { desc = "Save all buffers" })

-- Jump in line in insert mode
vim.keymap.set("i", "<C-h>", "<C-o>^", { desc = "Jump to start of line" })
vim.keymap.set("i", "<C-l>", "<C-o>$", { desc = "Jump to end of line" })

-- Resize windows with Ctrl+Arrow keys
vim.keymap.set("n", "<C-Left>", function() vim.cmd("vertical resize -1") end, { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", function() vim.cmd("vertical resize +1") end, { desc = "Increase window width" })
vim.keymap.set("n", "<C-Down>", function() vim.cmd("resize -1") end, { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Up>", function() vim.cmd("resize +1") end, { desc = "Increase window height" })
