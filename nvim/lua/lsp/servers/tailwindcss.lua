local M = {}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.colorProvider = { dynamicRegistration = false }
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

-- Settings

local on_attach = function(client, bufnr)
	if client.server_capabilities.colorProvider then
		require("lsp.utils.colors").buf_attach(bufnr)
		require("colorizer").attach_to_buffer(
			bufnr,
			{ mode = "background", css = true, names = false, tailwind = false }
		)
	end
end

local filetypes = { "html", "mdx", "javascript", "javascriptreact", "typescriptreact", "typescript", "vue", "svelte", "astro", "scss", "css" }

local init_options = {
	userLanguages = {
		eelixir = "html-eex",
		eruby = "erb",
	},
}

local settings = {
	tailwindCSS = {
		lint = {
			cssConflict = "warning",
			invalidApply = "error",
			invalidConfigPath = "error",
			invalidScreen = "error",
			invalidTailwindDirective = "error",
			invalidVariant = "error",
			recommendedVariantOrder = "warning",
		},
		experimental = {
			classRegex = {
				"tw`([^`]*)",
				'tw="([^"]*)',
				'tw={"([^"}]*)',
				"tw\\.\\w+`([^`]*)",
				"tw\\(.*?\\)`([^`]*)",
				{ "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
				{ "classnames\\(([^)]*)\\)", "'([^']*)'" },
				{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
			},
		},
		validate = true,
	},
}

local root_dir = require("lspconfig.util").root_pattern(
  "tailwind.config.js",
  "tailwind.config.cjs",
  "windi.config.cjs",
  "windi.config.js",
  "windi.config.ts",
  "postcss.config.js",
  "postcss.config.cjs"
)

-- M.on_attach = on_attach
M.filetypes = filetypes
M.capabilities = capabilities
M.settings = settings
M.init_options = init_options
M.root_dir = root_dir

return M
