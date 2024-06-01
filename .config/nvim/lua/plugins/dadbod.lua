return {
  {
    "tpope/vim-dadbod",
    lazy = true,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    cmd = "DBUI",
    dependencies = {
      "tpope/vim-dadbod",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "kristijanhusak/vim-dadbod-completion",
    },
    init = function()
      local cmp = require("cmp")
      cmp.setup.filetype("sql", {
        sources = cmp.config.sources({
          { name = "vim-dadbod-completion" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
