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
        { "<leader>wn", "<Cmd>tabnew<CR>",            desc = "New tab" },
        { "<leader>wc", "<Cmd>tabclose<CR>",          desc = "Close tab" },
        { "<leader>wl", "<Cmd>tabn<CR>",              desc = "Next tab" },
        { "<leader>wh", "<Cmd>tabp<CR>",              desc = "Previous tab" },
        { "<leader>w.", "<Cmd>+tabmove<CR>",          desc = "Move tab right" },
        { "<leader>w,", "<Cmd>-tabmove<CR>",          desc = "Move tab left" },
        { "<leader>wr", rename_tab,                   desc = "Rename tab" },
        { "<leader>wj", "<Cmd>Tabby jump_to_tab<CR>", desc = "Jump to tab" },
        { "<leader>ww", "<Cmd>Tabby pick_window<CR>", desc = "Pick window" },
    }
}
