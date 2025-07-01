return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("notify").setup({
      background_colour = "#1e1e2e",
      timeout = 2000,
    })
    vim.notify = require("notify")

    require("noice").setup({
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
      views = {
        cmdline_popup = {
          position = {
            row = 1,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
      },
      cmdline = {
        view = "cmdline_popup", 
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
    })
  end,
}
