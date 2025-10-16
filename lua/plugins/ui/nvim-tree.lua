return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local function on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)

      -- vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Go up to parent directory"))
      -- vim.keymap.set("n", "?", api.tree.toggle_help, opts("Toggle help panel"))
      --
      -- vim.keymap.set("n", "<leader>pv", "<cmd>NvimTreeFocus<cr>", { desc = "nvim-tree: Focus on file tree" })
      -- vim.keymap.set("n", "<leader>pt", "<cmd>NvimTreeToggle<cr>", { desc = "nvim-tree: Toggle file tree" })

      vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, { buffer = bufnr, desc = "Go up to parent directory" })
      vim.keymap.set("n", "?", api.tree.toggle_help, { buffer = bufnr, desc = "Toggle help panel" })

      -- globalne mapowania (działa też w which-key)
      vim.keymap.set("n", "<leader>pv", "<cmd>NvimTreeFocus<cr>", { desc = "Focus on file tree" })
      vim.keymap.set("n", "<leader>pt", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree" })
    end

    require("nvim-tree").setup({
      on_attach = on_attach,
    })
  end,
}
