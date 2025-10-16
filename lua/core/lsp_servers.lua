local servers = {
  { cmd = "clangd",                      ft = { "c", "cpp" },                                                       root = { "CMakeLists.txt" } },
  { cmd = "gopls",                       ft = { "go" },                                                             root = { "go.mod" } },
  { cmd = "lua-language-server",         ft = { "lua" },                                                            root = { ".luarc.json", ".luarc.jsonc", "luacheckrc" } },
  { cmd = "rust-analyzer",               ft = { "rust" },                                                           root = { "Cargo.toml" } },
  { cmd = "pyright",                     ft = { "python" },                                                         root = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile" } },
  { cmd = "vscode-html-language-server", ft = { "html" },                                                           root = {} },
  { cmd = "vscode-css-language-server",  ft = { "css", "scss", "less" },                                            root = {} },
  { cmd = "typescript-language-server",  ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" }, root = { "package.json", "tsconfig.json", "jsconfig.json" } },
  { cmd = "nil",                         ft = { "nix" },                                                            root = { "flake.nix", "default.nix" } },
}

local function make_lsp(entry)
  return {
    cmd = { entry.cmd },
    filetypes = entry.ft,
    root_markers = vim.tbl_extend("force", entry.root or {}, { ".git" }),
  }
end

local lsp_configs = {}
for _, server in ipairs(servers) do
  table.insert(lsp_configs, make_lsp(server))
end

return lsp_configs
