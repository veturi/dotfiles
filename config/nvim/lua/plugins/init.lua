return {
  -- Theme
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function() vim.cmd.colorscheme("gruvbox") end,
  },
  {
    "itchyny/lightline.vim",
    init = function()
      vim.g.lightline = {
        colorscheme = "wombat",
        component = { readonly = '%{&readonly?"x":""}' },
        separator = { left = "", right = "" },
        subseparator = { left = "|", right = "|" },
      }
    end,
  },

  -- Syntax (elixir, heex, eex, sql, vue, dockerfile... replaces polyglot/vim-elixir)
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local langs = { "elixir", "heex", "eex", "erlang", "lua", "vim", "vimdoc",
        "markdown", "markdown_inline", "javascript", "typescript", "html", "css",
        "json", "yaml", "toml", "sql", "bash", "dockerfile", "go", "vue", "c_sharp" }
      require("nvim-treesitter").install(langs)
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args) pcall(vim.treesitter.start, args.buf) end,
      })
    end,
  },

  -- LSP servers installer (config in lua/lsp.lua)
  { "mason-org/mason.nvim", opts = {} },
  { "neovim/nvim-lspconfig" },

  -- Completion
  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      keymap = { preset = "default" }, -- <C-space> open, <C-y> accept, <C-n>/<C-p> select
      completion = { documentation = { auto_show = true } },
    },
  },

  -- Credo on save (replaces neomake)
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = { elixir = { "credo" } }
      vim.api.nvim_create_autocmd("BufWritePost", {
        callback = function() require("lint").try_lint() end,
      })
    end,
  },

  -- Elixir
  { "mattreduce/vim-mix", ft = "elixir" },

  -- FZF
  { "junegunn/fzf", build = "./install --bin" },
  {
    "junegunn/fzf.vim",
    init = function()
      -- CTRL T, CTRL X and CTRL V split from FZF results
      vim.g.fzf_action = { ["ctrl-t"] = "tab split", ["ctrl-x"] = "split", ["ctrl-v"] = "vsplit" }
      -- Sets colorscheme to match VIM color scheme
      vim.g.fzf_colors = {
        fg = { "fg", "Normal" }, bg = { "bg", "Normal" }, hl = { "fg", "Comment" },
        ["fg+"] = { "fg", "CursorLine", "CursorColumn", "Normal" },
        ["bg+"] = { "bg", "CursorLine", "CursorColumn" },
        ["hl+"] = { "fg", "Statement" }, info = { "fg", "PreProc" },
        border = { "fg", "Ignore" }, prompt = { "fg", "Conditional" },
        pointer = { "fg", "Exception" }, marker = { "fg", "Keyword" },
        spinner = { "fg", "Label" }, header = { "fg", "Comment" },
      }
    end,
    keys = {
      { "<leader>e", ":Buffers<CR>" },
      { "<leader>E", ":Lines<CR>" },
      { "<leader>t", ":Files<CR>" },
      { "<leader>T", ":GFiles<CR>" },
      { "<leader>r", ":History:<CR>" },
      { "<leader>R", ":History/<CR>" },
      { "<leader>y", ":Rg<CR>" },
    },
  },

  -- NERDTree
  {
    "preservim/nerdtree",
    lazy = false,
    init = function()
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.cmd("NERDTree") -- Auto open NERDTree
          vim.cmd("wincmd l") -- Target the actual file window upon opening
        end,
      })
    end,
    keys = {
      { "<leader>f", ":NERDTreeToggle<CR>" },
      { "<leader>w", ":NERDTreeFocus<CR>" }, -- Focus to NERDTree viewport
      { "<leader>W", ":NERDTreeFind<CR>" }, -- Show file in NERDTree
    },
  },

  -- vim-test
  {
    "vim-test/vim-test",
    init = function() vim.g["test#strategy"] = "neovim" end,
    keys = {
      { "t<C-n>", ":TestNearest<CR>", silent = true },
      { "t<C-f>", ":TestFile<CR>", silent = true },
      { "t<C-s>", ":TestSuite<CR>", silent = true },
      { "t<C-l>", ":TestLast<CR>", silent = true },
      { "t<C-g>", ":TestVisit<CR>", silent = true },
      { "t<C-v>", ":TestVisit<CR>", silent = true },
    },
  },

  -- yank / delete behaviour
  { "svermeulen/vim-cutlass" }, -- deletions just delete, don't replace yank buffer
  {
    "svermeulen/vim-yoink", -- choose a buffer when pasting
    init = function() vim.g.yoinkIncludeDeleteOperations = 1 end,
    keys = {
      { "p", "<plug>(YoinkPaste_p)" },
      { "P", "<plug>(YoinkPaste_P)" },
    },
  },

  -- Misc
  { "tpope/vim-surround" },
  { "tpope/vim-obsession" },
  { "tpope/vim-dadbod", cmd = "DB" },
  { "kshenoy/vim-signature" },
  { "mtth/scratch.vim" },
  { "mattn/emmet-vim" },
  { "lifepillar/pgsql.vim", ft = "sql" },
  { "itspriddle/vim-marked", keys = { { "<leader>m", ":MarkedToggle!<CR>" } } },
  { "fatih/vim-go", ft = "go", build = ":GoUpdateBinaries" },
  { "OmniSharp/omnisharp-vim", ft = "cs" },
  { "github/copilot.vim" },
}
