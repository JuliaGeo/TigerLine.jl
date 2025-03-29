
"""
Base URL for TIGER/Line data with two parameters for year and layer.
"""
BASE_TIGER_URL = FormatExpr("https://www2.census.gov/geo/tiger/TIGER{}/{}/")

# "https://www2.census.gov/geo/tiger/GENZ2018/shp/cb_2018_us_state_5m.zip"

"""
A dictionary mapping human-readable keys to TIGER/Line dataset codes and their associated descriptions.

> **Source:** `https://www2.census.gov/geo/tiger/TIGER2017/2017_TL_Shapefiles_File_Name_Definitions.pdf`

## Keys

- `"address_range_rel"` (**ADDR**) - Address Range Relationship File
- `"address_range_feat"` (**ADDRFEAT**) - Address Range Feature
- `"address_range_feat_name"` (**ADDRFN**) - Address Range-Feature Name Relationship
- `"native_areas"` (**AIANNH**) - American Indian / Alaska Native / Native Hawaiian Areas
- `"native_subdivision"` (**AITSN**) - American Indian Tribal Subdivision National
- `"alaska_native_corp"` (**ANRC**) - Alaska Native Regional Corporation
- `"area_landmark"` (**AREALM**) - Area Landmark
- `"area_water"` (**AREAWATER**) - Area Hydrography
- `"block_group"` (**BG**) - Block Group
- `"metro_micro_area"` (**CBSA**) - Metropolitan Statistical Area / Micropolitan Statistical Area
- `"congressional_district"` (**CD**) - Congressional District
- `"combined_new_england_city_town"` (**CNECTA**) - Combined New England City and Town Area
- `"coastline"` (**COASTLINE**) - Coastline
- `"consolidated_city"` (**CONCITY**) - Consolidated City
- `"county"` (**COUNTY**) - County
- `"county_subdivision"` (**COUSUB**) - County Subdivision
- `"combined_statistical_area"` (**CSA**) - Combined Statistical Area
- `"all_lines"` (**EDGES**) - All Lines
- `"elementary_school_district"` (**ELSD**) - Elementary School District
- `"estate"` (**ESTATE**) - Estate
- `"topo_faces"` (**FACES**) - Topological Faces (Polygons with All Geocodes)
- `"topo_faces_area_hydro"` (**FACESAH**) - Topological Faces-Area Hydrography Relationship File
- `"topo_faces_area_landmark"` (**FACESAL**) - Topological Faces-Area Landmark Relationship File
- `"topo_faces_military"` (**FACESMIL**) - Topological Faces-Military Installation Relationship File
- `"feature_names"` (**FEATNAMES**) - Feature Names Relationship File
- `"linear_hydro"` (**LINEARWATER**) - Linear Hydrography
- `"metro_division"` (**METDIV**) - Metropolitan Division
- `"military_installation"` (**MIL**) - Military Installation
- `"new_england_city_town"` (**NECTA**) - New England City and Town Area
- `"new_england_city_town_div"` (**NECTADIV**) - New England City and Town Area Division
- `"place"` (**PLACE**) - Place
- `"point_landmark"` (**POINTLM**) - Point Landmark
- `"primary_roads"` (**PRIMARYROADS**) - Primary Roads
- `"primary_secondary_roads"` (**PRISECROADS**) - Primary and Secondary Roads
- `"public_microdata_area"` (**PUMA**) - Public Use Microdata Area
- `"rails"` (**RAILS**) - Rails
- `"all_roads"` (**ROADS**) - All Roads
- `"secondary_school_district"` (**SCSD**) - Secondary School Districts
- `"state_legislative_lower"` (**SLDL**) - State Legislative District – Lower Chamber
- `"state_legislative_upper"` (**SLDU**) - State Legislative District – Upper Chamber
- `"state"` (**STATE**) - State and Equivalent
- `"subbarrio"` (**SUBBARRIO**) - SubMinor Civil Division (Subbarios in Puerto Rico)
- `"tabulation_block"` (**TABBLOCK**) - Tabulation (Census) Block
- `"tribal_block_group"` (**TBG**) - Tribal Block Group
- `"census_tract"` (**TRACT**) - Census Tract
- `"tribal_census_tract"` (**TTRACT**) - Tribal Census Tract
- `"urban_area_cluster"` (**UAC**) - Urban Area/Urban Cluster
- `"unified_school_district"` (**UNSD**) - Unified School District
- `"zip_code_area"` (**ZCTA5**) - 5-Digit ZIP Code Tabulation Area

## Example

```julia-repl
julia> TIGER_DICT["county"]
"COUNTY"
```
"""
const TIGER_DICT = Dict(
    "address_range_rel" => "ADDR",
    "address_range_feat" => "ADDRFEAT",
    "address_range_name_rel" => "ADDRFN",
    "native_areas" => "AIANNH",
    "tribal_subdivision_nat" => "AITSN",
    "alaska_native_region" => "ANRC",
    "area_landmark" => "AREALM",
    "area_water" => "AREAWATER",
    "block_group" => "BG",
    "metro_micro_area" => "CBSA",
    "congressional_district" => "CD",
    "combined_necta" => "CNECTA",
    "coastline" => "COASTLINE",
    "consolidated_city" => "CONCITY",
    "county" => "COUNTY",
    "county_subdivision" => "COUSUB",
    "combined_stat_area" => "CSA",
    "all_lines" => "EDGES",
    "elementary_school_district" => "ELSD",
    "estate" => "ESTATE",
    "topo_faces" => "FACES",
    "faces_area_hydro" => "FACESAH",
    "faces_area_landmark" => "FACESAL",
    "faces_military" => "FACESMIL",
    "feature_names_rel" => "FEATNAMES",
    "linear_hydrography" => "LINEARWATER",
    "metro_division" => "METDIV",
    "military_installation" => "MIL",
    "necta" => "NECTA",
    "necta_division" => "NECTADIV",
    "place" => "PLACE",
    "point_landmark" => "POINTLM",
    "primary_roads" => "PRIMARYROADS",
    "primary_secondary_roads" => "PRISECROADS",
    "puma" => "PUMA",
    "rails" => "RAILS",
    "all_roads" => "ROADS",
    "secondary_school_district" => "SCSD",
    "state_leg_district_lower" => "SLDL",
    "state_leg_district_upper" => "SLDU",
    "state" => "STATE",
    "subbarrio" => "SUBBARRIO",
    "tab_block" => "TABBLOCK",
    "tribal_block_group" => "TBG",
    "census_tract" => "TRACT",
    "tribal_census_tract" => "TTRACT",
    "urban_area_cluster" => "UAC",
    "unified_school_district" => "UNSD",
    "zip_code_area" => "ZCTA5"
)

export TIGER_DICT
