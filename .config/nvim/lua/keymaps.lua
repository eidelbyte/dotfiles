local keymap = vim.keymap.set
local s = { silent = true }

vim.g.mapleader = " "            -- Sets <Leader>

keymap("n", "<Leader>", "<Nop>") -- Clear <Leader> of any commands, as it's used by us

keymap("n", "j", function()
	return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "j" or "gj"
end, { expr = true, silent = true }) -- Move down, but use 'gj' if no count is given
keymap("n", "k", function()
	return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "k" or "gk"
end, { expr = true, silent = true })                               -- Move up, but use 'gk' if no count is given
keymap("n", "<C-d>", "<C-d>zz")                                    -- Scroll down and center the cursor
keymap("n", "<C-u>", "<C-u>zz")                                    -- Scroll up and center the cursor
keymap("n", "n", "nzzzv")                                          -- Center next search results
keymap("n", "N", "Nzzzv")                                          -- Center previous search results
keymap("n", "<Leader>q", "<C-w>q", s)                              -- Close the current buffer, or window by index
keymap("n", "<Leader>Q", "<Cmd>windo bd<CR>", s)                   -- Quit Neovim
keymap("n", "<Leader>n", "<Cmd>tabnew<CR>", s)                     -- Open a new tab
keymap("n", "<Leader><Tab>", "<Cmd>tabnext<CR>", s)                -- Cycle to the next tab
keymap("n", "<Leader><S-Tab>", "<Cmd>tabprev<CR>", s)              -- Cycle to the prev tab (TODO: FIXME)
keymap("n", "<Leader>-", "<Cmd>new<CR><Cmd>FzfLua files<CR>", s)   -- Split the window horizontally
keymap("n", "<Leader>\\", "<Cmd>vnew<CR><Cmd>FzfLua files<CR>", s) -- Split the window vertically
keymap("n", "<Leader><Space>", "<Cmd>w!<CR>", s)                   -- Save the current buffer (Starts format hook using LSP)
keymap("x", "y", [["+y]], s)                                       -- Yank to the system clipboard in visual mode
keymap("n", "yy", [["+yy]], s)                                     -- Yank to the system clipboard in visual mode
keymap("t", "<Esc>", [[<C-\><C-N>]])                               -- Exit terminal mode
keymap("v", "<Leader>p", '"_dP')                                   -- Paste without overwriting the default register
-- keymap("n", "<leader>cd", '<cmd>lua vim.fn.chdir(vim.fn.expand("%:p:h"))<CR>') -- Change directory to the current file's directory

keymap("n", "<C-Space>", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true }) -- Go to definition
keymap("n", "<Leader>uu", '<Cmd>lua vim.pack.update()<CR>')

keymap("n", "<Leader>ff", '<Cmd>FzfLua files<CR>')
keymap("n", "<Leader>fg", '<Cmd>FzfLua live_grep<CR>')

keymap("n", "<Leader>h", '<C-w>h') -- navigate windows
keymap("n", "<Leader>j", '<C-w>j')
keymap("n", "<Leader>k", '<C-w>k')
keymap("n", "<Leader>l", '<C-w>l')

keymap("n", "<Leader>H", '<C-w>H') -- move windows
keymap("n", "<Leader>J", '<C-w>J')
keymap("n", "<Leader>K", '<C-w>K')
keymap("n", "<Leader>L", '<C-w>L')

keymap("n", "<leader>t", '<Cmd>term<CR>a')   -- enter terminal in insert mode
keymap("n", "<Leader>g", '<Cmd>tab Git<CR>') -- Git in new tab
