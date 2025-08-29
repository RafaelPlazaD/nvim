require("rafael.options")
require("rafael.keymaps")
require("rafael.lazy")


--enable spell only to some filestypes
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "markdown", "text", "gitcommit" },
    callback = function()
        vim.opt_local.spell = true
    end,
})

--highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'highlight when copy text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end
})

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})
