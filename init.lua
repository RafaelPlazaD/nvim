require("rafael.options")
require("rafael.keymaps")
require("rafael.lazy")

-- Configuración para venn.nvim
vim.api.nvim_set_keymap('n', '<leader>v', ":lua Toggle_venn()<CR>", { noremap = true, silent = true })


--enable spell only to some filestypes
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "markdown", "text", "gitcommit" },
    callback = function()
        vim.opt_local.spell = true
    end,
})

function _G.Toggle_venn()
    local venn_enabled = vim.inspect(vim.b.venn_enabled)
    if venn_enabled == "nil" or venn_enabled == "false" then
        vim.b.venn_enabled = true
        vim.cmd [[setlocal ve=all]] -- Permite el movimiento libre del cursor en el buffer
        -- Mapeos para dibujar líneas con HJKL
        vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
        -- Mapeo para dibujar una caja con 'f' en selección visual
        vim.api.nvim_buf_set_keymap(0, "x", "f", ":VBox<CR>", { noremap = true })
        print("Venn mode enabled!")
    else
        vim.b.venn_enabled = nil
        vim.cmd [[setlocal ve=]] -- Restaura el comportamiento normal del cursor
        -- Elimina los mapeos específicos de venn
        vim.api.nvim_buf_del_keymap(0, "n", "J")
        vim.api.nvim_buf_del_keymap(0, "n", "K")
        vim.api.nvim_buf_del_keymap(0, "n", "H")
        vim.api.nvim_buf_del_keymap(0, "n", "L")
        vim.api.nvim_buf_del_keymap(0, "x", "f")
        print("Venn mode disabled!")
    end
end

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})
