local handlers = require("helpers.lsp_handlers")

return {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
}
