# Learning to use BraKets in Julia

There is a package QBase which will allow one to implelement the Dirac notation.
These functions will be included in the package once I am ready to do so.

```julia

using Pkg
Pkg.activate(".")
using QBase

struct TrigIdentity end

function euler_identity(::TrigIdentity,ϕ)
    return cos(ϕ) + Complex(0,1)*sin(ϕ)
end

function bra_ket_plus(::TrigIdentity,ϕ)
    ψ = (1/√2) .* (Ket([1,0]) + euler_identity(TrigIdentity(),ϕ)*Ket([0,1]))
    ψ = Ket(ψ)
    return ψ*ψ'
end

function bra_ket_minus(::TrigIdentity,ϕ)
    ψ = (1/√2) .* (Ket([1,0]) - euler_identity(TrigIdentity(),ϕ)*Ket([0,1]))
    ψ = Ket(ψ)
    return ψ*ψ'
end

function get_state_from_angle(ϕ)
    ψ = (1/√2) .* (Ket([1,0]) + euler_identity(TrigIdentity(),ϕ)*Ket([0,1]))
    return Ket(ψ)
end

function get_conj_perp(ψ)
    ψ₁ = adjoint(ψ)
    ψ⊥ = Ket([ψ₁[2], -ψ₁[1]])
    return ψ⊥
end

function measure_according_state(ψ,ψ⊥)
    return (Bra(ψ)*(ψ*ψ' - ψ⊥*ψ⊥')*ψ)[1]
end

ϕ = π/4 
ψ = get_state_from_angle(ϕ)
M₀ = bra_ket_plus(TrigIdentity(),ϕ)
M₁ = bra_ket_minus(TrigIdentity(),ϕ)



function measuare_from_angle(ϕ)
    ψ = get_state_from_angle(ϕ)
    ψ⊥ = get_conj_perp(ψ)
    meas_ϕ = measure_according_state(ψ,ψ⊥)
    meas_ϕ = round(meas_ϕ,digits=0)
    return meas_ϕ
end 

rand_ϕ() = rand([0,7])*π/4

res = [measuare_from_angle(rand_ϕ()) for i in 1:1000]




M₁ == M₁^2
M₀^2 + M₁^2


POVM(M₀)
ψ == adjoint(ψ)

adjoint(M₀)*M₀ + adjoint(M₁)*M₁

Bra(ψ)*M₀*ψ
Bra(ψ)*M₁*ψ

(M₀*ψ)/sqrt((Bra(ψ)*adjoint(M₀)*M₀*ψ)[1].re)

Bra([1,0]) == adjoint(Ket([1,0]))

```