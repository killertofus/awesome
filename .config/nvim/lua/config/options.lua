-- absolute lines
vim.opt.number = true
-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'
-- 24-bit RGB color
vim.opt.termguicolors = true
-- use the mouse
vim.opt.mouse = 'a'
-- no visual message
vim.opt.showmode = false

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
--show indent
vim.opt.breakindent = true
--undo directory
vim.opt.undofile = true
-- case insensitive search
vim.opt.ignorecase = true
-- upper case search
vim.opt.smartcase = true
-- breakpoints
vim.opt.signcolumn = 'yes'
-- swap
vim.opt.updatetime = 250
-- keybinding wait time
vim.opt.timeoutlen = 30
-- splits
vim.opt.splitright = true
-- splits
vim.opt.splitbelow = true
--
vim.opt.list = true
-- unprintable characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
---live results in a split window
vim.opt.inccommand = 'split'
--Highlight words and lines
vim.opt.cursorline = true
-- keep cursor in the middle
vim.opt.scrolloff = 10



-- transparency
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]



--lualine
require('lualine').setup { 
options = { theme = 'dracula' 
}
}
--
 require 'rainbow-delimiters.setup'.setup {
        strategy = {
	    html = 'rainbow-delimiters.strategy.local',
	    css = 'rainbow-delimiters.strategy.local',
        },
        query = {
            [''] = 'rainbow-delimiters',
        },
        highlight = {
            'RainbowDelimiterRed',
            'RainbowDelimiterYellow',
            'RainbowDelimiterBlue',
            'RainbowDelimiterOrange',
            'RainbowDelimiterGreen',
            'RainbowDelimiterViolet',
            'RainbowDelimiterCyan',
        }
}
