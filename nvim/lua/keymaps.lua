local keymap = vim.keymap.set

-- Window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Buffer navigation
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")

-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Clear search
keymap("n", "<leader>h", ":nohlsearch<CR>")

-- C/C++ header/source switch
keymap("n", "<leader>lh", ":ClangdSwitchSourceHeader<CR>")

-- Format code
keymap("n", "<leader>f", function() vim.lsp.buf.format() end)

-- Diagnostics (warnings/errors)
keymap("n", "<leader>e", vim.diagnostic.open_float)      -- Show error/warning popup
keymap("n", "[d", vim.diagnostic.goto_prev)              -- Previous diagnostic
keymap("n", "]d", vim.diagnostic.goto_next)              -- Next diagnostic
keymap("n", "<leader>q", vim.diagnostic.setloclist)      -- List all diagnostics
