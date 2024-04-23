using TigerLine
using Documenter

DocMeta.setdocmeta!(TigerLine, :DocTestSetup, :(using TigerLine); recursive=true)

makedocs(;
    modules=[TigerLine],
    authors="Anshul Singhvi <anshulsinghvi@gmail.com>, Jacob Zelko <jacobszelko@gmail.com>, and contributors",
    sitename="TigerLine.jl",
    format=Documenter.HTML(;
        canonical="https://JuliaGeo.github.io/TigerLine.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/JuliaGeo/TigerLine.jl",
    devbranch="main",
)
