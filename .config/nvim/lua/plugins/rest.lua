return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
    },
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    keys = {
      {
        "<leader>rr",
        "<cmd>Rest run<cr>",
        desc = "Run request under the cursor",
        silent = true,
      },
      {
        "<leader>rl",
        "<cmd>Rest run last<cr>",
        desc = "Re-run latest request",
        silent = true,
      },
      -- {
      --   "<localleader>re",
      --   require("telescope").extensions.rest.select_env(),
      --   desc = "Select env file",
      --   silent = true,
      -- },
    },
    dependencies = { "luarocks.nvim" },
    config = function()
      require("rest-nvim").setup()
      require("telescope").load_extension("rest")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "xml",
        "http",
        "json",
        "graphql",
      },
    },
  },
}
