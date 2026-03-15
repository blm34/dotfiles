return {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    keys = {
        {
            "]t",
            function() require("todo-comments").jump_next() end,
            desc = "Next todo comment"
        },
        {
            "[t",
            function() require("todo-comments").jump_prev() end,
            desc = "Previous todo comment"
        },
        {
            "<leader>qt",
            function() vim.cmd("TodoQuickFix") end,
            desc = "Todo quickfix list"
        },
        {
            "<leader>st",
            function() vim.cmd("TodoTelescope") end,
            desc = "Todo telescope"
        },
    },
    opts = {
        keywords = {
            FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, },
            TODO = { icon = " ", color = "info", alt = { "ToDo", "todo" } },
            HACK = { icon = " ", color = "warning" },
            WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
            PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
            NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
            TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
        highlight = {
            pattern = [[.*<(KEYWORDS)\s*%(\(\w{1,5}\))?\s*:]],
            keyword = "bg",
        },
        search = {
            pattern = [[\b(KEYWORDS)\s*(\(\w{1,5}\))?\s*:]],
        },
    },
}
