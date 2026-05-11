return {
    {
        "ahmedkhalf/project.nvim",
        main = "project_nvim",
        event = "VeryLazy",
        opts = {
            detection_methods = { "lsp", "pattern" },

            patterns = {
                ".git",
                "_darcs",
                ".hg",
                ".bzr",
                ".svn",
                "Makefile",
                "package.json",
                "pyproject.toml",
                "go.mod",
                "Cargo.toml",
            },

            silent_chdir = false,
            scope_chdir = "global",
            ignore_lsp = { "null-ls", "none-ls" },
            show_hidden = true,
        },
    },
}
