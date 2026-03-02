return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "lua", "vim", "vimdoc", "query" },
    highlight = { enable = true },
    indent = { enable = true },
    auto_install = true,
  },
}
