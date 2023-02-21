# Synbolics

It is possible to use julia for symbolic algedbra. As I was working through my understanding of the protocal, I wondered if it would be useful to have some symbolic representaion of the BraKet algebra. I have not progressed very far.




```julia
using Pkg
Pkg.activate(".")
using Symbolics
@variables ϕᵥ k sᵥˣ sᵥᶻ rᵥ xᵥ

"""
    Computation
    v∈I
    Client: θ̃ᵥ = θᵥ + xᵥπ
    xᵥ: Stored choicxe for {0,1}
        Needed for recovering the original angle
    δᵥ = ϕᵥ′ + θ̃ᵥ + rᵥπ 
"""
ϕᵥ′ = (-1)^sᵥˣ*ϕᵥ+sᵥᶻ*Num(π)
θᵥ =  k*Num(π)/4
θ̃ᵥ = θᵥ + xᵥ*Num(π)
rπ = rᵥ*Num(π)    
δᵥ = ϕᵥ′ + θ̃ᵥ + rπ 

"""
    Test
    v∉Vⱼ
    Client: δᵥ = {k|k∼U(0..7) : kπ/4}
    v∈V
    Client: δᵥ = θᵥ + rᵥπ, rᵥ∼U(0..1)
"""
# v∉Vⱼ
θᵥ =  k*Num(π)/4
δᵥ = θᵥ
#v∈V
rπ = rᵥ*Num(π)    
θᵥ =  k*Num(π)/4
δᵥ = θᵥ + rπ



"""
   Substitutions
"""
substitute(δᵥ,Dict(ϕᵥ => π/4, k => 1, sᵥˣ => 1, sᵥᶻ => 1, rᵥ => 1)) 
substitute(rπ,Dict(rᵥ => 1))


"""
    I still need to build the "sending to server part" 
    I send δᵥ to the server and the server send back bᵥ
"""

```