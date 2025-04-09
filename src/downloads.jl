"""
    download_tiger(output_dir; year, layer)

Downloads TIGER/Line geographic data from the US Census Bureau for the specified year and geographic layer,
saving the data as shapefiles.

Valid arguments for `layer` are the keys of [`TIGER_DICT`](@ref).  Valid arguments for `year` are those years
for which TIGER/Line data is available.

## Arguments
- `output_dir::String`: The directory where downloaded files will be saved.

## Keyword Arguments
- `year::Int=2020` (optional): The year of the TIGER/Line data to retrieve (e.g., 2020).
- `layer::String="state"` (optional): The geographic layer of the data; must be a **key** of [`TIGER_DICT`](@ref).

## Returns
Returns a vector of (absolute) file paths to the downloaded files.

## Example
```jldoctest
julia> ?TIGER_DICT

    •  "county" (COUNTY) - County
    •  "state" (STATE) - State and Equivalent

julia> download_tiger("./data", year=2020, layer="county")
1-element Vector{String}:
 "./data/tl_2020_us_county.zip"
```

This will download county-level TIGER/Line data for 2020 and store the shapefiles in `./data`.
"""
function download_tiger(output_dir; year = 2020, layer = "state")

    url = base_tiger_url(year, TIGER_DICT[layer])

    files = list_tiger_files(year, layer)

    for f in files
        @debug "TigerLine.jl: Downloading $f" _layer=TIGER_DICT[layer] year
        download(
            url * f, # URL from `base_tiger_url` is guaranteed to end in `/`
            joinpath(output_dir, f) # joinpath is correct here since this is a local file path
        )
    end

    @debug "TigerLine.jl: Requested \"$(TIGER_DICT[layer])\" data for $year has been downloaded! 🎉";

    return joinpath.((output_dir,), files) # return a vector of file paths that have been downloaded to

end

"""
    list_tiger_files(year, layer)

Returns a vector of file names for the specified year and layer.

This will return only _file names_, not the full paths to the layer.
You can get the full path by using [`base_tiger_url`](@ref) and joining the result with the file name,
like so:
```julia
files = list_tiger_files(2020, "county")
full_paths = TigerLine.base_tiger_url(2020, "county") .* files
```

## Arguments
- `year::Int`: The year of the TIGER/Line data to retrieve (e.g., 2020).
- `layer::String`: The geographic layer of the data; must be a **key** of [`TIGER_DICT`](@ref).

## Example

```jldoctest
julia> list_tiger_files(2020, "county")
1-element Vector{String}:
 "tl_2020_us_county.zip"
```

This will return a vector of file names for the specified year and layer.
"""
function list_tiger_files(year, layer)

    url = base_tiger_url(year, TIGER_DICT[layer])

    html = TidierVest.read_html(url)
    tables = TidierVest.html_elements(html, ["body", "table"])
    
    data = tables[1] |> TidierVest.html_table # TODO: throw an informative error if this fails
    
    files = data.Name[2:end] # TODO: throw an informative error if this fails

    return files

end
