vim.cmd("set expandtab")
vim.cmd("set softtabstop=4")
vim.cmd("set autoindent")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set noexpandtab")
vim.cmd("set number")
vim.cmd("syntax on")
vim.opt.swapfile = false

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"ibhagwan/fzf-lua",
		lazy = true,
		cmd = {
			"FzfLua",
		},
		-- optional for icon support
		-- dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- calling `setup` is optional for customization
			require("fzf-lua").setup({})
			vim.keymap.set('n', '<C-p>', '<cmd>FzfLua files<CR>')
			vim.keymap.set('n', '<C-\\>', '<cmd>FzfLua buffers<CR>')
			vim.keymap.set('n', '<C-g>', '<cmd>FzfLua grep<CR>')
			vim.keymap.set('n', '<C-l>', '<cmd>FzfLua live_grep<CR>')
			vim.keymap.set('n', '<C-k>', '<cmd>FzfLua builtin commands<CR>')
			vim.keymap.set('n', '<C-h>', '<cmd>FzfLua oldfiles<CR>')
		end
	},
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		cmd = {
			"DapSepInfo"
		},
		dependencies = {
			"mfussenegger/nvim-dap-python",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},

		config = function()
			require('dap-python').setup("python3")
			require("dapui").setup({
				icons = { expanded = ">", collapsed = "-" },
				layouts = {
					{
						elements = {
							{ id = "watches", size = 0.20 },
							{ id = "stacks", size = 0.20 },
							{ id = "breakpoints", size = 0.20 },
							{ id = "scopes", size = 0.40 },
						},
						size = 64,
						position = "right",
					},
					{
						elements = {
							"repl",
							"console",
						},
						size = 0.20,
						position = "bottom",
					},
				},
			})

			vim.keymap.set('n', '<leader>c', ':DapContinue<CR>', { silent = true })
			vim.keymap.set('n', '<F10>', ':DapStepOver<CR>', { silent = true })
			vim.keymap.set('n', '<F11>', ':DapStepInto<CR>', { silent = true })
			vim.keymap.set('n', '<F12>', ':DapStepOut<CR>', { silent = true })
			vim.keymap.set('n', '<leader>b', ':DapToggleBreakpoint<CR>', { silent = true })
			vim.keymap.set('n', '<leader>B', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Breakpoint condition: "))<CR>', { silent = true })
			vim.keymap.set('n', '<leader>lp', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', { silent = true })
			vim.keymap.set('n', '<leader>dr', ':lua require("dap").repl.open()<CR>', { silent = true })
			vim.keymap.set('n', '<leader>dl', ':lua require("dap").run_last()<CR>', { silent = true })
			vim.keymap.set('n', '<leader>d', ':lua require("dapui").toggle()<CR>', {})
			vim.keymap.set('n', '<leader>e', ':lua require("dapui").eval()<CR>', {})
		end
	},

})

