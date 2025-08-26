return {
    "nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            globalstatus = true,
            section_separators = '', 
            component_separators = '',
        },
        -- setions of lualine
         sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch',  },
            lualine_c = {'filename'},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'filesize'}
          },
        theme = 'auto',
        inactive_winbar = {
        lualine_c = {"filename"}
    },
        
    },
    
}
