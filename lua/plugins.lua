-- [[ plugins.lua ]]

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

    use 'nvim-tree/nvim-web-devicons'

	use {
		'nvim-lualine/lualine.nvim',
		requires = {'nvim/nvim-web-devicons', opt = true},
		config = require("config.lualine")
	}

    use {
        'akinsho/bufferline.nvim',
        config = require('config.bufferline')
    }

    use {
        'DanilaMihailov/beacon.nvim',
        config = function()
            vim.g.beacon_shrink = 0
            vim.g.beacon_fade = 0
            vim.g.beacon_timeout = 200
        end
    }

    use 'ishan9299/modus-theme-vim' 
    vim.cmd("colorscheme modus-vivendi")

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({with_sync = true})
            ts_update()
        end
    }

    use 'nvim-treesitter/nvim-treesitter-textobjects'

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use {
        "kylechui/nvim-surround",
        config = function() require("nvim-surround").setup {} end
    }

    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }

    use "nvim-lua/plenary.nvim"

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {'nvim-lua/plenary.nvim'},
		config = require("config.telescope")
    }

    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

    use "nvim-telescope/telescope-file-browser.nvim" 

    use 'nvim-telescope/telescope-project.nvim'

    use {
        "lukas-reineke/virt-column.nvim",
        config = function()
            vim.cmd "highlight clear ColorColumn"
            require "virt-column".setup {char = "│"}
            vim.cmd "highlight VirtColumn guifg=#2f2f30"
        end
    }

    use {
        'hkupty/iron.nvim',
        config = require("config.iron")
    }

    use {
        "williamboman/mason.nvim",
        config = function() require("mason").setup({}) end
    }
    use {
        "williamboman/mason-lspconfig.nvim",
        config = function() require("mason-lspconfig").setup({}) end
    }
    use {
        'neovim/nvim-lspconfig',
        config = require("config.lspconfig")
    }

    use "L3MON4D3/LuaSnip"
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use {
        'hrsh7th/nvim-cmp',
        config = require("config.cmp")
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end
    }

    use {
        'lervag/vimtex',
        config = require('config.latex')
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
