
using Documenter
using RobustVerificationSimulator
makedocs(sitename="My Documentation")





# Inside make.jl
#=
push!(LOAD_PATH,"../src/")



makedocs(
         sitename = "RobustVerificationSimulator.jl",
         modules  = [RobustVerificationSimulator],
         pages=[
                "Home" => "index.md"
               ])
deploydocs(;
    repo="https://github.com/fieldofnodes/RobustVerificationSimulator.jl",
)

=#