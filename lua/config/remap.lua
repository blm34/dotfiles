-- Set leader and local leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Move selected text up and down with J and K in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- Stay in visual mode when indenting blocks
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Recenter screen and open folds when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- <leader>p to paste from system clipboard
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("x", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>P", "\"+P")
vim.keymap.set("x", "<leader>P", "\"+P")

-- <leader>y to copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

-- <C-j> to go to next item in qfl
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
-- <C-k> to go to previous item in qfl
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
-- <leader>j to go to next item in location list
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
-- <leader>k to go to previous item in location list
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")

-- Move between windows with Alt+direction
vim.keymap.set("n", "<M-h>", "<C-w>h")
vim.keymap.set("n", "<M-l>", "<C-w>l")
vim.keymap.set("n", "<M-j>", "<C-w>j")
vim.keymap.set("n", "<M-k>", "<C-w>k")

-- Resize windows with Ctrl+Alt+direction
vim.keymap.set("n", "<CM-h>", function() vim.cmd("vertical resize -1") end)
vim.keymap.set("n", "<CM-l>", function() vim.cmd("vertical resize +1") end)
vim.keymap.set("n", "<CM-j>", function() vim.cmd("resize -1") end)
vim.keymap.set("n", "<CM-k>", function() vim.cmd("resize +1") end)

-- Exit terminal mode with <ESC>
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Move between windows with Alt+direction in terminal mode
vim.keymap.set("t", "<M-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<M-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<M-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<M-l>", "<C-\\><C-n><C-w>l")

-- add blank lines in normal mode
vim.keymap.set("n", "go", "o<ESC>")
vim.keymap.set("n", "gO", "O<ESC>")
