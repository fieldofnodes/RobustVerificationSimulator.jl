push!(LOAD_PATH,"../src/")
using Documenter
using RobustVerificationSimulator

makedocs(
         sitename = "RobustVerificationSimulator.jl",
         modules  = [RobustVerificationSimulator],
         pages=[
                "Home" => "index.md",
                "A basic walk through" => "WalkThrough.md"])
deploydocs(;
    repo="https://github.com/fieldofnodes/RobustVerificationSimulator.jl",
)
