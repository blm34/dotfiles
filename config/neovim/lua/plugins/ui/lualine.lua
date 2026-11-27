-- Determine name of terminal
local function get_terminal_name()
    local terms = require("toggleterm.terminal").get_all()
    local buf = vim.api.nvim_get_current_buf()

    for _, term in pairs(terms) do
        if term.bufnr == buf then
            if term.id < 10 then
                return "Terminal " .. term.id
            else
                return term.display_name
            end
        end
    end
end

-- Shortened version of modes
local mode_short = {
    ["NORMAL"]    = "NORM",
    ["INSERT"]    = "INS",
    ["VISUAL"]    = "VIS",
    ["V-LINE"]    = "VIS-L",
    ["V-BLOCK"]   = "VIS-B",
    ["V-REPLACE"] = "VIS-R",
    ["REPLACE"]   = "R",
    ["COMMAND"]   = "CMD",
    ["TERMINAL"]  = "TERM",
    ["SELECT"]    = "S",
    ["S-LINE"]    = "S-LINE",
    ["S-BLOCK"]   = "S-BLOCK",
    ["O-PENDING"] = "O",
}

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
        require("lualine").setup({
            options = {
                theme = "tomorrow_night",
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                icons_enabled = true,
                globalstatus = false,
                disabled_filetypes = { 'NvimTree' },
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        fmt = function(str) return mode_short[str] or str:sub(1, 1) end,
                    }
                },
                lualine_b = {
                    {
                        "filename",
                        path = 4,
                        shorting_target = 40,
                        symbols = { modified = "●", unnamed = "", readonly = "" },
                        cond = function() return vim.bo.buftype ~= "terminal" end
                    },
                    {
                        get_terminal_name,
                        cond = function() return vim.bo.buftype == "terminal" end
                    }
                },
                lualine_c = {
                    {
                        "branch",
                        cond = function() return vim.bo.buftype ~= "terminal" end
                    },
                    {
                        "diff",
                        cond = function() return vim.bo.buftype ~= "terminal" end
                    }
                },
                lualine_x = {
                    {
                        "searchcount",
                        icon = "⌕",
                    },
                    {
                        "diagnostics",
                        sources = { 'nvim_diagnostic' },
                    },
                },
                lualine_y = {
                    {
                        "lsp_status",
                        separator = ",",
                    },
                },
                lualine_z = {
                    "progress",
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        "filename",
                        path = 4,
                        shorting_target = 40,
                        symbols = { modified = "●", unnamed = "", readonly = "" },
                        cond = function() return vim.bo.buftype ~= "terminal" end
                    },
                    {
                        get_terminal_name,
                        cond = function() return vim.bo.buftype == "terminal" end,
                    }
                },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            extensions = { "quickfix", "nvim-tree" }
        })
    end
}
