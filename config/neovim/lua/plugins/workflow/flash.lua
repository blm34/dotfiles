-- Don't remap <Enter> in QFL window
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "qf" },
    callback = function()
        vim.keymap.set("n", "<CR>", "<CR>", { buffer = true, noremap = true })
    end,
})

-- Don't remap <Enter> in command-line window (`q:`, `q/`, `q?`)
vim.api.nvim_create_autocmd("CmdwinEnter", {
    callback = function()
        vim.keymap.set("n", "<CR>", "<CR>", { buffer = true, noremap = true })
    end,
})


return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        search = {
            exclude = { "NvimTree" },
        },
    },
    keys = {
        {
            "<CR>",
            function() require("flash").jump() end,
            mode = { "n", "x", "o" },
            desc = "Search with flash",
        },
    }
}
