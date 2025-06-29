return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("plugins.dap.config") -- your DAP core config
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("plugins.dap.ui") -- dap-ui config
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio"
    },
    config = function()
      require("plugins.dap.mason") -- Mason DAP setup
    end,
  },
}