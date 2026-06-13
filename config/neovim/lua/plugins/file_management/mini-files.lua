-- Allow opening files into new splits/tabs
local map_split = function(buf_id, lhs, direction)
    local rhs = function()
        local minifiles = require("mini.files")
        local cur_target = minifiles.get_explorer_state().target_window
        local new_target = vim.api.nvim_win_call(cur_target, function()
            vim.cmd(direction .. ' split')
            return vim.api.nvim_get_current_win()
        end)

        minifiles.set_target_window(new_target)
        minifiles.go_in()
    end

    local desc = 'Split ' .. direction
    vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
end

vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesBufferCreate',
    callback = function(args)
        local buf_id = args.data.buf_id
        map_split(buf_id, '<C-h>', 'belowright horizontal')
        map_split(buf_id, '<C-v>', 'belowright vertical')
        map_split(buf_id, '<C-t>', 'tab')
    end,
})

-- LSP aware renaming of files
vim.api.nvim_create_autocmd('User', {
    pattern = "MiniFilesActionRename",
    callback = function(event)
        require("snacks").rename.on_rename_file(event.data.from, event.data.to)
    end,
})

return {
    "nvim-mini/mini.files",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "folke/snacks.nvim",
    },
    keys = {
        {
            "<leader>fo",
            function() if not require("mini.files").close() then require("mini.files").open() end end,
            desc = "Open mini.files",
        },
        {
            "<leader>ff",
            function()
                if not require("mini.files").close() then
                    require("mini.files").open(vim.api.nvim_buf_get_name(0),
                        false)
                end
            end,
            desc = "Open mini.files at current file",
        },
        {
            "<leader>fd",
            function() if not require("mini.files").close() then require("mini.files").open(nil, false) end end,
            desc = "Open mini.files at cwd",
        },

    },
    opts = {
        options = {
            permanent_delete = false,
            use_as_default_explorer = true,
        },
    },
}
