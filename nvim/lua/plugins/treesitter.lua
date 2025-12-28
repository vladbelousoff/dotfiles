return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "lua", "javascript", "cpp", "html", "python" },
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
  },
}
