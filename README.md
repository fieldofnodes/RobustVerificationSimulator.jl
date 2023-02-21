# RobustVerificationSimulator.jl

## Paper

Verifying BQP Computations on Noisy Devices with Minimal Overhead
Dominik Leichtle, Luka Music, Elham Kashefi, and Harold Ollivier
PRX Quantum 2, 040302 – Published 4 October 2021

[Paper](https://journals.aps.org/prxquantum/abstract/10.1103/PRXQuantum.2.040302)

### Abstract

With the development of delegated quantum computation, clients will want to ensure conﬁdentiality of their data and algorithms and the integrity of their computations. While protocols for blind and veriﬁable quantum computation exist, they suﬀer from high overheads and from oversensitivity: when running on noisy devices, imperfections trigger the same detection mechanisms as malicious attacks, resulting in perpetually aborted computations. We introduce the ﬁrst blind and veriﬁable protocol for delegating bounded-error quantum polynomial (BQP) computations to a powerful server, with repetition as the only overhead. It is composable and statistically secure with exponentially low bounds and can tolerate a constant amount of global noise.

## Code development

To initiate the process of developing the protocol into a code, this repository was created. The code developement here acts as a loose framework to construct each element of the protocol. As of 21/02/2023 no quantum simulator or computer has been developed or attached. This will be updated as the code develops.


## Docs

I have not set up the automatic docs yet.

But here is the [link to the current incomplete set of docs](https://fieldofnodes.github.io/RobustVerificationSimulator.jl/).

## Add package

This package has not been added to the general registry yet.

Add package by

```julia
] add https://github.com/fieldofnodes/RobustVerificationSimulator.jl
```

As per usual add this to your script.

```julia

using RobustVerificationSimulator

```

