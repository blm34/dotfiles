return {
    "leblocks/toggle.nvim",
    lazy = true,
    keys = {
        {
            "<leader>i",
            function() require('toggle').toggle() end,
            desc = "Toggle word"
        },
    },
    opts = {
        mappings = {
            { 'DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL' },
        },
    },
}
