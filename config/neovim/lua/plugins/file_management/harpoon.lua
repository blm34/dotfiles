return {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    opts = {
        settings = {
            sync_on_ui_close = true,
            save_on_toggle = true,
        },
    },
    keys = {
        {
            "<leader>ha",
            function() require("harpoon"):list():add() end,
            desc = "Add to harpoon list",
        },
        {
            "<leader>hr",
            function() require("harpoon"):list():remove() end,
            desc = "Remove from harpoon list",
        },
        {
            "<leader>hh",
            function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end,
            desc = "Toggle harpoon menu",
        },
        {
            "<M-5>",
            "<cmd>b#<cr>",
            desc = "Return to previous buffer",
        },
        { "<M-1>", function() require("harpoon"):list():select(1) end, desc = "Harpoon to file 1" },
        { "<M-2>", function() require("harpoon"):list():select(2) end, desc = "Harpoon to file 2" },
        { "<M-3>", function() require("harpoon"):list():select(3) end, desc = "Harpoon to file 3" },
    },
}
