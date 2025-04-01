return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            vtsls = {
                settings = {
                    typescript = {
                        inlayHints = {
                            enumMemberValues = { enabled = false },
                            functionLikeReturnTypes = { enabled = false },
                            parameterNames = { enabled = false },
                            parameterTypes = { enabled = false },
                            propertyDeclarationTypes = { enabled = true },
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
    },
}
