    """
        Assert that a number is between 0 and 1 and asserts that 
        this true.
    """
    function probability_asser(p)
        return @assert 0 <= p <= 1 "InputQubit must be a probability (between 0 and 1), not $(p)"
    end


    """ 
    Call if the condition of Test or Computation is not meant
    """
    function error_call_not_test_computation()
        return error("This error emerges as an if-then-else statement failed the if and the elseif parts.")
    end



    """
        InputQubit a probability -> Union{TestRound,ComputationRound}
    """
    function choose_test_computation(p)
        probability_asser(p)
        u = rand()
        if u < p
            return TestRound()
        elseif u >=p
            return ComputationRound()
        else
            error_call_not_test_computation()
        end
    end


    """
        InputQubit a probability -> Union{OK,Abort}
    """
    function return_ok_or_abort(p)
        probability_asser(p)
        u = rand()
        if u < p
            return Ok()
        elseif u >=p
            return Abort()
        else
            error_call_not_test_computation()
        end
    end

    """
        InputQubit two proabailites (u,p) -> u
        If uₜₑₛₜ < p -> draw new u ~ U(0,1)
        else return u 
    """
    function do_redo(u,p)
        probability_asser(p)
        uₜₑₛₜ = rand()
        if uₜₑₛₜ < p
            return rand()
        elseif uₜₑₛₜ >=p
            return u
        else
            error_call_not_test_computation()
        end
    end


    """
        Return abort with redo option
        (Redo(),p₁,p₂) -> Union{Ok,Abort}
        p₁ is to detemine result in Ok or Abort
        p₂ is to determine if we do a Redo
        which at the moment just redraws the uniform 
    """

    function return_ok_or_abort(::Redo,p₁,p₂)
        probability_asser(p)
        u = rand()
        u = do_redo(u,p)
        if u < p
            return Ok()
        elseif u >=p
            return Abort()
        else
            error_call_not_test_computation()
        end
    end
    """
    Take (round_type,p) -> Union{OK,Abort}
    """
    function get_round_result(round_type,p)
        if round_type isa Test
            return return_ok_or_abort(p)
        elseif round_type isa Computation
            return return_ok_or_abort(p)
        else
            error_call_not_test_computation()
        end
    end


"""
    TrapQubit() -> get kπ/4 k∈0..7
"""
function qubit_information(::TrapQubit)
    x = rand(0:7)
    if x == 0
        return string("|+>")
    else
        return string("|+",x,"π/4>")
    end
end


"""
    DummyQubit() -> 0,1
"""
function qubit_information(::DummyQubit)
    x = rand([0,1])
    return string("|",x,">")
end


"""
    ComputationRound() -> get kπ/4 k∈0..7
"""
function qubit_information(::ComputationRound)
    x = rand(0:7)
    if x == 0
        return string("|+>")
    else
        return string("|+",x,"π/4>")
    end
end