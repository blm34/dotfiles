-- Turn on line numbers
vim.opt.number = true

-- Highlight the line the cursor is on
vim.opt.cursorline = true

-- Indentation options
vim.opt.tabstop = 4        -- How many spaces to use to visualise a tab character
vim.opt.softtabstop = 4    -- How many spaces to insert when pressing tab
vim.opt.shiftwidth = 4     -- How much indentation changes when using indent commands e.g. << and >>
vim.opt.expandtab = true   -- Use spaces instead of tab
vim.opt.smartindent = true -- Automatically adjust indentation for code-like structures

-- Disable line wrapping for lines longer than the window width
vim.opt.wrap = false

-- Search options
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.keymap.set("n", "<ESC>", "<cmd>nohlsearch<CR>",
    { silent = true, noremap = true, desc = "Turn off search highlights" })
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Folds
vim.wo.foldcolumn = 'auto'
vim.o.foldlevelstart = 99
vim.wo.foldenable = true
vim.opt.fillchars = {
    fold = ' ',
    foldclose = '',
    foldopen = '',
    foldsep = ' ',
    foldinner = ' ',
}

vim.o.winborder = 'rounded'

-- Show whitespace
vim.opt.list = true
vim.opt.listchars = { trail = '⋅' }

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

-- Update times/timeouts
vim.opt.updatetime = 300
vim.opt.timeoutlen = 1000

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

-- Ignore files matching patterns in wildcards
vim.opt.wildignore:append {
    '*.pyc',
    '.git/**',
}
