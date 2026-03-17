-- helper function to use telescope on harpoon list.
local function toggle_telescope(harpoon_list)
    local conf = require('telescope.config').values
    local themes = require('telescope.themes')

    local file_paths = {}
    for _, item in ipairs(harpoon_list.items) do
        table.insert(file_paths, item.value)
    end

    local opts = themes.get_ivy({
        prompt_title = "Working List"
    })

    require("telescope.pickers").new(opts, {
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer(opts),
        sorter = conf.generic_sorter(opts),
    }):find()
end

return {
    "ThePrimeagen/harpoon",
    lazy = true,
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    opts = {
        settings = {
            save_on_toggle = true,
            save_on_change = true,
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
            function()
                local list = require("harpoon"):list()
                local buf_path = vim.fn.expand("%:p")
                for idx, item in ipairs(list.items) do
                    if item.value == buf_path then
                        list:remove_at(idx)
                        break
                    end
                end
            end,
            desc = "Remove from harpoon list",
        },
        {
            "<leader>hh",
            function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end,
            desc = "Toggle harpoon menu",
        },
        {
            "<leader>sh",
            function() toggle_telescope(require("harpoon"):list()) end,
            desc = "Open harpoon list in telescope",
        },
        { "<leader>h1", function() require("harpoon"):list():select(1) end, desc = "Harpoon to file 1" },
        { "<leader>h2", function() require("harpoon"):list():select(2) end, desc = "Harpoon to file 2" },
        { "<leader>h3", function() require("harpoon"):list():select(3) end, desc = "Harpoon to file 3" },
        { "<leader>h4", function() require("harpoon"):list():select(4) end, desc = "Harpoon to file 4" },
        { "<leader>h5", function() require("harpoon"):list():select(5) end, desc = "Harpoon to file 5" },
        { "<leader>h6", function() require("harpoon"):list():select(6) end, desc = "Harpoon to file 6" },
        { "<leader>h7", function() require("harpoon"):list():select(7) end, desc = "Harpoon to file 7" },
        { "<leader>h8", function() require("harpoon"):list():select(8) end, desc = "Harpoon to file 8" },
        { "<leader>h9", function() require("harpoon"):list():select(9) end, desc = "Harpoon to file 9" },
    },
}
