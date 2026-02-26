local opt = vim.opt
local cmd = vim.cmd

opt.signcolumn = "yes:1"                           -- Always show sign column
opt.termguicolors = true                           -- Enable true colors
opt.ignorecase = true                              -- Ignore case in search
opt.autoindent = true                              -- Enable auto indentation
opt.expandtab = false                              -- Use tabs instead of spaces
opt.tabstop = 4                                    -- Number of spaces for a tab
opt.softtabstop = 0                                -- Disable softtabstop, why would I want <tab> to not expand to 1 Tab?
opt.shiftwidth = 0                                 -- See above, but for new lines
opt.list = true                                    -- Show whitespace characters
opt.number = true                                  -- Show line numbers
opt.numberwidth = 2                                -- Width of the line number column
opt.inccommand = "nosplit"                         -- Shows the effects of a command incrementally in the buffer
opt.undodir = os.getenv('HOME') .. '/.vim/undodir' -- Directory for undo files
opt.undofile = true                                -- Enable persistent undo
opt.completeopt = { "fuzzy", "menuone", "popup" }
opt.wrap = false                                   -- Disable line wrapping
opt.timeout = false                                -- Allow commands to be typed over any amount of time

vim.g.loaded_netrw = 1                             -- disable netrw, we have fzf-ff
vim.g.loaded_netrwPlugin = 1                       -- see above

cmd.filetype("plugin indent on")                   -- Enable filetype detection, plugins, and indentation
cmd.colorscheme("everforest")                      -- turn on preferred colorscheme by default
