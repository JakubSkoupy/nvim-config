return {
    "mfussenegger/nvim-dap",
    dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio", "folke/neodev.nvim", "jay-babu/mason-nvim-dap.nvim" },
    config = function()
        local dap, dapui = require("dap"), require("dapui")

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


        dap.configurations.cpp = {
            {
                name = "Launch",
                type = "cpp",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                args = {}
            }
        }

        dap.adapters.cpp = {
            type = 'executable',
            command = '/usr/bin/lldb',
            -- env = {
            --     LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
            -- },
            name = "lldb"
        }

        dap.configurations.lua = {
            {
                name = "Launch",
                type = "lua",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                args = {}
            }
        }

        dap.adapters.lua = {
            type = 'executable',
            command = '/usr/bin/lldb',
            -- env = {
            --     LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
            -- },
            name = "lldb"
        }
    end,
}
