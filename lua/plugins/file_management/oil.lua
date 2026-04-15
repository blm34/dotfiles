local hidden = {
    [".."] = true,
    [".git"] = true,
    ["__pycache__"] = true,
}

local show_details = false

local function toggle_details()
    show_details = not show_details
    if show_details then
        require("oil").set_columns({ "icon", "permissions", "type", "size", "mtime" })
    else
        require("oil").set_columns({ "icon" })
    end
end

return {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        {
            "<leader>o",
            "<cmd>Oil --float<cr>",
            desc = "Open Oil",
        },
    },
    opts = {
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        watch_for_changes = true,
        keymaps = {
            ["<C-c>"] = false,
            ["q"] = "actions.close",

            ["<C-h>"] = false,
            ["<C-v>"] = { "actions.select", opts = { vertical = true } },
            ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
            ["<C-t>"] = { "actions.select", opts = { tab = true } },

            ["gd"] = { callback = toggle_details, desc = "Toggle file details view" }
        },
        view_options = {
            show_hidden = true,
            natural_order = true,
            is_always_hidden = function(name, _)
                return hidden[name] or false
            end,
        },
        float = {
            max_width = 0.8,
            max_height = 0.9,
            border = "rounded",
        },
    },
}
