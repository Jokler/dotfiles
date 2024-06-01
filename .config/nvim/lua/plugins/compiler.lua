return {
  { -- This plugin
    "Zeioth/compiler.nvim",
    keys = {
      {
        "<leader>cO",
        "<CMD>CompilerOpen<CR>",
        desc = "Open compiler",
        mode = { "n" },
        silent = true,
      },
      {
        "<leader>co",
        "<CMD>CompilerStop<CR>" .. "<CMD>CompilerRedo<CR>",
        desc = "Redo last compiler option",
        mode = { "n" },
        silent = true,
      },
      {
        "<leader>ct",
        "<CMD>CompilerToggleResults<CR>",
        desc = "Toggle compiler results",
        mode = { "n" },
        silent = true,
      },
    },
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim" },
    opts = {},
  },
  { -- The task runner we use
    "stevearc/overseer.nvim",
    commit = "68a2d344cea4a2e11acfb5690dc8ecd1a1ec0ce0",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 10,
        max_height = 20,
        default_detail = 1,
      },
    },
  },
}
