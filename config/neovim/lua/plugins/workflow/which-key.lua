return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "helix",
        delay = 1000,
        sort = { "group", "local", "order", "alphanum", "mod" },
        expand = 2,
        plugins = {
            marks = true,         -- Shows marks on ' and `
            registers = true,     -- Shows registers on " in NORMAL or <C-r> in INSERT
            spelling = {
                enabled = true,   -- Show spelling on z=
                suggestions = 20, -- How many suggestions to show
            },
            presets = {
                operators = false,   -- Show help for operators like d, y, ...
                motions = true,      -- Show help for motions
                text_objects = true, -- Show help for text objects after entering an operator
                windows = true,      -- Default bindings on <C-w>
                nav = true,          -- Misc bindings to work with windows
                z = true,            -- Show help for 'z' prefixes
                g = true,            -- Show help for 'g' prefixes
            },
        },
        win = {
            border = "rounded",
            wo = { winblend = 10 },
        },
        spec = {
            { "<leader>c", group = "Code" },
            { "<leader>d", group = "Debug" },
            { "<leader>g", group = "Git" },
            { "<leader>h", group = "Harpoon" },
            { "<leader>q", group = "QFL" },
            { "<leader>r", group = "Code Runners" },
            { "<leader>s", group = "Telescope" },
            { "<leader>t", group = "Test" },
            { "<leader>w", group = "Workspace (tab)" },
        }
    },
    keys = {
        {
            "<leader>?",
            function() require("which-key").show({ global = true }) end,
            desc = "Open which-key",
        },
    },
}
