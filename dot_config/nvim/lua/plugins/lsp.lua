return {
  -- This is the "table of specs" lazy.nvim is looking for
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")

    -- 1. Setup Mason
    require("mason").setup()
    require("mason-lspconfig").setup({
      -- As we discussed, ignore ruff here so uv handles it
      ignore_install = { "ruff", "pyright" },
    })

    -- 2. Setup Ruff (using the global uv binary)
    lspconfig.ruff.setup({})

    -- 3. Setup other servers (example)
    lspconfig.pyright.setup({})
  end,
}
