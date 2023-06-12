return {
    "ibhagwan/fzf-lua",
    branch = "main",
    keys = {
      { "<leader>f", "<cmd>lua require('fzf-lua').files()<CR>", desc = "search files"},
      { "<leader>b", "<cmd>lua require('fzf-lua').buffers()<CR>", desc = "search buffers"},
  },
}   
