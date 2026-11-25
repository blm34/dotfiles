-- Toggle line numbers on/off depending on current mode/active window

local line_numbers_group = vim.api.nvim_create_augroup('blm34/toggle_line_numbers', { clear = true })

vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'CmdlineLeave', 'WinEnter' }, {
    group = line_numbers_group,
    desc = 'Toggle relative line numbers on',
    callback = function()
        if vim.wo.nu and not vim.startswith(vim.api.nvim_get_mode().mode, 'i') then
            vim.wo.relativenumber = true
        end
    end,
})

vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'CmdlineEnter', 'WinLeave' }, {
    group = line_numbers_group,
    desc = 'Toggle relative line numbers off',
    callback = function(args)
        if vim.wo.nu then
            vim.wo.relativenumber = false
        end

        -- Redraw here to avoid having to type something for the numbers to update
        if args.event == 'CmdlineEnter' then
            if not vim.tbl_contains({ '@', '-' }, vim.v.event.cmdtype) then
                vim.cmd.redraw()
            end
        end
    end,
})

-- Update buffers if changed and not modified
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
    group = vim.api.nvim_create_augroup('blm34/update_buffer', { clear = true }),
    desc = 'Update buffer if changed externally',
    command = "checktime",
})

-- Restore cursor position when reopening files
vim.api.nvim_create_autocmd("BufReadPost", {
    group = vim.api.nvim_create_augroup('blm34/restore_cursor', { clear = true }),
    desc = 'Restore cursor position when reopening a file',
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local line_count = vim.api.nvim_buf_line_count(0)

        if mark[1] > 0 and mark[1] <= line_count then
            vim.api.nvim_win_set_cursor(0, mark)
        end
    end
})

-- Highlight text after yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup('blm34/highlight_yanked', { clear = true }),
    desc = "Highlight yanked text",
    callback = function()
        vim.hl.on_yank({ timeout = 250 })
    end,
})

-- Auto resize splits
vim.api.nvim_create_autocmd("VimResized", {
    group = vim.api.nvim_create_augroup('blm34/resize_splits', { clear = true }),
    desc = "Automatically resize splits",
    command = "wincmd =",
})

-- Close specific buffers with `q`
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup('blm34/close_with_q', { clear = true }),
    desc = "Make temporary buffers easier to close",
    pattern = {
        "help",
        "qf",
        "checkhealth",
        "man",
        "lspinfo",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false

        vim.keymap.set("n", "q", "<cmd>close<cr>", {
            buffer = event.buf,
            silent = true,
            desc = "Close temporary window",
        })
    end
})
