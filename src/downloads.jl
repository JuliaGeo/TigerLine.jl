"""
```julia
download_tiger(output_dir; 
    year = 2020, 
    layer = "state"
)
```
Downloads TIGER/Line geographic data from the US Census Bureau for the specified year and geographic layer,
saving the data as shapefiles.

## Arguments
- `output_dir::String`: The directory where downloaded files will be saved.

## Keyword Arguments
- `year::Int=2020` (optional): The year of the TIGER/Line data to retrieve (e.g., 2020).
- `layer::String="state"` (optional): The geographic layer of the data; look at `TIGER_DICT` for more options.

## Returns
#
- This function does not return anything.

## Example
#
```julia-repl
julia> ?TIGER_DICT

    •  "county" (COUNTY) - County
    •  "state" (STATE) - State and Equivalent

julia> download_tiger("./data", year=2020, layer="county")
```

This will download county-level TIGER/Line data for 2020 and store the shapefiles in `./data`.
"""
function download_tiger(output_dir; year = 2020, layer = "state")

    url = sprint(printfmt, BASE_TIGER_URL, year, TIGER_DICT[layer])

    html = read_html(url)
    tables = html_elements(html, ["body", "table"])
    data = tables[1] |> html_table
    files = data.Name[2:end]

    for f in files
        @info "Downloading $f for layer, \"$(TIGER_DICT[layer])\", and year, $year."
        download(
            joinpath(url, f),
            joinpath(output_dir, f)
        )
    end

    @info "Requested \"$(TIGER_DICT[layer])\" data for $year has been downloaded! 🎉";

end

export download_tiger
