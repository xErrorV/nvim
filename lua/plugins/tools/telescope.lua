return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  keys = {
    { "<leader>pf", desc = "Telescope find files", mode = "n" },
    { "<leader>pg", desc = "Telescope live grep",  mode = "n" },
    { "<leader>pb", desc = "Telescope buffers",    mode = "n" },
    { "<C-p>",      desc = "Telescope git files",  mode = "n" },
  },
  config = function()
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
    vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
    vim.keymap.set("n", "<C-p>", builtin.git_files, {})
  end,
  dependencies = { 'nvim-lua/plenary.nvim' },
}
