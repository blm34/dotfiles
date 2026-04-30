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

local function copy_filepath()
    local oil
    require("oil")
    local entry = oil.get_cursor_entry()
    local dir = oil.get_current_dir()
    if entry and dir then
        local filepath = dir .. entry.name
        vim.fn.setreg("+", filepath)  -- System clipboard
        vim.fn.setreg("\"", filepath) -- Unnamed register
        vim.notify("Copied: " .. filepath)
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

            ["gd"] = { callback = toggle_details, desc = "Toggle file details view" },
            ["gy"] = { callback = copy_filepath, desc = "Copy path" }
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
