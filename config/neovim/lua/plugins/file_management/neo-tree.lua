return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifRanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
        "folke/snacks.nvim",
    },
    keys = {
        {
            "<leader>ft",
            "<Cmd>Neotree toggle<CR>",
            desc = "Neo tree",
        }
    },
    opts = {},
    config = function(_, opts)
        local function on_move(data)
            require("snacks").rename.on_rename_file(data.source, data.destination)
        end
        local events = require("neo-tree.events")
        opts.event_handlers = opts.event_handlers or {}
        vim.list_extend(opts.event_handlers, {
            { event = events.FILE_MOVED,   handler = on_move },
            { event = events.FILE_RENAMED, handler = on_move },
        })
    end,
}
