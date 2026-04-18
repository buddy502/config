require("lsp_signature").setup({
   bind = true,               -- automatically bind to LSP
   floating_window = true,    -- show in a floating window
   hint_enable = true,        -- show parameter hints
   hint_prefix = " ",        -- prefix symbol for the hint
   max_height = 10,           -- max height of the floating window
   max_width = 80,            -- max width of the floating window
   doc_lines = 0,             -- show only parameters
   handler_opts = {
      border = "single"      -- border style
   },
   always_trigger = false,    -- show only while typing
})
