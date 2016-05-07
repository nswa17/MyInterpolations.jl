# MyLinInterp.jl
julia code for interpolation

#usage

```

include("MyLinInterp.jl")

f = MyLinInterp.LinearInterpolation(grid, vals) #for given grid, vals

f(x) # for x of scalar, vector, matrix

```

#example

```

include("MyLinInterp.jl")

grid = 1:10
vals = grid .^2 - grid

f = MyLinInterp.LinearInterpolation(grid, vals)

f(1.2)    # => 0.3999...

f([2, 4, 7])  # => [2, 12, 42]
```
