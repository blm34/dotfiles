local M = {}

-- Global autoformat toggle state
vim.g.autoformat_enabled = true

function M.on_attach(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    -- Diagnostics
    opts.desc = "Add diagnostics to location list"
    vim.keymap.set("n", "<leader>qd", vim.diagnostic.setloclist, opts)

    -- Formatting
    opts.desc = "Format file"
    vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, opts)

    -- Toggle autoformat on save
    opts.desc = "Toggle format on save"
    vim.keymap.set("n", "<leader>cF", function()
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
