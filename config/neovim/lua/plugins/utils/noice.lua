return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    keys = {
        {
            "<leader>nl",
            function() require("noice").cmd("all") end,
            desc = "Message log (Noice)",
        },
        {
            "<leader>nd",
            function() require("noice").cmd("dismiss") end,
            desc = "Dismiss notifications (Noice)",
        },
    },
    opts = {
        cmdline = { enabled = false },
        messages = { enabled = false },
        popupmenu = { enabled = false },
        notify = { enabled = true },
    },
}
