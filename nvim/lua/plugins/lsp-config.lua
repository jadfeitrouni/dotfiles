return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            oxlint = {},
            oxfmt = { enabled = false },
            tsgo = {
                filetypes = {
                    "javascript",
                    "javascriptreact",
                    "javascript.jsx",
                    "typescript",
                    "typescriptreact",
                    "typescript.tsx",
                },
                settings = {
                    typescript = {
                        inlayHints = {
                            enumMemberValues = { enabled = false },
                            functionLikeReturnTypes = { enabled = false },
                            parameterNames = { enabled = false },
                            parameterTypes = { enabled = false },
                            propertyDeclarationTypes = { enabled = false },
                            variableTypes = { enabled = false },
                        },

                        workspaceSymbols = { scope = "currentProject" },
                    },
                },
            },
            vtsls = {
                settings = {
                    typescript = {
                        inlayHints = {
                            enumMemberValues = { enabled = false },
                            functionLikeReturnTypes = { enabled = false },
                            parameterNames = { enabled = false },
                            parameterTypes = { enabled = false },
                            propertyDeclarationTypes = { enabled = false },
                            variableTypes = { enabled = false },
                        },
                        tsserver = {
                            maximumTsServerMemory = 4096,
                        },
                        workspaceSymbols = {
                            scope = "currentProject",
                        },
                    },
                    experimental = {
                        completion = {
                            enableServerSideFuzzyMatch = true,
                            entriesLimit = 50,
                        },
                    },
                },
            },
        },
        setup = {
            vtsls = function()
                -- Disable vtsls if tsgo is available in the project
                local root = vim.fs.root(0, { "pnpm-lock.yaml", "package-lock.json", "yarn.lock", ".git" })
                if root then
                    local tsgo_bin = vim.fs.joinpath(root, "node_modules", ".bin", "tsgo")
                    if vim.uv.fs_stat(tsgo_bin) then
                        return true -- skip vtsls setup entirely
                    end
                end
            end,
        },
    },
}
