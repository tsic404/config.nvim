local settings = {}
local home = require("core.global").home

-- Set it to false if you want to use https to update plugins and treesitter parsers.
---@type boolean
settings["use_ssh"] = true

-- Set it to false if there are no need to format on save.
---@type boolean
settings["format_on_save"] = false

-- Set it to false if diagnostics virtual text is annoying for you
---@type boolean
settings["diagnostics_virtual_text"] = true

-- Set the format disabled directories here, files under these dirs won't be formatted on save.
---@type string[]
settings["format_disabled_dirs"] = {
	home .. "/format_disabled_dir_under_home",
}

-- NOTE: The startup time will be slowed down when it's true.
-- Set it to false if you don't use nvim to open big files.
---@type boolean
settings["load_big_files_faster"] = false

-- Change the colors of the global palette here.
-- Settings will complete their replacement at initialization.
-- Parameters will be automatically completed as you type.
-- Example: { sky = "#04A5E5" }
---@type palette
settings["palette_overwrite"] = {}

-- Set the colorscheme to use here.
-- Available values are: `catppuccin`, `catppuccin-latte`, `catppucin-mocha`, `catppuccin-frappe`, `catppuccin-macchiato`, `edge`, `nord`.
---@type string
settings["colorscheme"] = "catppuccin"

-- Set background color to use here.
-- Useful if you would like to use a colorscheme that has a light and dark variant like `edge`.
-- Valid values are: `dark`, `light`.
---@type "dark"|"light"
settings["background"] = "dark"

-- Filetypes in this list will skip lsp formatting if rhs is true
---@type table<string, boolean>
settings["formatter_block_list"] = {
	lua = false, -- example
}

-- Servers in this list will skip setting formatting capabilities if rhs is true
---@type table<string, boolean>
settings["server_formatting_block_list"] = {
	tsserver = true,
}

-- Set the language servers that will be installed during bootstrap here
-- check the below link for all the supported LSPs:
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations
---@type string[]
settings["lsp_deps"] = {
	"bashls",
	"clangd",
	"html",
	"jsonls",
	"lua_ls",
	"pyright",
	"gopls",
    "cmake",
    "rust_analyzer",
    "eslint",
    "tsserver",
}

-- Set the general-purpose servers that will be installed during bootstrap here
-- check the below link for all supported sources
-- in `code_actions`, `completion`, `diagnostics`, `formatting`, `hover` folders:
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins
---@type string[]
settings["null_ls_deps"] = {
	"black",
	"editorconfig_checker",
	"prettier",
	"rustfmt",
    "cmakelang",
	"beautysh",
}

settings["treesitter_deps"] = {
    "bash",
    "c",
    "cpp",
    "css",
    "cmake",
    "glsl",
    "go",
    "gomod",
    "gosum",
    "gowork",
    "html",
    "hlsl",
    "javascript",
    "json",
    "latex",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "python",
    "qmljs",
    "typescript",
    "vimdoc",
    "vue",
    "yaml",
}

return settings
