return {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    keys = {
        {
            '<leader>ff',
            function() require("telescope.builtin").find_files() end,
            desc = 'Search files in telescope',
        },
        {
            '<leader>fc',
            function() require("telescope.builtin").live_grep() end,
            desc = 'Search file contents in telescope',
        },
        {
            '<leader>fw',
            function() require("telescope.builtin").grep_string() end,
            desc = 'Search word under cursor in telescope',
        },
        {
            '<leader>fb',
            function() require("telescope.builtin").buffers() end,
            desc = 'Search buffers in telescope',
        },
        {
            '<leader>fh',
            function() require("telescope.builtin").help_tags() end,
            desc = 'Search help tags in telescope',
        },
        {
            '<leader>fr',
            function() require("telescope.builtin").oldfiles() end,
            desc = 'Search recent files in telescope',
        },
        {
            '<leader>fk',
            function() require("telescope.builtin").keymaps() end,
            desc = 'Search keymaps in telescope',
        },
        {
            '<leader>flr',
            function() require("telescope.builtin").lsp_references() end,
            desc = 'Search LSP references',
        },
        {
            '<leader>fli',
            function() require("telescope.builtin").lsp_incoming_calls() end,
            desc = 'Search LSP incoming calls',
        },
        {
            '<leader>fld',
            function() require("telescope.builtin").lsp_document_symbols() end,
            desc = 'Search LSP document symbols',
        },
        {
            '<leader>flw',
            function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end,
            desc = 'Search LSP workspace symbols',
        },
        {
            '<leader>fgc',
            function() require("telescope.builtin").git_commits() end,
            desc = 'Search git commits',
        },
        {
            '<leader>fgf',
            function() require("telescope.builtin").git_bcommits() end,
            desc = 'Search git commits (current file)',
        },
        {
            '<leader>fgs',
            function() require("telescope.builtin").git_stash() end,
            desc = 'Search git stash',
        },
    },
    config = function()
        local actions = require('telescope.actions')
        local action_state = require('telescope.actions.state')

        require('telescope').setup({
            defaults = {
                path_display = { "truncate" },
                mappings = {
                    i = {
                        -- <c-s> to open selection in a horizontal split
                        ["<c-s>"] = function(prompt_bufnr)
                            local selection = action_state.get_selected_entry()
                            actions.close(prompt_bufnr)
                            vim.cmd("split " .. selection.path)
                        end,
                        ["<M-p>"] = require("telescope.actions.layout").toggle_preview,
                    },
                    n = {
                        -- <c-s> to open selection in a horizontal split
                        ["<c-s>"] = function(prompt_bufnr)
                            local selection = action_state.get_selected_entry()
                            actions.close(prompt_bufnr)
                            vim.cmd("split " .. selection.path)
                        end,
                        -- <M-p> to toggle preview
                        ["<M-p>"] = require("telescope.actions.layout").toggle_preview,
                    },
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                    find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" },
                },
                live_grep = {
                    additional_args = { "--hidden", "--glob", "!**/.git/*" },
                },
                buffers = {
                    sort_mru = true,
                },
                lsp_references = {
                    theme = "cursor",
                    reuse_win = true,
                    include_declaration = false,
                    show_line = false,
                    layout_config = {
                        width = 0.9,
                        height = 0.4,
                    },
                },
                lsp_incoming_calls = {
                },
                lsp_document_symbols = {
                    symbol_width = 40,
                },
                lsp_dynamic_workspace_symbols = {
                },
            },
        })
    end,
}
