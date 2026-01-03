return {
  -- CMake support
  {
    "Civitasv/cmake-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
    ft = { "c", "cpp", "cmake" },
    keys = {
      { "<leader>cg", ":CMakeGenerate<CR>", desc = "CMake: Generate" },
      { "<leader>cb", ":CMakeBuild<CR>", desc = "CMake: Build" },
      { "<leader>cr", ":CMakeRun<CR>", desc = "CMake: Run" },
      { "<leader>cd", ":CMakeDebug<CR>", desc = "CMake: Debug" },
      { "<leader>cc", ":CMakeClean<CR>", desc = "CMake: Clean" },
      { "<leader>ct", ":CMakeSelectLaunchTarget<CR>", desc = "CMake: Select Target" },
      { "<leader>cs", ":CMakeSelectBuildType<CR>", desc = "CMake: Select Build Type" },
    },
    config = function()
      require("cmake-tools").setup({
        cmake_build_directory = "build/${variant:buildType}",
        cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
        cmake_build_type = "Debug",
        cmake_dap_configuration = {
          name = "lldb",
          type = "lldb",
          request = "launch",
        },
      })
    end,
  },
  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<C-\\>", "<cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },
    },
    opts = {
      size = 15,
      direction = "horizontal",
      close_on_exit = true,
    },
  },
}
