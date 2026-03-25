return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                javascript = { "oxfmt", "prettier", stop_after_first = true },
                javascriptreact = { "oxfmt", "prettier", stop_after_first = true },
                typescript = { "oxfmt", "prettier", stop_after_first = true },
                typescriptreact = { "oxfmt", "prettier", stop_after_first = true },
                json = { "oxfmt", "prettier", stop_after_first = true },
                vue = { "oxfmt", "prettier", stop_after_first = true },
                markdown = function(bufnr)
                    if require("conform").get_formatter_info("oxfmt", bufnr).available then
                        return { "oxfmt", "markdownlint-cli2", "markdown-toc" }
                    else
                        return { "prettier", "markdownlint-cli2", "markdown-toc" }
                    end
                end,
            },
        },
    },
}
