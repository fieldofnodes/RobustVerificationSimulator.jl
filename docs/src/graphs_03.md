# Graph prototyping version 02

This is a simple script I developed to get further familiar with the Graphs.jl API.

```julia
using Pkg
Pkg.activate(".")

using Statistics 
using CairoMakie
using Graphs
using Plots
using GraphRecipes
using Colors
using Chain
using MetaGraphs



include("stucts_types.jl")
include("protocol_functions.jl")
include("graph_functions.jl")
include("helper_functions.jl")
include("compute_delta_v_functions.jl")
include("generate_qubit_property_graph.jl")



v = 5
e = 8
reps=100


g = generate_simple_graph(v,e)
cols = generate_random_greedy_color(g,reps)    
diff_cols = separate_each_color(cols)



gp₁ = contruct_coloring_plot_for_no_colors(g)
gp₂ = contruct_coloring_plot_for_all_colors(g,cols.colors)
gp₃ₙ = [contruct_coloring_plot_for_one_color(g,gc) for gc in diff_cols]
len₃ₙ = length(diff_cols)
gps = reduce(vcat,[gp₁,gp₂,gp₃ₙ])
l₁₂ = ["no_colouring","colouring"]
l₃ₙ = ["single_colour_$(i)" for i in Base.OneTo(len₃ₙ)]
ls = string.("figs/",reduce(vcat,[l₁₂,l₃ₙ]),".png")
savefig.(gps,ls)

```
