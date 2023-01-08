function colorMe(color)
    color = color or "shades_of_purple"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = None }) 
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = None }) 
end

colorMe();

