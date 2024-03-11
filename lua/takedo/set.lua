-----------------------------------------------------------------------------------------
-- To check documentation: --> e.g :help winbar
-----------------------------------------------------------------------------------------

vim.opt.winbar = "%=%m %f"

vim.opt.clipboard = "unnamedplus"

vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.splitbelow = true
vim.opt.splitright = true

-- Show which line your cursor is on
vim.opt.cursorline = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.belloff = "all"

vim.opt.ignorecase = true         -- Ignore case in search (case insensitive pattern matching)
vim.opt.smartcase = true          -- Overrides ignorecase if pattern contains upcase
vim.opt.showmatch = true          -- Show bracket matches

vim.opt.scrolloff = 4

vim.opt.incsearch = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.termguicolors = true

vim.opt.signcolumn = "auto"

-----------------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- open Netrw with "leader + pv" (while in normal mode)

vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", ":noh<CR>", { noremap = true, silent = true, desc = "Stop highlighting" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Use alt + h,j,k,l to resize windows
vim.keymap.set('n', '<M-j>', ':resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<M-k>', ':resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<M-h>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<M-l>', ':vertical resize +2<CR>', { noremap = true, silent = true })

-----------------------------------------------------------------------------------------
-- VimWiki
-----------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>ww", ":VimwikiIndex<CR>", { noremap = true, silent = true })

vim.g.vimwiki_list = {
  { path = "~/vimwiki/", syntax = "markdown", ext = ".md" },
}
vim.g.vimwiki_ext2syntax = { [".md"] = "markdown", [".markdown"] = "markdown", [".mdown"] = "markdown" }
-- Makes vimwiki markdown linkas as [text](text.md) instead of [text](text)
vim.g.vimwiki_markdown_link_ext = 1

-----------------------------------------------------------------------------------------
-- vim-floaterm
-----------------------------------------------------------------------------------------

vim.g.floaterm_width = 0.95
vim.g.floaterm_height = 0.95


