return {
    "nvim-mini/mini.diff",
    version = "*",
    event = "VeryLazy",
    keys = {
        {
            "<leader>gd",
            function() require('mini.diff').toggle_overlay() end,
            desc = "Toggle Git diff",
        },
        {
            "<leader>qg",
            function()
                vim.fn.setqflist(require('mini.diff').export("qf"))
                vim.cmd("copen")
            end,
            desc = "Send git hunks list to qfl",
        }
    },
    opts = {
        view = {
            style = "sign",
            signs = {
                add = '┃',
                change = '┃',
                delete = '▁',
            },
        },
        mappings = {
            apply = "<leader>ga",
            reset = "<leader>gr",
        },
    }
}
