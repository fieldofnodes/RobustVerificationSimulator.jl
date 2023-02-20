module RobustVerificationSimulator

using Reexport

@reexport using Revise
@reexport using Statistics 
@reexport using Graphs
@reexport using MetaGraphs
@reexport using Plots
@reexport using GraphRecipes
@reexport using Colors
@reexport using Chain

export 
    Redo,
    Test,
    Computation,
    Trap,
    ComputationQubit,
    Input,
    NotInput,
    Ok,
    Abort,
    generate_simple_graph,
    generate_random_greedy_color,
    separate_each_color,
    get_random_coloring,
    contruct_coloring_plot_for_one_color,
    contruct_coloring_plot_for_all_colors,
    contruct_coloring_plot_for_no_colors,
    get_ratio_between_two_types,
    probability_asser,
    error_call_not_test_computation,
    choose_test_computation,
    return_ok_or_abort,
    do_redo,
    return_ok_or_abort,
    get_round_result,
    qubit_information,
    compute_δᵥ,
    generate_property_graph!,
    compare_trap_test,
    rand_int



include("structs_types.jl")
include("graph_functions.jl")
include("helper_functions.jl")
include("protocol_functions.jl")
include("compute_delta_v_functions.jl")
include("generate_qubit_property_graph.jl")

end


