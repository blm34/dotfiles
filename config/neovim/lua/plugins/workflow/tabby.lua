local function rename_tab()
    vim.ui.input(
        { prompt = "Rename tab: " },
        function(name)
            if name then
                vim.cmd("Tabby rename_tab " .. name:gsub(" ", "\\ "))
            end
        end
    )
end

return {
    "nanozuki/tabby.nvim",
    event = "VeryLazy",
    opts = {
        preset = "tab_only",
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>Tn", "<Cmd>tabnew<CR>",            desc = "New tab" },
        { "<leader>Tq", "<Cmd>tabclose<CR>",          desc = "Close tab" },
        { "<leader>Tl", "<Cmd>tabn<CR>",              desc = "Next tab" },
        { "<leader>Th", "<Cmd>tabp<CR>",              desc = "Previous tab" },
        { "<leader>T.", "<Cmd>+tabmove<CR>",          desc = "Move tab right" },
        { "<leader>T,", "<Cmd>-tabmove<CR>",          desc = "Move tab left" },
        { "<leader>Tr", rename_tab,                   desc = "Rename tab" },
        { "<leader>Tj", "<Cmd>Tabby jump_to_tab<CR>", desc = "Jump to tab" },
        { "<leader>Tw", "<Cmd>Tabby pick_window<CR>", desc = "Pick window" },
    }
}
