local M = {}

-- Global autoformat toggle state
vim.g.autoformat_enabled = true

function M.on_attach(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    -- Navigation
    opts.desc = "Go to definition"
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    opts.desc = "Go to declaration"
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    opts.desc = "Add references to qfl"
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    opts.desc = "Add implementations to qfl"
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    opts.desc = "Go to type definition"
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
    opts.desc = "Go to previous diagnostic"
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    opts.desc = "Go to next diagnostic"
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

    -- Diagnostics
    opts.desc = "Add diagnostics to location list"
    vim.keymap.set("n", "<leader>qd", vim.diagnostic.setloclist, opts)

    -- Editing
    opts.desc = "Rename variable"
    vim.keymap.set("n", "<leader>rn", function()
        local current_name = vim.fn.expand("<cword>")
        vim.ui.input({
            prompt = "Rename to: ",
            default = current_name,
        }, function(input)
            if input and #input > 0 and input ~= current_name then
                vim.lsp.buf.rename(input)
            end
        end)
    end, opts)

    -- Code
    opts.desc = "List code actions"
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    -- Formatting
    opts.desc = "Format file"
    vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, opts)

    -- Toggle autoformat on save
    opts.desc = "Toggle format on save"
    vim.keymap.set("n", "<leader>caf", function()
            vim.g.autoformat_enabled = not vim.g.autoformat_enabled
            local state = vim.g.autoformat_enabled and "enabled" or "disabled"
            vim.notify("Autoformat on save: " .. state, vim.log.levels.INFO)
        end,
        { noremap = true, silent = true, desc = "Toggle autoformat on save" }
    )

    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                if vim.g.autoformat_enabled then
                    vim.lsp.buf.format()
                end
            end,
        })
    end
end

-- Capabilities (needed for nvim-cmp completion)
M.capabilities = require("cmp_nvim_lsp").default_capabilities()

return M
