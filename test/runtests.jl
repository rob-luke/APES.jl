using APES
using Base.Test
using Lint
using TypeCheck

# Run tests
include("APES.jl")
include("APES-speed.jl")

# Check code
lintpkg( "APES" )

checkreturntypes(APES)
println()
checklooptypes(APES)
println()
checkmethodcalls(APES)

