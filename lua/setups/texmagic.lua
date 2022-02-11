require('texmagic').setup{
    engines = {
        pdflatex = {    -- This has the same name as a default engine but would
                        -- be preferred over the same-name default if defined
            executable = "latexmk",
            args = {
                "-pdflatex",
                "-interaction=nonstopmode",
                "-synctex=1",
                "-outdir=.build",
                "-pv",
                "%f"
            },
            isContinuous = false
        }
    }
}
