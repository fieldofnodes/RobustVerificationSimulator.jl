push!(LOAD_PATH,"../src/")
using Documenter
using RobustVerificationSimulator

makedocs(
         sitename = "RobustVerificationSimulator.jl",
         modules  = [RobustVerificationSimulator],
         pages=[
                "Home" => "index.md",
                "A basic walk through" => "WalkThrough.md",
                "Previous iterations and prototypig" => [
                    "First protocol attemps" => "protocol_version_01.md",
                    "Working with graphs 01" => "graphs_01.md",
                    "Working with graphs 02" => "graphs_02.md",
                    "Working with graphs 03" => "graphs_03.md",
                    "Learning to use QBase.jl" => "learning_brakets.md",
                    "Experimenting with Symbolics.jl" => "symbolics_practice.md"]
                ]
        )




deploydocs(;
    repo="https://github.com/fieldofnodes/RobustVerificationSimulator.jl",
)


