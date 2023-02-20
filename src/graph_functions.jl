"""
From number of vertices and edges (v,e)-> Graph
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


"""
    Plot graph g with the random coloring stipulated from functions:
    1. generate_random_greedy_color
    2. g_col = get_random_coloring
"""
function contruct_coloring_plot_for_one_color(
    g,
    rand_color_vector;
    nodecolors = [:skyblue1, :orangered3])

    nodefillc = nodecolors[rand_color_vector]
    n = size(g,1)
    g_plot = graphplot(g, 
        curves=false, 
        nodecolor = nodefillc,
        nodesize = 0.3,
        edgecolor=nodecolors[1],
        nodestrokecolor = nodecolors[1],
        edgewidth = (s,d,w)->1.5,
        names = 1:n)

    return g_plot
end




"""
    Plot graph g with the random coloring stipulated from functions:
    1. generate_random_greedy_color
    2. g_col = get_random_coloring
"""
function contruct_coloring_plot_for_all_colors(
    g,
    colouring,
    nodecolors = [:skyblue1, :orangered3])

    
    n = size(g,1)
    g_plot = graphplot(g, 
        curves=false, 
        nodecolor = colouring,
        nodesize = 0.3,
        edgecolor=nodecolors[1],
        nodestrokecolor = nodecolors[1],
        edgewidth = (s,d,w)->1.5,
        names = 1:n)

    return g_plot
end





"""
 Plot graph whith no coloring
"""
function contruct_coloring_plot_for_no_colors(
    g;
    nodecolors = [:skyblue1, :orangered3])

    
    n = size(g,1)
    g_plot = graphplot(g, 
        curves=false, 
        nodecolor = nodecolors[1],
        nodesize = 0.3,
        edgecolor=nodecolors[1],
        nodestrokecolor = nodecolors[1],
        edgewidth = (s,d,w)->1.5,
        names = 1:n)

    return g_plot
end


