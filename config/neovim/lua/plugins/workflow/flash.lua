return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        search = {
            exclude = { "NvimTree" },
        },
        modes = {
            char = {
                jump_labels = true,
                config = function(opts)
                    opts.autohide = opts.autohide or (vim.fn.mode(true):find("no") and vim.v.operator == "y")

                    opts.jump_labels = opts.jump_labels
                        and vim.fn.mode(true):find("no") == nil
                        and vim.v.count == 0
                        and vim.fn.reg_executing() == ""
                        and vim.fn.reg_recording() == ""
                end
            },
        },
    },
    keys = {
        {
            "s",
            function() require("flash").jump() end,
            mode = { "n", "x", "o" },
            desc = "Search with flash",
        },
        {
            "S",
            function() require("flash").treesitter() end,
            mode = { "n", "x", "o" },
            desc = "Flash Treesitter",
        },
        {
            "r",
            function() require("flash").remote() end,
            mode = "o",
            desc = "Remote Flash",
        },
        {
            "<c-s>",
            function() require("flash").toggle() end,
            mode = "c",
            desc = "Toggle Flash Search",
        }
    },
}
