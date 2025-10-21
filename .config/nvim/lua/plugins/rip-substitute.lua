return{
	"chrisgrieser/nvim-rip-substitute",
	cmd = "RipSubstitute",
keys = {
		{
			"<C-f>",
			function() require("rip-substitute").sub() end,
			mode = { "n", "x" },
			desc = " rip substitute",
		}
	}
}
