# MyLinInterp.jl
julia code for interpolation

#usage

MyLinInterp
    : module

MyLinInterp.LinearInterpolation
    : (grid, vals) -> callable immutable object

MyLinInterp.LinearInterpolation(grid, vals)
    : x(of scalar, vector or matrix) -> value by interpolation(of scalar, vector or matrix)

#an example

```

include("MyLinInterp.jl")

grid = 1:10
vals = log(grid)

f = MyLinInterp.LinearInterpolation(grid, vals)

f(1.2)  # => 0.1386...

f([1.2, 1.3, 1.4])  # => [0.138629, 0.207944, 0.2772592]

f([1.5 2.5; 3.5 4.5]) # => [0.346574 0.89588; 1.24245 1.49787]
```
