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
vals = grid .^2 - grid

f = MyLinInterp.LinearInterpolation(grid, vals)

f(1.2)    # => 0.3999...

f([2, 4, 7])  # => [2, 12, 42]
```
