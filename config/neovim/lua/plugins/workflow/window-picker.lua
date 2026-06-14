local switch_window = function()
    local win_id = require("window-picker").pick_window()
    vim.api.nvim_set_current_win(win_id)
end

return {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    keys = {
        {
            "<leader>wp",
            switch_window,
            desc = "window picker",
        },
    },
    opts = {
        hint = "floating-big-letter",
        selection_chars = "fjdkslacmrueiwoqp",
        show_prompt = false,
    },
}
