return
{
    "rolv-apneseth/tfm.nvim",
    config = function()
        vim.api.nvim_set_keymap("n", "<C-t>", "", {
            noremap = true,
            callback = require("tfm").open,
        })
    end,
}
