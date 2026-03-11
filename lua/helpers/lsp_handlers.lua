local M = {}

function M.on_attach(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    -- Navigation
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

    -- Diagnostics
    vim.keymap.set("n", "<leader>qd", vim.diagnostic.setloclist, opts)

    -- Editing
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
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    -- Formatting
    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)

    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function() vim.lsp.buf.format() end,
        })
    end
end

-- Capabilities (needed for nvim-cmp completion)
M.capabilities = require("cmp_nvim_lsp").default_capabilities()

return M
