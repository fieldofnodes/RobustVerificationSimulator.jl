# Walk through

To emulate this verification protocol. Start by activating your local project

```julia
using Pkg
Pkg.activate(".")
```

If `RobustVerificationSimulator.jl`has not been installed, then

```julia
] add https://github.com/fieldofnodes/RobustVerificationSimulator.jl
```

then

```julia
using RobustVerificationSimulator
```

We simulate a random graph to represent our circuit with the following values.

```julia
p₁ = p₂ = 0.5
N = 1000
v = 5
e = 8
reps=100
```

Here `p₁` and `p₂` are probability values used for stochastic sampling while the simulator software is being developed. Once completed this functionality will be replaced with the appropriate function calls. The number of rounds is represented by `N`, `v` and `e` represent the number of vertices and edges in the graph. In the circuit each `v` is a qubit and each `e` is the `CZ` gate establishing entanglement between the qubits. Finally `reps` is the number of repetitions used to approximate a graph colouring.

```julia
graph_for_client = generate_simple_graph(v,e)
```

We generate a graph with `v` vertices and `e` edges. For the time being this graph is contructed randomly. We call this 'graph_for_client` to indicate this graph is still on the client side of the protocol. Once we are ready to send this graph to the server, we then bound the graph to a different label, namely an indication that the graph is for the server.

The output

```julia
{5, 8} undirected simple Int64 graph
```

We take `graph_for_client` and convert it to a `MetaGraph`, this is a graph which allow properties to be set to the graph, qubits or edges. As we have not implemented the quantum simulator yet, we construct this meta graph. These properties attached can be the angles and the qubit type. This graph is prepared for the `Computation` round. The graph associated with the `Test` rounds will be generated in a `for` loop. 


```julia
meta_graph_for_client = @chain graph_for_client begin
    MetaGraph(_)
    generate_property_graph!(_,Computation())
end
```

The output

```julia
{5, 8} undirected Int64 metagraph with Float64 weights defined by :weight (default weight 1.0)
```

```julia
g_cols = generate_random_greedy_color(graph_for_client,reps)    
```

Here `g_cols` is the coloring of `graph_for_client` which is optimised over the `reps`

The output

```julia
Graphs.Coloring{Int64}(3, [1, 3, 2, 3, 1])
```

The first element, `3`, represents the number of colors, and `[1, 3, 2, 3, 1]` represents the coloring. We then need to separate each colour and bind it to another graph for our `Test` rounds.

We can run

```julia
contruct_coloring_plot_for_all_colors(graph_for_client,g_cols.colors)
```

to get a plot for the colouring.



```julia
g_diff_cols = separate_each_color(g_cols)
```

We create a `g_diff_cols` a vector of vectors, each one is a different colouring of the graph.

```julia
3-element Vector{Vector{Int64}}:
 [2, 1, 1, 1, 2]
 [1, 1, 2, 1, 1]
 [1, 2, 1, 2, 1]
```

Each vector is a different colouring. The top vector `[2, 1, 1, 1, 2]` is a single colour set. Elements that are `1` are the `Dummy` qubits and `2` are the `Test` qubits.

