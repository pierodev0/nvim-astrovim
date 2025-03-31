-- Source: https://github.com/LazyVim/LazyVim/discussions/1124#discussioncomment-10237303

return {
    {
        "AstroNvim/astrolsp",
        ---@type AstroLSPOpts
        opts = {
            config = {
                vtsls = {
                    settings = {
                        typescript = {
                            preferences = {
                                includeCompletionsForModuleExports = true,
                                includeCompletionsForImportStatements = true,
                                importModuleSpecifier = "non-relative",
                            },
                        },
                    },
                },
            },
        },
    },
}
