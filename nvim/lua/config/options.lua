-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- LazyVim only accepts "vtsls" or "tsgo" here; "tsgo" keeps it from force-enabling
-- vtsls, and lsp-config.lua then swaps tsgo out for lspconfig's `tsc` server.
vim.g.lazyvim_ts_lsp = "tsgo"
