return{
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({ 
      timeout = 2000,
	  presets = {
        bottom_search = false,        
        command_palette = false,      
        long_message_to_split = true, 
        lsp_doc_border = true,      
      },
      views = {
        cmdline_popup = {
          position = {
            row = "50%",
            col = "100%",
          },
          size = {
            width = "auto",
            height = "auto",
          },
        },
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
    })

    vim.notify = require("notify")
  end,
}

