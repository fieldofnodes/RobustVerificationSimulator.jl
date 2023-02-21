# Graph prototyping version 01

This is a simple script I developed to get familiar with the Graphs.jl API.

```julia
using Pkg
Pkg.activate(".")
using Graphs
using Plots
using GraphRecipes
using Colors
using Chain


// # Functions
    """
        From number of vertices and edges -> Graph
    """
    function generate_simple_graph(v,e)
        return SimpleGraph(v,e)
    end

    """
        Use Graphs.random_greedy_color(g, reps) -> Graphs.Coloring{Int64}
        Uses a greedy approximation to get a colouring of a graph
    """
    function generate_random_greedy_color(g,reps)
        return Graphs.random_greedy_color(g, reps)
    end

    
    """
        Extracts from a Graphs.Coloring{Int64} -> Vector{Vector{Int64}}
        Once a coloring is selected a vector of integers will result
        1 -> Dummy vertex
        2 -> Trap
    """
    function separate_each_color(g::Graphs.Coloring{Int64})
        colouring = map(x-> Int.(g.colors .== x).+1,Base.OneTo(g.num_colors))
        return colouring
    end
    
    """
        Extracts from Vector{Vector{Int64}} -> Vector{Int64}
        Draw uniform one colouring arangments
    """
    function get_random_coloring(c::Vector{Vector{Int64}})
        return rand(c)
    end
//


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


contruct_coloring_plot_for_all_colors(g,g_cols.colors)
contruct_coloring_plot_for_one_color(g,g_col)

````