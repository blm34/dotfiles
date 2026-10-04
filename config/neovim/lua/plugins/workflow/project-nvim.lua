return {
    { "DrKJeff16/project.nvim",
        lazy = true,
        opts = {
            lsp = {
                enabled = true,
                ignore = { "null-ls", "none-ls" },
            },

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

            scope_chdir = "global",
            show_hidden = true,
            show_by_name = true,
        },
    },
}
