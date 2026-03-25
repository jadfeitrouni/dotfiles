return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            oxlint = {},
            oxfmt = { enabled = false },
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
    },
}
