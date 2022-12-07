local function config()
	local saga = require("lspsaga")
	saga.init_lsp_saga({
		-- "single" | "double" | "rounded" | "bold" | "plus"
		border_style = "rounded",
	})
end

return {
	"glepnir/lspsaga.nvim",
  branch = "main",
	config = config,
	after = { "nvim-lspconfig" },
}
