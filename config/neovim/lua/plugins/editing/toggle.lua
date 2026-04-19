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
            { 'True',  'False' },
            { 'DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL' },
        },
    },
}
