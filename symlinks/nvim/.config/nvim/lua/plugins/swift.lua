return {
  recommended = function()
    return LazyVim.extras.wants({
      ft = "swift",
      root = {
        "*.xcodeproj",
        "*.xcworkspace",
        "buildServer.json",
        "Package.swift",
      },
    })
  end,

  -- add syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "swift" } },
  },

  -- install tools
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "swiftlint" } },
  },

  -- add language server
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sourcekit = {},
      },
    },
  },

  -- add linting
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        swift = { "swiftlint" },
      },
    },
  },

  -- add formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        swift = { "swiftformat" },
      },
    },
  },

  -- add
  {
    "wojciech-kulik/xcodebuild.nvim",
    ft = { "swift" },
    opts = {},
    keys = {
      {
        "<leader>cX",
        function()
          require("xcodebuild.actions").show_picker()
        end,
        desc = "Show Xcodebuild Actions",
      },
      {
        "<leader>cxf",
        function()
          require("xcodebuild.actions").show_project_manager_actions()
        end,
        desc = "Show Project Manager Actions",
      },
      {
        "<leader>cxb",
        function()
          require("xcodebuild.actions").build()
        end,
        desc = "Build Project",
      },
      {
        "<leader>cxB",
        function()
          require("xcodebuild.actions").build_for_testing()
        end,
        desc = "Build For Testing",
      },
      {
        "<leader>cxr",
        function()
          require("xcodebuild.actions").build_and_run()
        end,
        desc = "Build & Run Project",
      },
      {
        "<leader>cxt",
        function()
          require("xcodebuild.actions").run_tests()
        end,
        desc = "Run Tests",
      },
      {
        "<leader>cxt",
        function()
          require("xcodebuild.actions").run_selected_tests()
        end,
        mode = "v",
        desc = "Run Selected Tests",
      },
      {
        "<leader>cxT",
        function()
          require("xcodebuild.actions").run_class_tests()
        end,
        desc = "Run Current Test Class",
      },
      {
        "<leader>cx.",
        function()
          require("xcodebuild.actions").repeat_last_test_run()
        end,
        desc = "Repeat Last Test Run",
      },
      {
        "<leader>cxl",
        function()
          require("xcodebuild.actions").toggle_logs()
        end,
        desc = "Toggle Xcodebuild Logs",
      },
      {
        "<leader>cxC",
        function()
          require("xcodebuild.actions").show_code_coverage_report()
        end,
        desc = "Show Code Coverage Report",
      },
      {
        "<leader>cxe",
        function()
          require("xcodebuild.actions").test_explorer_toggle()
        end,
        desc = "Toggle Test Explorer",
      },
      {
        "<leader>cxs",
        function()
          require("xcodebuild.actions").show_failing_snapshot_tests()
        end,
        desc = "Show Failing Snapshots",
      },
      {
        "<leader>cxd",
        function()
          require("xcodebuild.actions").select_device()
        end,
        desc = "Select Device",
      },
      {
        "<leader>cxp",
        function()
          require("xcodebuild.actions").select_testplan()
        end,
        desc = "Select Test Plan",
      },
      {
        "<leader>cxx",
        function()
          require("xcodebuild.actions").quickfix_line()
        end,
        desc = "Quickfix Line",
      },
      {
        "<leader>cxa",
        function()
          require("xcodebuild.actions").show_code_actions()
        end,
        desc = "Show Code Actions",
      },
    },
  },
}
