local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local fn = vim.fn

-- Highlight yanked text
local highlight_group = augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
	pattern = '*',
	callback = function()
		vim.highlight.on_yank({ timeout = 170 })
	end,
	group = highlight_group,
})

autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format { async = false }
	end,
})


local statuslineGroup = augroup("Statusline", { clear = true })

autocmd({ "WinEnter", "BufEnter" }, {
	group = statuslineGroup,
	desc = "Activate statusline on focus",
	callback = function()
		vim.opt_local.statusline = "%!v:lua.Statusline.active()"
	end,
})

autocmd({ "WinLeave", "BufLeave" }, {
	group = statuslineGroup,
	desc = "Deactivate statusline when unfocused",
	callback = function()
		vim.opt_local.statusline = "%!v:lua.Statusline.inactive()"
	end,
})

autocmd('VimEnter', {
	desc = 'open fzf-lua instead of netrw on directories',
	group = augroup('VimEnter-FzfLua', { clear = true }),
	callback = function()
		local is_dir = fn.isdirectory(fn.expand('%:p'))
		if is_dir == 1 and vim.bo.buftype == '' then
			vim.api.nvim_set_current_dir(fn.expand('%:p'))
			vim.schedule(function() require("fzf-lua").files() end)
		end
	end
})
