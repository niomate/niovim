vim.api.nvim_create_user_command('OpenConfig', function(opts)
	local path = "~/.config/nvim/" .. opts.args
	vim.cmd("e " .. path)
end, { nargs = 1 })

vim.api.nvim_create_user_command('ReloadConfig', 'source ~/.config/nvim/init.lua', { nargs = 0 })
