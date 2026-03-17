-- Turn on relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight the line the cursor is on
vim.opt.cursorline = true

-- How many spaces to use to visualise a tab character
vim.opt.tabstop = 4
-- How many spaces to insert when pressing tab
vim.opt.softtabstop = 4
-- How much indentation changes when using indent commands e.g. << and >>
vim.opt.shiftwidth = 4
-- Use spaces instead of tab
vim.opt.expandtab = true
-- Automatically adjust indentation for code-like structures
vim.opt.smartindent = true

-- Disable line wrapping for lines longer than the window width
vim.opt.wrap = false

-- Highlight search matches
vim.opt.hlsearch = true
-- Highlight matches as a search term is being entered
vim.opt.incsearch = true
-- Turn off search match highlights with <ESC> in normal mode
vim.keymap.set("n", "<ESC>", "<cmd>nohlsearch<CR>", { silent = true, noremap = true, desc = "Turn off search highlights" })
-- Case-insensitive searching unless \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable 24-bit RGB colours in the terminal
vim.opt.termguicolors = true

-- Keep at least 8 lines visible above and below the cursor when scrolling
vim.opt.scrolloff = 8

-- Set the sign column to always be visible
vim.opt.signcolumn = "yes"

-- Set how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Treat the @ symbol as valid in a filename
vim.opt.isfname:append("@-@")

-- Control how long (ms) to wait before triggering certain events after inactivity
vim.opt.updatetime = 250

-- Show a vertical guidline at column 80
vim.opt.colorcolumn = "80"

-- Update buffers if changed and not modified
vim.opt.autoread = true
vim.api.nvim_create_autocmd(
    { "FocusGained", "BufEnter" },
    { command = "checktime" }
)

-- Define directory for undo files
vim.opt.undofile = true
vim.opt.undodir = { vim.fs.joinpath(vim.fn.stdpath("data"), "undo") }

-- Create directory for undo files if it doesn't exist
if vim.fn.isdirectory(vim.opt.undodir:get()[1]) == 0 then
    vim.fn.mkdir(vim.opt.undodir:get()[1], "p")
end
