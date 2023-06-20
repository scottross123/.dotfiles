-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- dashboard
    use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                theme = 'hyper',
                config = {
                    -- header = { "bruh" }
                },
                preview = {
                    command, -- preview command
                    file_path, -- preview file path
                    file_height, -- preview file height
                    file_width, -- preview file width
                },
            }
        end,
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    -- themes
    use('drewtempelmeyer/palenight.vim')
    use('junegunn/seoul256.vim')
    -- use('metalelf0/base16-black-metal-scheme')
    -- use('liuchengxu/space-vim-dark')
    -- use('andreasvc/vim-256noir')
    use('dikiaap/minimalist')
    use('agude/vim-eldar')
    use('NLKNguyen/papercolor-theme')
    use { 'nyoom-engineering/oxocarbon.nvim' }
    use('RRethy/vim-illuminate')
    --[[
    use({
        'rrethy/vim-hexokinase',
        run = 'cd ~/.local/share/nvim/site/pack/packer/start/vim-hexokinase && make hexokinase'
    })
    ]]--

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
    use('jose-elias-alvarez/null-ls.nvim')

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                icons = false,
                fold_open = "v",      -- icon used for open folds
                fold_closed = ">",    -- icon used for closed folds
                indent_lines = false, -- add an indent guide below the fold icons
                signs = {
                    -- icons / text used for a diagnostic
                    error = "error",
                    warning = "warn",
                    hint = "hint",
                    information = "info"
                },
                use_diagnostic_signs = false
            }
        end
    }

    use('vim-airline/vim-airline')
    use('vim-airline/vim-airline-themes')

    -- markdown writting
    use('junegunn/goyo.vim')
    use('junegunn/limelight.vim')
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    })
    use('godlygeek/tabular')
    use('preservim/vim-markdown')

    -- lightbulb
    use {
        'kosayoda/nvim-lightbulb',
        requires = 'antoinemadec/FixCursorHold.nvim',
    }

    -- barbarbarbar
    -- use { 'romgrk/barbar.nvim', requires = 'nvim-web-devicons' }
end)
