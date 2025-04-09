module TigerLine

using Downloads:
    download
using Scratch: @get_scratch!

import TidierVest # to enable parsing TIGER html tables

import Shapefile, ZipFile # to enable reading

download_cache::String = ""

function __init__()
    global download_cache = @get_scratch!("tigerline_cache")
end

include("constants.jl")
include("downloads.jl")
include("get.jl")

export download_tiger, list_tiger_files, base_tiger_url
# Note that `get` is not exported here.  The main way to use it is `TigerLine.get(year, layer)`.
@static if VERSION >= v"1.11"
    include("public.jl")
end

end
