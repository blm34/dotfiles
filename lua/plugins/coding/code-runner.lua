return {
    "blm34/code-runner.nvim",
    opts = {
        busy_behaviour = {
            behaviour = "ask",
        },
    },
    keys = {
        {
            "<leader>rc",
            function() require("code-runner").run_current_file() end,
            desc = "Run the current file",
        },
        {
            "<leader>rnc",
            function() require("code-runner").run_current_file(true) end,
            desc = "Run the current file in a new terminal",
        },
        {
            "<leader>rr",
            function() require("code-runner").run_file_from_register() end,
            desc = "Run file from register",
        },
        {
            "<leader>rnr",
            function() require("code-runner").run_file_from_register({ new_terminal = true }) end,
            desc = "Run file from register in a new terminal",
        },
        {
            "<leader>rs",
            function() require("code-runner").save_current_file_path_to_register() end,
            desc = "Save file to register",
        },
        {
            "<leader>rq",
            function() require("code-runner").close_terminal() end,
            desc = "Close a terminal",
        },
        {
            "<leader>raq",
            function() require("code-runner").close_all_terminals() end,
            desc = "Close all terminals",
        },
        {
            "<leader>rt",
            function() require("code-runner").toggle_terminal() end,
            desc = "Toggle a terminal",
        },
        {
            "<leader>rat",
            function() require("code-runner").toggle_all_terminals() end,
            desc = "Toggle all terminals",
        },
    },
}
