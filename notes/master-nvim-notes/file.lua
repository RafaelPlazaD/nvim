local job = nil

vim.api.nvim_create_user_command("ArtisanServerStart", function ()
   job = vim.system({"php", "artisan", "server"}, {}, function (out)
    vim.print("Process ended ", out.code)
   end) 
end, {})

vim.api.nvim_create_user_command("ArtisanServerStop", function ()
  job:kill(15) 
end, {})

vim.keymap.set({"n"}, "<leader><leader>la", ":ArtisanServerStart", {})
vim.keymap.set({"n"}, "<leader><leader>ls", ":ArtisanServerStop", {})
