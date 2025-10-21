return{
	"michaelb/sniprun",
	branch = "master",
	build = "sh install.sh",
config = function()
      require("sniprun").setup({
      display = {"VirtualTextOk",
    "VirtualTextErr"},
      })
      end,
}

