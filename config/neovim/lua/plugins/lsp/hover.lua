return {
    "lewis6991/hover.nvim",
    keys = {
        {
            "K",
            function() require("hover").open() end,
            desc = "hover.nvim (open)",
        },
    },
    config = function()
        local hover = require("hover")
        hover.config({
            providers = {
                'hover.providers.diagnostic',
                'hover.providers.lsp',
                'hover.providers.dap',
                'hover.providers.man',
                'hover.providers.dictionary',
                'hover.providers.fold_preview',
            },
            preview_opts = { border = 'rounded' },
        })

        vim.keymap.set("n", "gK", function()
            require("hover").enter()
        end, { desc = "hover.nvim (enter)" })

        vim.keymap.set("n", "<C-p>", function()
            require("hover").switch("previous")
        end, { desc = "hover.nvim (previous source)" })

        vim.keymap.set("n", "<C-n>", function()
            require("hover").switch("next")
        end, { desc = "hover.nvim (next source)" })
    end
}
