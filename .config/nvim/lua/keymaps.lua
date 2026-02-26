local keymap = vim.keymap.set
local s = { silent = true }

vim.g.mapleader = " "            -- Sets <Leader>

keymap("n", "<Leader>", "<Nop>") -- Clear <Leader> of any commands, as it's used by us

keymap("n", "j", function()
	return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "j" or "gj"
end, { expr = true, silent = true }) -- Move down, but use 'gj' if no count is given
keymap("n", "k", function()
	return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "k" or "gk"
end, { expr = true, silent = true })               -- Move up, but use 'gk' if no count is given
keymap("n", "<C-d>", "<C-d>zz")                    -- Scroll down and center the cursor
keymap("n", "<C-u>", "<C-u>zz")                    -- Scroll up and center the cursor
keymap("n", "n", "nzzzv")                          -- Center next search results
keymap("n", "N", "Nzzzv")                          -- Center previous search results
keymap("n", "<Leader>w", "<cmd>w!<CR>", s)         -- Save the current file
keymap("n", "<Leader>q", "<C-w>q<CR>", s)          -- Quit Neovim
keymap("n", "<Leader><Tab>", "<cmd>tabnew<CR>", s) -- Open a new tab
keymap("n", "<Leader>-", "<cmd>split<CR>", s)      -- Split the window horizontally
keymap("n", "<Leader>|", "<cmd>vsplit<CR>", s)     -- Split the window vertically
keymap("n", "<Leader><space>", "<cmd>w!<CR>", s)   -- Format the current buffer using LSP
keymap("x", "y", [["+y]], s)                       -- Yank to the system clipboard in visual mode
keymap("t", "<Esc>", [[<C-\><C-N>]])               -- Exit terminal mode
keymap("v", "<Leader>p", '"_dP')                   -- Paste without overwriting the default register
-- keymap("n", "<leader>cd", '<cmd>lua vim.fn.chdir(vim.fn.expand("%:p:h"))<CR>') -- Change directory to the current file's directory

keymap("n", "<C-Space>", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true }) -- Go to definition
keymap("n", "<leader>uu", '<cmd>lua vim.pack.update()<CR>')

keymap("n", "<leader>ff", '<cmd>FzfLua files<CR>')
keymap("n", "<leader>fg", '<cmd>FzfLua live_grep<CR>')

keymap("n", "<leader>h", '<C-w>h<CR>')
keymap("n", "<leader>j", '<C-w>j<CR>')
keymap("n", "<leader>k", '<C-w>k<CR>')
keymap("n", "<leader>l", '<C-w>l<CR>')

keymap("n", "<leader>H", '<C-w>H<CR>')
keymap("n", "<leader>J", '<C-w>J<CR>')
keymap("n", "<leader>K", '<C-w>K<CR>')
keymap("n", "<leader>L", '<C-w>L<CR>')
