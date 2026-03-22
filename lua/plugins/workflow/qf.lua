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

vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.keymap.set("n", "dd", delete_qfl_line, { buffer = true, desc = "Delete qf entry" })
    end
})

return {
    "ten3roberts/qf.nvim",
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
