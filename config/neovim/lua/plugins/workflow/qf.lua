-- allow deleting item from qfl with `dd`
local function delete_qfl_line()
    local wininfo = vim.fn.getwininfo(vim.fn.win_getid())[1]
    local line = vim.fn.line(".")
    if wininfo.loclist == 1 then
        local loclist = vim.fn.getloclist(0)
        table.remove(loclist, line)
        vim.fn.setloclist(0, loclist, "r")
    else
        local qflist = vim.fn.getqflist()
        table.remove(qflist, line)
        vim.fn.setqflist(qflist, "r")
    end
    vim.fn.cursor(line, 1)
end

-- allow deleting a visual selection from qfl
local function delete_qfl_range()
    local wininfo = vim.fn.getwininfo(vim.fn.win_getid())[1]
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    if wininfo.loclist == 1 then
        local loclist = vim.fn.getloclist(0)
        for _ = start_line, end_line do
            table.remove(loclist, start_line)
        end
        vim.fn.setloclist(0, loclist, "r")
    else
        local qflist = vim.fn.getqflist()
        for _ = start_line, end_line do
            table.remove(qflist, start_line)
        end
        vim.fn.setqflist(qflist, "r")
    end
    vim.fn.cursor(start_line, 1)
end

-- Allow opening qfl entry without leaving the qfl window
local function preview_entry()
    local wininfo = vim.fn.getwininfo(vim.fn.win_getid())[1]
    local line = vim.fn.line(".")
    local list
    local entry
    if wininfo.loclist == 1 then
        list = vim.fn.getloclist(0)
    else
        list = vim.fn.getqflist()
    end
    entry = list[line]
    if entry then
        vim.cmd("wincmd p")
        vim.cmd("buffer " .. entry.bufnr)
        vim.fn.cursor(entry.lnum, entry.col)
        vim.cmd("wincmd p")
    end
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.keymap.set("n", "dd", delete_qfl_line, { buffer = true, desc = "Delete qf entry" })
        vim.keymap.set("x", "d", delete_qfl_range, { buffer = true, desc = "Delete qf entries" })
        vim.keymap.set("n", "<Space><CR>", preview_entry, { buffer = true, desc = "Preview qf entry" })
    end
})

return {
    "ten3roberts/qf.nvim",
    event = "VeryLazy",
    opts = {
        l = {
            number = true,
        },
        c = {
            wide = true,
            number = true,
        },
        close_other = true,
    },
    keys = {
        {
            "<leader>qq",
            function() require('qf').toggle('c', true) end,
            desc = "Toggle qfl",
        },
        {
            "<leader>ql",
            function() require('qf').toggle('l', true) end,
            desc = "Toggle location list",
        },
        {
            "]q",
            function() require('qf').below('visible') end,
            desc = "Got to next entry from cursor in visible list",
        },
        {
            "[q",
            function() require('qf').above('visible') end,
            desc = "Got to previous entry from cursor in visible list",
        },
    },
}
