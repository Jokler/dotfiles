return {
  "AndrewRadev/splitjoin.vim",
  init = function()
    vim.g.splitjoin_split_mapping = ""
    vim.g.splitjoin_join_mapping = ""
  end,
  keys = {
    {
      "gJ",
      ":SplitjoinJoin<CR>",
      desc = "Join the object under cursor",
    },
    {
      "gS",
      ":SplitjoinSplit<CR>",
      desc = "Split the object under cursor",
    },
  },
}
