-- Native LSP. Server configs come from nvim-lspconfig; install servers with :Mason
-- Elixir: Expert (official) if installed, otherwise elixir-ls.
local servers = { "lua_ls" }
if vim.fn.executable("expert") == 1 then
  table.insert(servers, "expert")
else
  table.insert(servers, "elixirls")
  vim.lsp.config("elixirls", {
    cmd = { "elixir-ls" },
    settings = { elixirLS = { dialyzerEnabled = true } },
  })
end

vim.lsp.config("lua_ls", {
  settings = { Lua = { diagnostics = { globals = { "vim" } } } },
})

vim.lsp.enable(servers)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local map = function(lhs, rhs) vim.keymap.set("n", lhs, rhs, { buffer = args.buf, silent = true }) end
    map("gd", vim.lsp.buf.definition)
    map("gy", vim.lsp.buf.type_definition)
    map("gi", vim.lsp.buf.implementation)
    map("gr", vim.lsp.buf.references)
    map("K", vim.lsp.buf.hover) -- documentation
    map("[g", function() vim.diagnostic.jump({ count = -1 }) end)
    map("]g", function() vim.diagnostic.jump({ count = 1 }) end)
    map("<leader>co", vim.lsp.buf.document_symbol) -- file outline
  end,
})
