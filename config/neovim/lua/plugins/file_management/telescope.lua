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
            '<leader>sc',
            function() require("telescope.builtin").live_grep() end,
            desc = 'Search file contents in telescope',
        },
        {
            '<leader>sw',
            function() require("telescope.builtin").grep_string() end,
            desc = 'Search word under cursor in telescope',
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
        {
            '<leader>sp',
            function() require("telescope").extensions.project.project() end,
            desc = 'Search projects',
        },
        {
            '<leader>sr',
            function() require("telescope.builtin").oldfiles() end,
            desc = 'Search recent files in telescope',
        },
        {
            '<leader>sk',
            function() require("telescope.builtin").keymaps() end,
            desc = 'Search keymaps in telescope',
        },
        {
            '<leader>slr',
            function() require("telescope.builtin").lsp_references() end,
            desc = 'Search LSP references',
        },
        {
            '<leader>sli',
            function() require("telescope.builtin").lsp_incoming_calls() end,
            desc = 'Search LSP incoming calls',
        },
        {
            '<leader>sld',
            function() require("telescope.builtin").lsp_document_symbols() end,
            desc = 'Search LSP document symbols',
        },
        {
            '<leader>slw',
            function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end,
            desc = 'Search LSP workspace symbols',
        },
        {
            '<leader>sgc',
            function() require("telescope.builtin").git_commits() end,
            desc = 'Search git commits',
        },
        {
            '<leader>sgf',
            function() require("telescope.builtin").git_bcommits() end,
            desc = 'Search git commits (current file)',
        },
        {
            '<leader>sgs',
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

        require("telescope").load_extension("projects")
    end,
}
