local function get_python_path()
    local is_windows = require("helpers.os").is_windows
    local mason_path = vim.fn.stdpath("data")
    if is_windows then
        return mason_path .. "\\mason\\packages\\debugpy\\venv\\Scripts\\python.exe"
    else
        return mason_path .. "/mason/packages/debugpy/venv/bin/python"
    end
end

return {
    -- Core DAP
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
            "williamboman/mason.nvim",
            "jay-babu/mason-nvim-dap.nvim",
        },
        keys = {
            {
                "<leader>dc",
                function() require("dap").continue() end,
                desc = "Debug continue",
                noremap = true,
                silent = true,
            },
            {
                "<leader>db",
                function() require("dap").toggle_breakpoint() end,
                desc = "Toggle breakpoint",
                noremap = true,
                silent = true,
            },
            {
                "<leader>dB",
                function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end,
                desc = "Set conditional breakpoint",
                noremap = true,
                silent = true,
            },
            {
                "<leader>dL",
                function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log: ")) end,
                desc = "Set logpoint",
                noremap = true,
                silent = true,
            },
            {
                "<leader>dq",
                function() require("dap").terminate() end,
                desc = "Quit debug session",
                noremap = true,
                silent = true,
            },
            {
                "<leader>dl",
                function() require("dap").run_last() end,
                desc = "Re-run last session",
                noremap = true,
                silent = true,
            },
            {
                "<leader>do",
                function() require("dap").step_over() end,
                desc = "Step over",
                noremap = true,
                silent = true,
            },
            {
                "<leader>di",
                function() require("dap").step_into() end,
                desc = "Step into",
                noremap = true,
                silent = true,
            },
            {
                "<leader>dO",
                function() require("dap").step_out() end,
                desc = "Step out",
                noremap = true,
                silent = true,
            },
            {
                "<leader>du",
                desc = "Toggle DAP UI",
                function() require("dapui").toggle() end,
                noremap = true,
                silent = true,
            }
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- mason-nvim-dap setup
            require("mason-nvim-dap").setup({
                ensure_installed = {
                    "python",
                    "bash",
                },
                automatic_installation = true,
                handlers = {
                    function(config)
                        require("mason-nvim-dap").default_setup(config)
                    end,

                    python = function()
                        -- setup defined below - do nothing here
                    end,
                },
            })

            -- DAP UI setup
            dapui.setup({})

            -- Virtual text setup
            require("nvim-dap-virtual-text").setup({
                highlight_changed_variables = true,
                highlight_new_as_changed = true,
                show_stop_reason = true,
                only_first_definition = false,
                all_references = false,
                virt_text_pos = 'eol',
            })

            -- Python adapter
            dap.adapters.python = {
                type = "executable",
                command = get_python_path(),
                args = { "-m", "debugpy.adapter" },
                options = {
                    detached = false,
                    initialize_timeout_sec = 10,
                },
            }

            dap.configurations.python = {
                {
                    type = "python",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    pythonPath = get_python_path,
                    console = "integratedTerminal",
                    justMyCode = false,
                }
            }

            -- Breakpoint sign definitions
            vim.fn.sign_define("DapBreakpoint", { text = '', texthl = 'DiagnosticError' })
            vim.fn.sign_define("DapBreakpointCondition", { text = '󰋗', texthl = 'DiagnosticError' })
            vim.fn.sign_define("DapLogPoint", { text = 'Ⓛ', texthl = 'DiagnosticError' })
            vim.fn.sign_define("DapStopped", { text = '󰁔', texthl = 'DiagnosticHint', linehl = 'Visual' })
            vim.fn.sign_define("DapBreakpointRejected", { text = '', texthl = 'DiagnosticWarning' })

            -- Auto-open DAP UI
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end,
    },
}
