"""
    TigerLine.get(year, layer)

Downloads the TIGER/Line file for the specified year and layer, and returns a Shapefile.Table.

## Arguments
- `year::Int`: The year of the TIGER/Line data to retrieve (e.g., 2020).
- `layer::String`: The geographic layer of the data; look at `TIGER_DICT` for more options.

## Returns
Returns a `Shapefile.Table`, which is a [Tables.jl](https://github.com/JuliaData/Tables.jl) table 
and a [GeoInterface.jl](https://github.com/JuliaGeo/GeoInterface.jl) feature collection.

All geometries are in `table.geometry`, and all other attributes are the other table columns.
The table can be accessed by `getproperty` syntax, e.g. `table.NAME`, which yields that column as a 
Julia vector.

## Example
```julia-repl
julia> using TigerLine

julia> TigerLine.get(2020, "county")
Shapefile.Table{Union{Missing, Shapefile.Polygon}} with 3234 rows and the following 18 columns:

geometry, STATEFP, COUNTYFP, COUNTYNS, GEOID, NAME, NAMELSAD, LSAD, CLASSFP, MTFCC, CSAFP, CBSAFP, METDIVFP, FUNCSTAT, ALAND, AWATER, INTPTLAT, INTPTLON
```
"""
function get(year, layer)

    global download_cache # bring in the global download cache that is set in Scratch.jl

    # Get the URL and files for the requested layer and year
    url = base_tiger_url(year, TIGER_DICT[layer])
    files = list_tiger_files(year, layer)

    # Check that there is only one file for the requested layer and year, if not then error
    if length(files) == 0
        throw(ArgumentError("No files found for layer, \"$(TIGER_DICT[layer])\", and year, $year."))
    elseif length(files) > 1
        throw(ArgumentError("Multiple files found for layer, \"$(TIGER_DICT[layer])\", and year, $year.  Please use `download_tiger` to download these files explicitly."))
    end # if length(files) == 1, then continue

    # Get the file path to the file
    file_path = joinpath(download_cache, only(files))

    # Download the file if it doesn't exist / has not been cached
    if !isfile(file_path)
        @debug "TigerLine.jl: Did not find $file_path, downloading from $url"
        download(url * only(files), file_path)
    end

    # Read the file via Shapefile.jl and return the table so read.
    # TODO: should we make this a DataFrame instead for maximum manipulability?
    # We can add geo metadata to the dataframe easily following the GeoDataFrames approach.
    return Shapefile.Table(file_path)
end

# add a keyword argument version of the function
get(; year = 2020, layer = "county") = get(year, layer)