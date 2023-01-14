require("core.options")
require('plugins')
require("mason").setup()
require('plugins/cmp')
require("plugins.vscode")
require("plugins.bufferline")
require("plugins.nvim-tree")

vim.api.nvim_create_autocmd("Filetype", {
  pattern = "java", -- autocmd to start jdtls
  callback = function()
      local config = require("plugins.jdtls")
      if config.root_dir and config.root_dir ~= "" then require("jdtls").start_or_attach(config) end
  end,
})
