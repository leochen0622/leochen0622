return {
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "retrobox",
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = function(_, opts)
			opts.diagnostics = {
				enabled = false,
				signs = false,
				virtual_text = false,
				underline = false,
			}
			opts.inlay_hints = {
				enabled = false,
			}
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function(_, opts)
			table.remove(opts.sections.lualine_z)
		end,
	},
	{
		"akinsho/bufferline.nvim",
		opts = function(_, opts)
			opts.options = {
				diagnostics = false,
				show_buffer_icons = false,
				truncate_names = false
			}
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = function(_, opts)
			opts.formatters_by_ft = {
				c = { "clang_format" },
			}
		end,
	},
	{
		"dhruvasagar/vim-table-mode",
		lazy = false,
	},
	{
		"folke/trouble.nvim",
		keys = {
			{
				"<F2>",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			}
		}
	},
	-- {
	-- 	"folke/snacks.vim",
	-- 	opts = function(_, opts)
	-- 		opts.picker.sources.explorer.layout = {
	-- 			layout = {
	-- 				position = "right",
	-- 			},
	-- 		}
	-- 	end,
	-- },
	-- {
	-- 	"folke/ts-comments.nvim",
	-- 	opts = function(_, opts)
	-- 		opts.options = {
	-- 			c = { "/*%s", " * %s", " */" },
	-- 		}
	-- 	end,
	-- },
}
