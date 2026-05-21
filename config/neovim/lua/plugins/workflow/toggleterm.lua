local is_windows = require("helpers.os").is_windows

if is_windows then
    local powershell_options = {
        shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
        shellcmdflag =
        "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
        shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
        shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
        shellquote = "",
        shellxquote = "",
    }

    for option, value in pairs(powershell_options) do
        vim.opt[option] = value
    end
end

local apply_keymaps

local function open_floating_terminal()
    local Terminal = require("toggleterm.terminal").Terminal
    Terminal:new({
        direction = "float",
        close_on_exit = true,
        float_opts = {
            border = "curved",
            width = math.floor(vim.o.columns * 0.93),
            height = math.floor(vim.o.lines * 0.93),
        },
        on_open = function(term)
            apply_keymaps(term, false)
        end
    }):toggle()
end

local terminals = {}
local function get_persistent_terminal(num)
    if not terminals[num] then
        local Terminal = require("toggleterm.terminal").Terminal
        terminals[num] = Terminal:new({
            count = num,
            direction = "horizontal",
            close_on_exit = false,
            on_open = function(term)
                apply_keymaps(term, true)
            end
        })
    end
    return terminals[num]
end

apply_keymaps = function(term, is_persistent)
    vim.keymap.set({ "t", "n" }, "<Esc><Esc>", "<cmd>close<cr>", { buffer = term.bufnr, desc = "Close terminal" })
    vim.keymap.set("t", "<C-q>", "<C-\\><C-n>", { buffer = term.bufnr, desc = "Terminal: normal mode" })

    if is_persistent then
        vim.keymap.set("t", "<M-6>", open_floating_terminal, { buffer = term.bufnr, desc = "Open temporary terminal" })
        vim.keymap.set("t", "<M-7>", function() get_persistent_terminal(1):toggle() end,
            { buffer = term.bufnr, desc = "Toggle terminal 1" })
        vim.keymap.set("t", "<M-8>", function() get_persistent_terminal(2):toggle() end,
            { buffer = term.bufnr, desc = "Toggle terminal 2" })
        vim.keymap.set("t", "<M-9>", function() get_persistent_terminal(3):toggle() end,
            { buffer = term.bufnr, desc = "Toggle terminal 3" })
        vim.keymap.set("t", "<M-0>", function() get_persistent_terminal(4):toggle() end,
            { buffer = term.bufnr, desc = "Toggle terminal 4" })
    end
end

return {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    version = "*",
    keys = {
        { "<M-6>", open_floating_terminal,                             desc = "Open temporary terminal" },
        { "<M-7>", function() get_persistent_terminal(1):toggle() end, desc = "Toggle terminal 1" },
        { "<M-8>", function() get_persistent_terminal(2):toggle() end, desc = "Toggle terminal 2" },
        { "<M-9>", function() get_persistent_terminal(3):toggle() end, desc = "Toggle terminal 3" },
        { "<M-0>", function() get_persistent_terminal(4):toggle() end, desc = "Toggle terminal 4" },
    },
    opts = {
        open_mapping = nil,
        insert_mappings = false,
        terminal_mappings = true,
        size = 20,
        hide_numbers = true,
        direction = "horizontal",
    },
}
