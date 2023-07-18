# Protocol prototype version 01

This is a simple script I developed to get familiar the protocol ideas.


```julia
using Pkg
Pkg.activate(".")

using Statistics 
using CairoMakie


struct Test end
struct Computation end
struct Ok end
struct Abort end
struct Redo end

// # Functions

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
    Get ratio of occurence between two types
    """
    function get_ratio_between_two_types(types_vec,types_test)

        N = length(types_vec)

        count_of_type1 = sum(map(r -> r isa typeof(types_test[1]),types_vec))
        count_of_type2 = sum(map(r -> r isa typeof(types_test[2]),types_vec))

        ratio_of_type1 = count_of_type1/N
        ratio_of_type2 = count_of_type2/N
        type1_str = replace(string(types_test[1]),"()"=>"")
        type2_str = replace(string(types_test[2]),"()"=>"")

        results = (
            type1 = (type1_str,ratio_of_type1),
            type2 = (type2_str, ratio_of_type2))
        return results
    end



//



// # Version 01 
    p₁ = p₂ = 0.5
    N = 1000
    rounds = map(x -> choose_test_computation(p),1:N)
    test_comp_types = [TestRound(),ComputationRound()]
    rounds = map(x -> choose_test_computation(p₁),1:N)
    test_com_ratio = get_ratio_between_two_types(rounds,test_comp_types)


    

    """
        Bar plot for a single iteration of N rounds.
        Count number of tests and computations.
        Return proportion as a barplot.
    """
    f = Figure(resolution = (800,600))
    xs = [1,2]
    ys = [ratio_of_tests,ratio_of_computations]
    types = ["Test","Computation"]
    ax = Axis(
        f[1,1],
        xlabel = "Type",ylabel="proportion",
        xticks = (xs, types),
        title = "Proportion of tests to computations")
    barplot!(ax,xs,ys)
    f
//



// # Version 02
p₁ = p₂ = 0.5
N = 1000
test_comp_types = [TestRound(),ComputationRound()]
abort_ok_types = [Abort(),Ok()]

rounds = map(x -> choose_test_computation(p₁),1:N)
results = map(r -> get_round_result(r,p₂),rounds)
abort_ok_ratio = get_ratio_between_two_types(results,abort_ok_types)


    """
        Bar plot for a single iteration of N rounds.
        Count number of aborts and oks
        Return proportion as a barplot.
    """
    f = Figure(resolution = (800,600))
        xs = [1,2]
        xs_tick = [abort_ok_ratio[1][1],abort_ok_ratio[2][1]]
        ys = [abort_ok_ratio[1][2],abort_ok_ratio[2][2]]
        ax = Axis(
            f[1,1],
            xlabel = "Type",ylabel="proportion",
            xticks = (xs, xs_tick),
            title = "Proportion of $(xs_tick[1]) to $(xs_tick[2])")
        barplot!(ax,xs,ys)
    f
//


// # Test redo
    samesies = []
    p = 0.5        
    for i in 1:N
        u₁ = rand()
        u₂ = do_redo(u₁,p)
        res = u₁ == u₂
        push!(samesies,res)
    end

    
    B = [(i, count(==(i), samesies)/N) for i in unique(samesies)]

    """
        Server and Client perform same sub-protocol
        Client sends |V| -> Server
        

    """


//


```