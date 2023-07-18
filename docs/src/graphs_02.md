# Graph prototyping version 02

This is a simple script I developed to get further familiar with the Graphs.jl API.

```julia
"""
   Load packages
"""
using Pkg
Pkg.activate(".")
using Graphs
using Plots
using GraphRecipes
using Colors
using Chain


"""
   Load functions
"""
include("src/graph_functions.jl")

"""
    Define number of vertices, edges and reps.
    vertices: The number of vertices in a graph
    edges: The number of edges in a graph
    reps: The number of reps used to get the best
          coloring of a given graph G.
"""
v = 5
e = 8
reps=100


g = generate_simple_graph(v,e)
g_cols = generate_random_greedy_color(g,reps)    
g_diff_cols = separate_each_color(g_cols)
g_col = get_random_coloring(g_diff_cols)


p = [contruct_coloring_plot_for_one_color(g,co) for co in g_diff_cols]


[savefig(p[i],"figs/graph_coloring_example_each_graph_$(i).png") for i in eachindex(p)]

p_full_color = graphplot(g, 
        curves=false, 
        nodecolor = g_cols.colors,
        nodesize = 0.3,
        edgecolor=:skyblue1,
        nodestrokecolor = :skyblue1,
        edgewidth = (s,d,w)->1.5)


savefig(p_full_color,"figs/graph_coloring_example.png")










graphs_for_server[5].vprops
graphs_for_server[5] |> typeof |> fieldnames

qubit_meta_graph = graphs_for_server[1]
round = qubit_meta_graph.gprops[:round_type]


for v ∈ vertices(qubit_meta_graph)
    vertex_type = qubit_meta_graph.vprops[v][:qubit_type]
    δ_value = compute_δᵥ(round,vertex_type)    
    set_prop!(qubit_meta_graph,v,:δᵥ,δ_value)
end



qubit_meta_graph.vprops







"""
    Figure out how to do the redo round
"""

# Test redo
samesies = []
p = 0.5        
for i in 1:N
    u₁ = rand()
    u₂ = do_redo(u₁,p)
    res = u₁ == u₂
    push!(samesies,res)
end

# graph construction and coloring

"""
    Draw randomly a string kπ/4 for k ∈ 0..7
"""
function θᵥ()    
    k = rand(0:7)
    if k == 0
        return string("0")
    else
        return string(k,"π/4")
    end
end


"""
    ComputationRound() -> get kπ/4 k∈0..7
"""
function qubit_information(::ComputationRound)
        return string("|+",θᵥ(),">")
end




rᵥπ() = string(rand([0,1]),"π")

δᵥ = ϕᵥ′ + θᵥ() + rᵥ()π

````