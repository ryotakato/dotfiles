-- ===============================
-- Basic Settings
-- ===============================
local opt = vim.opt
local g   = vim.g
local map = vim.keymap.set

-- Encoding
opt.fileencodings = { "ucs-bom", "utf-8", "default", "sjis", "latin1", "iso-2022-jp", "euc-jp" }

-- ===============================
-- Search
-- ===============================
opt.ignorecase = true    -- Ignore case by default
opt.smartcase = true     -- Override ignorecase if uppercase present
opt.wrapscan = true      -- Search wraps around the file
opt.hlsearch = true      -- Highlight search results

-- ===============================
-- View
-- ===============================
opt.number = true        -- Show line numbers
opt.title = true         -- Show file name in title
opt.ruler = true         -- Show cursor position
opt.list = true          -- Show invisible chars like EOL
opt.textwidth = 0        -- No automatic line wrap

-- ===============================
-- Tabs & Indent
-- ===============================
opt.tabstop = 4          -- Tab width
opt.shiftwidth = 4       -- Indent width
opt.expandtab = true     -- Convert tabs to spaces
opt.autoindent = true    -- Copy indent from current line

-- ===============================
-- Status line
-- ===============================
opt.showcmd = true       -- Show command in bottom-right
opt.laststatus = 2       -- Always show status line

-- ===============================
-- Clipboard
-- ===============================
opt.clipboard:append({ "unnamed", "unnamedplus" })

-- ===============================
-- Files
-- ===============================
opt.backup = false       -- Disable backup files

-- ===============================
-- UI / Editing
-- ===============================
opt.showmatch = true     -- Highlight matching brackets
opt.foldmethod = "marker"-- Folding method
opt.backspace = { "indent", "eol", "start" }
opt.wrap = false         -- Disable line wrap


-- ===============================
-- Cursor
-- ===============================
opt.scrolloff = 999     -- always middle of the window

-- ===============================
-- Keymaps
-- ===============================

-- Escape from terminal mode
map("t", "<ESC>", "<C-\\><C-n>", { silent = true })

-- Double ESC to clear search highlight
map("n", "<ESC><ESC>", ":nohlsearch<CR><ESC>", { silent = true })

-- Disable macro recording with q and remap to zq
map("n", "q", "<Nop>")
map("n", "zq", "q")
map("n", "@", "<Nop>")
map("n", "z@", "@")

-- Disable arrow keys in insert and normal mode, use gt/gT for tab switch
map({ "i", "n" }, "<Right>", "<Nop>")
map({ "i", "n" }, "<Left>", "<Nop>")
map({ "i", "n" }, "<Up>", "<Nop>")
map({ "i", "n" }, "<Down>", "<Nop>")
map("n", "<Right>", "gt")
map("n", "<Left>", "gT")

-- Swap ; and : in Normal & Visual mode
map({ "n", "v" }, ";", ":")
map({ "n", "v" }, ":", ";")

-- move up and down
map({ "n", "v" }, "<C-k>", "20k")
map({ "n", "v" }, "<C-j>", "20j")

-- ===============================
-- Python host program
-- ===============================
g.python3_host_prog = vim.fn.expand("~/nvim_python3/.venv/bin/python3")




-- ===============================
-- Plugin management
-- ===============================
require("config.lazy")




-- ===============================
-- Colorscheme
-- ===============================
--vim.cmd[[colorscheme kanagawa-wave]]
vim.cmd[[colorscheme wombat_lush]]



