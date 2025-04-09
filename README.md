# TigerLine

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://JuliaGeo.github.io/TigerLine.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://JuliaGeo.github.io/TigerLine.jl/dev/)
[![Build Status](https://github.com/JuliaGeo/TigerLine.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/JuliaGeo/TigerLine.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Aqua](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

## Quick start

```julia-repl
julia> using TigerLine

julia> TigerLine.get(2020, "county")
Shapefile.Table{Union{Missing, Shapefile.Polygon}} with 3234 rows and the following 18 columns:

geometry, STATEFP, COUNTYFP, COUNTYNS, GEOID, NAME, NAMELSAD, LSAD, CLASSFP, MTFCC, CSAFP, CBSAFP, METDIVFP, FUNCSTAT, ALAND, AWATER, INTPTLAT, INTPTLON
```

This is a [Shapefile.jl](https://github.com/Shapefile.jl) `Table`, which is a [GeoInterface.jl](https://github.com/GeoInterface.jl)-compatible feature collection, and also a [Tables.jl](https://github.com/JuliaData/Tables.jl) table.

You can convert the result to a [DataFrame](https://github.com/JuliaData/DataFrames.jl) by `TigerLine.get(2020, country) |> DataFrame`, for example.