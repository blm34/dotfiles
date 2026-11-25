-- Toggle line numbers on/off depending on current mode/active window

local line_numbers_group = vim.api.nvim_create_augroup('blm34/toggle_line_numbers', { clear = true })

vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'CmdlineLeave', 'WinEnter' }, {
    group = line_numbers_group,
    desc = 'Toggle relative line numbers on',
    callback = function()
        if vim.wo.nu and not vim.startswith(vim.api.nvim_get_mode().mode, 'i') then
            vim.wo.relativenumber = true
        end
    end,
})

vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'CmdlineEnter', 'WinLeave' }, {
    group = line_numbers_group,
    desc = 'Toggle relative line numbers off',
    callback = function(args)
        if vim.wo.nu then
            vim.wo.relativenumber = false
        end

        -- Redraw here to avoid having to type something for the numbers to update
        if args.event == 'CmdlineEnter' then
            if not vim.tbl_contains({ '@', '-' }, vim.v.event.cmdtype) then
                vim.cmd.redraw()
            end
        end
    end,
})
