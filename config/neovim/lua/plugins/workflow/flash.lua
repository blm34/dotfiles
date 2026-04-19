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
