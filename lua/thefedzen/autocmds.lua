local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local TheFedzenGroup = augroup('TheFedzen', {})
local yank_group = augroup('HighlightYank', {})

-- highlight line when yanking
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})
