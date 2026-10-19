-- Shared settings and keymaps (also used by plain vim on remote hosts)
vim.cmd.source(vim.fn.resolve(vim.fn.stdpath("config") .. "/core.vim"))

vim.opt.cmdheight = 2
vim.opt.inccommand = "split" -- live preview for :s (replaces vim-over)
vim.opt.signcolumn = "yes"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  change_detection = { notify = false },
})

require("lsp")
