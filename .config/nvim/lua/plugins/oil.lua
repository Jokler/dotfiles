return {
  "stevearc/oil.nvim",
  keys = {
    {
      "-",
      "<CMD>Oil<CR>",
      desc = "Open parent directory",
    },
  },
  cmd = "Oil",
  opts = {
    columns = {
      "icon",
      "permissions",
      "size",
      "mtime",
    },
  },
  -- optional
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
