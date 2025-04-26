return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
	},
	config = function()

		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				border = "rounded",
			},
		})

		-- 2. LSP Capabilities with Completion
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		-- 3. Shared Keymaps and Auto-Formatting
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				local opts = { buffer = event.buf }

				vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts, {desc = "Go to definition"})
				vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts, {desc = "Go to references"})
				vim.keymap.set('n', '<leader>td', function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				if client.supports_method("textDocument/formatting") then
					vim.keymap.set("n", "<leader>f", function()
						vim.lsp.buf.format({ async = true })
					end, opts)
				end
			end,
		})

		local servers = {
			"lua_ls",
			"rust_analyzer",
			"pyright",
			"clangd",
			"bashls",
			"jsonls",
			"yamlls",
			"marksman",
			"verible",
		}

		-- 4. Mason-LSP Setup
		mason_lspconfig.setup({
			ensure_installed = servers,
			automatic_installation = true,
		})

		-- Setup all LSPs
		-- for _, server in ipairs(servers) do
		-- 	vim.lsp.config({
		-- 		name = server,
		-- 		filetypes = require('lspconfig.util').default_config[server].filetypes,
		-- 		root_dir = require('lspconfig.util').root_pattern(
		-- 			require('lspconfig.util').default_config[server].root_dir
		-- 		),
		-- 		settings = {}, 
		-- 	}, base_config) 
		-- end

		vim.lsp.enable(servers)

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
			}),
		})

		vim.diagnostic.config({
			-- virtual_text = true,	     -- Default inline diagnostics
			virtual_lines = true,	     -- multiline diagnostics
			signs = true,			     -- Show gutter icons
			underline = true,		     -- Underline errors
			update_in_insert = false,    -- Don't update during insert
			severity_sort = true         -- Sort by error severity
		})
	end,
}
