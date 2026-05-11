return {
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "amansingh-afk/milli.nvim",
        },
        config = function()
            local splash = require("milli").load({ splash = "blackhole" })

            require("dashboard").setup({
                theme = "doom",
                config = {
                    header = splash.frames[1],
                    center = {
                        {
                            icon = " ",
                            desc = "Find File",
                            key = "f",
                            key_format = " [%s]",
                            action = "Telescope find_files",
                        },
                        {
                            icon = " ",
                            desc = "Search Content",
                            key = "s",
                            key_format = " [%s]",
                            action = "Telescope live_grep",
                        },
                        {
                            icon = " ",
                            desc = "Recent Projects",
                            key = "p",
                            key_format = " [%s]",
                            action = "Telescope projects",
                        },
                        {
                            icon = " ",
                            desc = "Recent Files",
                            key = "r",
                            key_format = " [%s]",
                            action = "Telescope oldfiles",
                        },
                        {
                            icon = " ",
                            desc = "Neovim Config",
                            key = "c",
                            key_format = " [%s]",
                            action = "Telescope find_files cwd=" .. vim.fn.stdpath("config"),
                        },
                        {
                            icon = "󰊳 ",
                            desc = "Update Plugins",
                            key = "u",
                            key_format = " [%s]",
                            action = "Lazy",
                        },
                    },
                    footer = {},
                    vertical_center = true,
                },
            })

            require("milli").dashboard({ splash = "blackhole", loop = true })
        end,
    },
}
