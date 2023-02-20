

"""
Computation of δᵥ
Cases
1. Round ≡ Test ∩ Qubit ≡ Dummy
    → δᵥ = {kπ/r | k ∼ U(0..7)}
2. Round ≡ Test ∩ Qubit ≡ Trap
    → δᵥ = θᵥ + rᵥπ
3. Round ≡ Computation ∩ Qubit ∈ Input set
    → δᵥ = ϕᵥ + (θᵥ + xᵥπ) + rᵥπ
4. Roiund ≡ Computation ∩ Qubiut ∉ Input set
    → δᵥ = ϕᵥ′ + θᵥ + rᵥπ
"""


"""
Computation of δᵥ
Case
1. Round ≡ Test ∩ Qubit ≡ Dummy
    → δᵥ = {kπ/r | k ∼ U(0..7)}
"""
function compute_δᵥ(::Test,::Dummy)
    return "{kπ/r | k ∼ U(0..7)}"
end


"""
Computation of δᵥ
Case
2. Round ≡ Test ∩ Qubit ≡ Trap
    → δᵥ = θᵥ + rᵥπ
"""
function compute_δᵥ(::Test,::Trap)
    return "θᵥ + rᵥπ"
end


"""
Computation of δᵥ
Case
3. Round ≡ Computation ∩ Qubit ∈ Input set
    → δᵥ = ϕᵥ + (θᵥ + xᵥπ) + rᵥπ
"""
function compute_δᵥ(::Computation,::Input)
    return "ϕᵥ + (θᵥ + xᵥπ) + rᵥπ"
end


"""
Computation of δᵥ
Case
4. Round ≡ Computation ∩ Qubiut ∉ Input set
    → δᵥ = ϕᵥ′ + θᵥ + rᵥπ
"""
function compute_δᵥ(::Computation,::NotInput)
    return "ϕᵥ′ + θᵥ + rᵥπ"
end



"""
Temporary function till I implement/figure out the 
    input/output set
Computation of δᵥ
Case
4. Round ≡ Computation ∩ Qubiut ∉ Input set
    → δᵥ = ϕᵥ′ + θᵥ + rᵥπ
"""
function compute_δᵥ(::Computation,::ComputationQubit)
    return "ϕᵥ′ + θᵥ + rᵥπ"
end

