return {
  "mfussenegger/nvim-dap",
  dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
  keys = {
    { "<F5>",       function() require("dap").continue() end,          desc = "Debug: Continue" },
    { "<F10>",      function() require("dap").step_over() end,         desc = "Debug: Step Over" },
    { "<F11>",      function() require("dap").step_into() end,         desc = "Debug: Step Into" },
    { "<F12>",      function() require("dap").step_out() end,          desc = "Debug: Step Out" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dt", function() require("dapui").toggle() end,          desc = "Toggle Debug UI" },
    { "<leader>dx", function() require("dap").terminate() end,         desc = "Terminate" },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()

    dap.listeners.after.event_initialized["dapui"] = function() dapui.open() end
    dap.listeners.before.event_terminated["dapui"] = function() dapui.close() end
    dap.listeners.before.event_exited["dapui"] = function() dapui.close() end

    -- lldb for C/C++ (macOS)
    dap.adapters.lldb = {
      type = "executable",
      command = "/usr/local/opt/llvm/bin/lldb-dap",
      name = "lldb",
    }

    -- Auto-find executable in build directory
    local function get_executable()
      local cwd = vim.fn.getcwd()
      local build_dir = cwd .. "/build"

      -- Try to find executable in build dir
      local handle = io.popen("find " ..
      build_dir .. " -maxdepth 2 -type f -perm +111 ! -name '*.cmake' ! -name 'CMake*' 2>/dev/null | head -1")
      if handle then
        local result = handle:read("*a")
        handle:close()
        result = result:gsub("%s+$", "")
        if result ~= "" then
          return result
        end
      end

      -- Fallback to manual input
      return vim.fn.input("Executable: ", cwd .. "/build/", "file")
    end

    dap.configurations.cpp = {
      {
        name = "Launch (auto-detect)",
        type = "lldb",
        request = "launch",
        program = get_executable,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }
    dap.configurations.c = dap.configurations.cpp
  end,
}
