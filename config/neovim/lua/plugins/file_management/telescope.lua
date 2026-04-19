return {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    keys = {
        {
            '<leader>sf',
            function() require("telescope.builtin").find_files() end,
            desc = 'Search files in telescope',
        },
        {
            '<leader>sg',
            function() require("telescope.builtin").git_files() end,
            desc = 'Search git files in telescope',
        },
        {
            '<leader>sc',
            function() require("telescope.builtin").live_grep() end,
            desc = 'Search file contents in telescope',
        },
        {
            '<leader>sb',
            function() require("telescope.builtin").buffers() end,
            desc = 'Search buffers in telescope',
        },
        {
            '<leader>sh',
            function() require("telescope.builtin").help_tags() end,
            desc = 'Search help tags in telescope',
        },
    },
    config = function()
        local actions = require('telescope.actions')
        local action_state = require('telescope.actions.state')

        require('telescope').setup({
            defaults = {
                mappings = {
                    n = {
                        -- s to open selection in a horizontal split
                        ["s"] = function(prompt_bufnr)
                            local selection = action_state.get_selected_entry()
                            actions.close(prompt_bufnr)
                            vim.cmd("split " .. selection.path)
                        end,
                        -- v to open selection in a vertical split
                        ["v"] = function(prompt_bufnr)
                            local selection = action_state.get_selected_entry()
                            actions.close(prompt_bufnr)
                            vim.cmd("vsplit " .. selection.path)
                        end,
                        -- t to open in a new tab
                        ["t"] = function(prompt_bufnr)
                            local selection = action_state.get_selected_entry()
                            actions.close(prompt_bufnr)
                            vim.cmd("tabedit " .. selection.path)
                        end,
                    },
                },
            },
        })
    end,
}
