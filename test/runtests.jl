using TigerLine
using Test
using Aqua

@testset "TigerLine.jl" begin
    @testset "Code quality (Aqua.jl)" begin
        Aqua.test_all(TigerLine)
    end
    # Write your tests here.
end
