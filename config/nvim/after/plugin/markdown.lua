-- sync goyo and limelight
vim.cmd('autocmd! User GoyoEnter Limelight')
vim.cmd('autocmd! User GoyoLeave Limelight!')

-- TODO figure out what the fuck this keybinding is
vim.keymap.set('n', '<M-m>', ':MarkdownPreview<CR>')

vim.cmd('let g:vim_markdown_frontmatter = 1')
vim.cmd('let g:vim_markdown_toml_frontmatter = 1')
vim.cmd('let g:vim_markdown_strikethrough = 1')
vim.cmd('let g:vim_markdown_strikethrough = 1')

vim.cmd('let g:vim_markdown_folding_disabled = 1')

