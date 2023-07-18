"""
    From (MetaGraph{Int64, 
        Union{TestRound,ComputationRound},
        Float64},Vector{Int64}) - >
            MetaGraph{Int64, Float64}
    The random approximate independnet set  is used to label the graph
    According to the Trap and DummyQubit
    This function affects the input meta graph so it had a !
    For Trap a random angle is sent over
    For DummyQubit random 0 or 1
"""
function generate_property_graph!(
    h::MetaGraph{Int64, Float64},
    round::Union{TestRound,ComputationRound},
    trap_dummy_vector::Vector{Int64})
    for v in vertices(h)
        if trap_dummy_vector[v] == 2 
            set_prop!(h, v, :qubit_type, TrapQubit())
            set_prop!(h, v, :qubit_measure, 
                    qubit_information(TrapQubit()))
            set_prop!(h,v,:δᵥ,compute_δᵥ(round,TrapQubit()))
            set_prop!(h,v,:rᵥ,rand_int())
        elseif trap_dummy_vector[v] == 1
            set_prop!(h, v, :qubit_type, DummyQubit())
            set_prop!(h, v, :qubit_measure, 
                    qubit_information(DummyQubit()))
            set_prop!(h,v,:δᵥ,compute_δᵥ(round,DummyQubit()))
            set_prop!(h,v,:dᵥ,rand_int()) # updatre to |+θ>
        else
            error_call_not_test_computation()
        end
    end
    return h
end







"""
    From (MetaGraph{Int64, Float64},Union{TestRound,ComputationRound}) - >
            MetaGraph{Int64, Float64}
    Take SimpleGraph, just converted to MetaGraph and add angles.
    Note: this may be a temporary solutions, I need to implement 
    an input and output set for the vertices
"""
function generate_property_graph!(
    h::MetaGraph{Int64, Float64},
    round::Union{TestRound,ComputationRound})
    for v in vertices(h)
        set_prop!(h, v, :qubit_type, ComputationQubit())
        set_prop!(h,v,
            :qubit_measure,qubit_information(round))
        set_prop!(h,v,:δᵥ,compute_δᵥ(round,ComputationQubit()))
    end
    return h
end


"""
    Function, which will iterate over vertices
    will yield if the round passed or failed
"""
function compare_trap_test()
    return rand_int()
end