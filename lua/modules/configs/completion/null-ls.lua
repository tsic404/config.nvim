return function()
    local null_ls = require("null-ls")
    local mason_null_ls = require("mason-null-ls")
    local btns = null_ls.builtins

    -- Please set additional flags for the supported servers here
    -- Don't specify any config here if you are using the default one.
    local sources = {
        btns.formatting.black.with({
            extra_args = { "--fast" },
        }),
        btns.formatting.prettier.with({
            filetypes = {
                "vue",
                "typescript",
                "javascript",
                "typescriptreact",
                "javascriptreact",
                "yaml",
                "html",
                "css",
                "scss",
                "sh",
                "markdown",
            },
        }),
    }
    null_ls.setup({
        border = "rounded",
        debug = false,
        log_level = "warn",
        update_in_insert = false,
        sources = sources,
    })

    mason_null_ls.setup({
        ensure_installed = require("core.settings").null_ls_deps,
        automatic_installation = false,
        automatic_setup = true,
        handlers = {},
    })

    require("completion.formatting").configure_format_on_save()
end
