return
{
  'neovim/nvim-lspconfig',
  dependencies = {"hrsh7th/cmp-nvim-lsp"
},
	config = function()
		require("utils.diagnostics").setup()
		require("servers")
	end,
}
