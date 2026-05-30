vim.api.nvim_set_hl(0, "MarkSignHL", { fg = "#C4746E", bold = true })

return {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {
        builtin_marks = { "'", "." },
        default_mappings = true,
        signs = true,
        refresh_interval = 250,
        sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
    },
}
