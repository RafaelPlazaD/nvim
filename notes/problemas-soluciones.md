## Como habilitar el autor corrector ortográfico y soluciones en caso de que no se habilite.
Para poder habilitar el corrector ortográfico tenemos que ejecutar los siguiente
**:set spelllang=es**
**"es"**  para el lenguaje español 
el ingles ya viene por defecto activado

luego ejecutamos 
**:set spell**

#### Posibles problemas que podrian ocurrir

Al ejecutar los comando anterioes podemos obtener un 
alerta  como esta :
**Warning: Cannot find word list "es.utf-8.spl" or "es.ascii.spl"**
Esto se debe deber a dos posibles cosa, la primera que no tenemos descargado esos archivos, 
mayoritariamente **nvim** no preguntara si queremos descargarlos, le confirmaremos que si.

Lo segundo a lo que podria deberse que obtengamos ese **Warning** es debido algún plungin que tengamos instalado
en, el plungin mas común en ser el responsable de esto es **lsp**

####Solución para el **lsp**

En nuestro archivo de configuracion del **lsp** debemos tener alguna función como esta:

```lua
local on_attach = function(client, bufnr)
      -- Aquí ya tendrás otras configuraciones para el on_attach
      -- como los keymaps (vim.keymap.set, etc.)
   
      -- ... otras opciones ...
   
      -- AÑADE ESTA LÍNEA:
      -- Esto activa el corrector ortográfico localmente para el buffer
      -- justo después de que el LSP se haya conectado.
      vim.cmd("setlocal spell")
    end
```

En mi caso particular se ve asi :
```lua
 config = function()
                local capabilities = require('blink.cmp').get_lsp_capabilities()
                require("lspconfig").lua_ls.setup { capabilites = capabilities }
   
                vim.api.nvim_create_autocmd('LspAttach', {
                    callback = function(args)
                        local c = vim.lsp.get_client_by_id(args.data.client_id)
                        if not c then return end
   
                        -- Añadimos esta linea 
                        vim.cmd("setlocal spell")
   
                        if vim.bo.filetype == "lua" then
                            -- Format the current buffer on save
                            vim.api.nvim_create_autocmd('BufWritePre', {
                                buffer = args.buf,
                                callback = function()
                                    vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
                                end,
                            })
                        end
                    end,
                })
            end,

```

Lo que que tenemos que hacer es agregar la linea ***vim.cmd("setlocal spell")***
Luego en nuestro archivo **init.lua ** agregar esto :
```lua
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "markdown", "text", "gitcommit" },
    callback = function()
        vim.opt_local.spell = true
    end,
})
```
Esto lo que hace es especificar en que tipo de archivos queremos que se habilite **spell**
Cuando queramos habilitar el **spell**  tipeamos
**:FileType**
**:set spelllang=es**
