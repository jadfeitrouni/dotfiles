return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                oxlint = {},
                oxfmt = { enabled = false },
                vtsls = { enabled = false },
                -- TypeScript 7's native `tsc --lsp`, which replaces the now-deprecated
                -- `tsgo` config in nvim-lspconfig.
                tsc = {
                    filetypes = {
                        "javascript",
                        "javascriptreact",
                        "javascript.jsx",
                        "typescript",
                        "typescriptreact",
                        "typescript.tsx",
                    },
                    flags = { allow_incremental_sync = false },

                    -- tsc reads its config from four sections and merges them as
                    -- editor < javascript < typescript < js/ts, so `js/ts` is the only
                    -- one that reliably wins -- and it's where nvim-lspconfig puts its
                    -- own defaults (which enable every inlay hint).
                    settings = {
                        ["js/ts"] = {
                            inlayHints = {
                                enumMemberValues = { enabled = false },
                                functionLikeReturnTypes = { enabled = false },
                                parameterNames = { enabled = "none" },
                                parameterTypes = { enabled = false },
                                propertyDeclarationTypes = { enabled = false },
                                variableTypes = { enabled = false },
                            },
                            workspaceSymbols = { scope = "currentProject" },
                        },
                    },
                },
            },
        },
    },
    {
        -- LazyVim's typescript extra only knows `vtsls` and `tsgo` (vim.g.lazyvim_ts_lsp)
        -- and force-toggles them from an `opts` function, so `tsgo` has to be disabled
        -- from a later fragment than the table above.
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.tsgo = { enabled = false }
        end,
    },
}
