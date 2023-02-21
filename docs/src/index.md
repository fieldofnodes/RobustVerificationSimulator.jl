# RobustVerification.jl

```@contents
```

```@meta
    CurrentModule = RobustVerificationSimulator
```


## Structs

```@docs
    Redo
```

```@docs
    Test
```

```@docs
    Computation
```

```@docs
    Trap
```

```@docs
    Dummy
```


```@docs
    ComputationQubit
```

```@docs
    Input
```

```@docs
    NotInput
```

```@docs
    Ok
```

```@docs
    Abort
```

## Graph based functions

```@docs
    generate_simple_graph
```

```@docs
    generate_random_greedy_color
```

```@docs
    separate_each_color
```

```@docs
    get_random_coloring
```

```@docs
    generate_property_graph!
```

## Plot graph colourings

```@docs
    contruct_coloring_plot_for_one_color
```

```@docs
    contruct_coloring_plot_for_all_colors
```

```@docs
    contruct_coloring_plot_for_no_colors
```

## Round functions

Including functions dealing with  `Computation` or `Test` and further for `Trap` or `Dummy` qubit tyes.

```@docs
    choose_test_computation
```

```@docs
    return_ok_or_abort
```

```@docs
    get_round_result
```

```@docs
    qubit_information
```

```@docs
    compare_trap_test
```

## Redo function

```@docs
    do_redo
```

## Compute angle function

```@docs
    compute_δᵥ
```

## Helper functions

```@docs
    get_ratio_between_two_types
```

```@docs
    rand_int
```

```@docs
    probability_asser
```

```@docs
    error_call_not_test_computation
```

## Index

```@index
```